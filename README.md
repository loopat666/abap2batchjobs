# abap2batchjobs
ABAP to batch jobs


## Overview

SAP ABAP batch jobs in Program

### Excel files

<img width="50%" height="50%" alt="image" src="https://github.com/user-attachments/assets/1f128153-4675-4580-a717-2682fab5deeb" />


### Tables 

Table : `ZZABAP02TB5001` : Batch job Setting Table.


<img width="1652" height="705" alt="image" src="https://github.com/user-attachments/assets/fd639c69-9a84-4c2b-b3c7-5f91ab4b6f4c" />

<img width="1568" height="323" alt="image" src="https://github.com/user-attachments/assets/94ab79ea-3504-44b7-822c-98c5e53a7ee7" />



### Program

**Execution Prog**

ABAP Program, execute in Variants

```mermaid
graph TD;
    ZVAR01-->ZVAR02-->ZVAR03-->ZVAR04;
```

<img width="1652" height="833" alt="image" src="https://github.com/user-attachments/assets/b0c53c4c-211a-4d05-87ef-2eccff5824da" />

[code @zzabap02batchr010.prog.abap](/src/zzabap02batchr010.prog.abap)



**Job Setting Prog**

Batch Setting Program

Get Table `ZZABAP02TB5001`

[code @zzabap02batchr011.prog.abap](/src/zzabap02batchr011.prog.abap)

## Job Overview

Tcode : `SM37`

<img width="1895" height="807" alt="image" src="https://github.com/user-attachments/assets/c8aac393-f513-48e5-952d-360b53a5a2eb" />
