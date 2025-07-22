*&---------------------------------------------------------------------*
*& Report ZZABAP02BATCHR011
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zzabap02batchr011.


data: lv_jobcount     type btcjobcnt,
      lv_strtimmed    type char1,
      lv_pred_jobname type btcjob.

parameters p_jobcat type zzabap02tb5001-jobcategory default `ZTEST`.


start-of-selection.

  select from zzabap02tb5001
    fields *
    where jobcategory eq @p_jobcat
    order by jobcategory, jobseq
    into table @data(lt_jobs).
  if sy-subrc ne 0.
    message `No jobs.` type `S` display like `E`.
    exit.
  endif.


  cl_demo_output=>write_data( lt_jobs ).

  cl_demo_output=>display( ).


  loop at lt_jobs into data(ls_jobs).

    "1. JOB_OPEN: 잡 생성 및 초기화
    clear lv_jobcount.
    call function 'JOB_OPEN'
      exporting
        jobname          = ls_jobs-jobname
      importing
        jobcount         = lv_jobcount
      exceptions
        cant_create_job  = 1
        invalid_job_data = 2
        jobname_missing  = 3
        others           = 99.
    if sy-subrc ne 0.
      continue.
    endif.

    call function 'JOB_SUBMIT'
      exporting
        authcknam         = conv btcauthnam( sy-uname )
        jobname           = ls_jobs-jobname
        jobcount          = lv_jobcount
        report            = ls_jobs-abapname        "실행 프로그램
        variant           = conv raldb_vari( ls_jobs-variant )           "프로그램 Variant
      exceptions
        bad_priparams     = 1
        bad_xpgflags      = 2
        internal_error    = 3
        jobname_missing   = 4
        job_notex         = 5
        job_submit_failed = 6
        lock_failed       = 7
        program_missing   = 8
        others            = 99.
    if sy-subrc ne 0.
      continue.
    endif.

    if ls_jobs-strtimmed eq `X`.
      lv_strtimmed = `X`.
    else.

      clear lv_strtimmed.

      if ls_jobs-pred_jobname is not initial.
        lv_pred_jobname = ls_jobs-pred_jobname.
      endif.

    endif.


    call function 'JOB_CLOSE'
      exporting
        jobname              = ls_jobs-jobname
        jobcount             = lv_jobcount
        strtimmed            = lv_strtimmed      "즉시 실행 플래그
        pred_jobname         = lv_pred_jobname
      exceptions
        cant_start_immediate = 1
        invalid_startdate    = 2
        jobname_missing      = 3
        job_close_failed     = 4
        job_notopen          = 5
        job_close_canceled   = 6
        others               = 99.



  endloop.
