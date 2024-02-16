

DROP SEQUENCE Image_ID_Sequence;
drop table image;

DROP SEQUENCE Post_ID_Sequence;
drop table post;

DROP SEQUENCE Thread_ID_Sequence;
drop table Thread;

CREATE SEQUENCE Thread_ID_Sequence
START WITH 1
INCREMENT BY 1
MAXVALUE 9999
NOCACHE;

CREATE TABLE THREAD (
Thread_ID NUMBER(4, 0) DEFAULT Thread_ID_Sequence.NEXTVAL
,Thread_Name VARCHAR2(60)  NOT NULL 
,Creator_name VARCHAR2(100) DEFAULT '����������'
,Create_time  TIMESTAMP(0) DEFAULT SYSDATE
,CONSTRAINT PK_Thread_ID PRIMARY KEY (Thread_ID)
,CONSTRAINT UQ_Thread_Name UNIQUE(Thread_Name)
);


CREATE SEQUENCE Post_ID_Sequence
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCACHE;

CREATE TABLE Post (
Post_ID NUMBER(5, 0) DEFAULT Post_ID_Sequence.NEXTVAL PRIMARY KEY ,
Thread_ID NUMBER(4, 0) NOT NULL,
Content VARCHAR2(2000) NOT NULL,
Post_User_Name VARCHAR2(100) DEFAULT '名無しさん',
Create_time TIMESTAMP(0) DEFAULT SYSDATE,
Likes NUMBER(2, 0) DEFAULT 0,
Post_Reply_ID NUMBER(5, 0) NULL,
CONSTRAINT FK_Post_Thread_ID FOREIGN KEY (Thread_ID) REFERENCES Thread(Thread_ID),
CONSTRAINT FK_Post_Reply_ID FOREIGN KEY (Post_Reply_ID) REFERENCES Post(Post_ID)
ON DELETE SET NULL
);


CREATE SEQUENCE Image_ID_Sequence
START WITH 1
INCREMENT BY 1
MAXVALUE 9999
NOCACHE;

CREATE TABLE Image (
Image_ID NUMBER(4, 0) DEFAULT Image_ID_Sequence.NEXTVAL CONSTRAINT PK_Image_ID PRIMARY KEY 
,Post_ID NUMBER(5, 0) CONSTRAINT FK_Image_Post_ID REFERENCES Post(Post_ID)
,File_Path VARCHAR2(512)  NOT NULL
,File_Name VARCHAR2(100)  NOT NULL
,CONSTRAINT UQ_Image_File_Path UNIQUE(File_path)
);




