ALTER SESSION SET  "_ORACLE_SCRIPT" = TRUE;

CREATE USER KH_PROJECT IDENTIFIED BY PROJECT; -- PROJECT 계정 생성
GRANT CONNECT, RESOURCE, DBA TO KH_PROJECT; -- 권한주기

ALTER USER KH_PROJECT DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

COMMIT;

