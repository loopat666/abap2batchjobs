*&---------------------------------------------------------------------*
*& Report ZZABAP02BATCHR010
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zzabap02batchr010.


parameters p_jobnm type char10.
parameters p_sec type i obligatory default 1.




start-of-selection.

  message |JOBNAME: { p_jobnm } start.| type `S`.

  wait up to p_sec seconds.

  message |wait up to { p_sec } seconds| type `S`.

  message |JOBNAME: { p_jobnm } end.| type `S`.
