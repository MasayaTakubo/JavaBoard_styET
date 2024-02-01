@echo off

set /p DB_USER=���[�U�[������͂��Ă�������:

set /p DB_PASSWORD=�p�X���[�h����͂��Ă�������:

set DB_CONNECT=localhost:1521/orcl

set /p selectOracleSQL=Create or Drop(Enter:c/d) 

if "%selectOracleSQL%"=="c" (
    rem Create Table
    sqlplus %DB_USER%/%DB_PASSWORD%@%DB_CONNECT% @C1_create_Thread.sql
    sqlplus %DB_USER%/%DB_PASSWORD%@%DB_CONNECT% @C2_create_Post.sql
    sqlplus %DB_USER%/%DB_PASSWORD%@%DB_CONNECT% @C3_create_Image.sql
)else if "%selectOracleSQL%"=="d" (
    rem Drop Table
    sqlplus %DB_USER%/%DB_PASSWORD%@%DB_CONNECT% @D1_drop_Image.sql
    sqlplus %DB_USER%/%DB_PASSWORD%@%DB_CONNECT% @D2_drop_Post.sql
    sqlplus %DB_USER%/%DB_PASSWORD%@%DB_CONNECT% @D3_drop_Thread.sql
) else (
    rem error process
    echo mistake
    pause
)
