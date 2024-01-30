CREATE SEQUENCE Post_ID_Sequence
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCACHE;


CREATE TABLE Post (
Post_ID NUMBER(5, 0) DEFAULT Post_ID_Sequence.NEXTVAL CONSTRAINT PK_Post_ID PRIMARY KEY 
,Thread_ID NUMBER(4, 0) CONSTRAINT FK_Post_Thread_ID REFERENCES Thread(Thread_ID)
,Content VARCHAR2(2000) NOT NULL
,Post_User_Name VARCHAR2(100) DEFAULT '名無しさん'
,Create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
,Likes NUMBER(2, 0) DEFAULT 0
,Post_Reply_ID NUMBER(3, 0) REFERENCES Post(Post_ID)
,CONSTRAINT FK_Post_Reply_ID FOREIGN KEY (Post_Reply_ID) REFERENCES Post(Post_ID)
);