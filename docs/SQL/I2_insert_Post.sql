INSERT INTO Post (thread_id, content, post_user_name, post_reply_id)
VALUES (1, 'テスト', '<h1>スレッド作成者名のタグ文字エスケープ</h1>', NULL);
       
INSERT INTO Post (thread_id, content, post_user_name, post_reply_id)
VALUES(1, '本文の改行'||CHR(10)||'改行'||CHR(10)||'改行'||CHR(10)||'改行', '改行テスト', NULL);
      
INSERT INTO Post (thread_id, content, post_user_name, post_reply_id)
VALUES (1, '<h1>本文のタグ文字のエスケープ<h1>', '<h1>投稿者名のタグ文字のエスケープ</h1>', NULL);
      
INSERT INTO Post (thread_id, content, post_user_name, post_reply_id)
VALUES (1, '<h1>本文のタグ文字のエスケープ<h1>', '<h1>投稿者名のタグ文字のエスケープ</h1>', 3);
      
INSERT INTO Post (thread_id, content, post_user_name, post_reply_id)
VALUES (1, '改行には制限はないよ'||CHR(10)||''||CHR(10)||''||CHR(10)||''||CHR(10)||''||CHR(10)||''||CHR(10)||''||CHR(10)||''||CHR(10)||''||CHR(10)||''||CHR(10)||'', '返信の改行テスト', 2);
      

INSERT INTO Post (thread_id, content, post_user_name, post_reply_id)
VALUES (1, '＼(゜ロ＼)ココハドコ? (／ロ゜)／アタシハダアレ?＼(゜ロ＼)ココハドコ? (／ロ゜)／アタシハダアレ?＼(゜ロ＼)ココハドコ? (／ロ゜)／アタシハダアレ?＼(゜ロ＼)ココハドコ? (／ロ゜)／アタシハダアレ?＼(゜ロ＼)ココハドコ? (／ロ゜)／アタシハダアレ?', '横幅限界を超えた場合、自動で折り返される', NULL)

INSERT INTO Post (thread_id, content, post_user_name, post_reply_id)
VALUES (2, 'テスト', 'わいわい', NULL);

INSERT INTO Post (thread_id, content, post_user_name, post_reply_id)
VALUES (3, 'テスト','山の賑わい', NULL);

INSERT INTO Post (thread_id, content, post_user_name, post_reply_id)
VALUES (4, 'テスト', '都', NULL);

INSERT INTO Post (thread_id, content, post_user_name, post_reply_id)
VALUES (5, 'テスト','虎子を得ず', NULL);

INSERT INTO Post (thread_id, content, post_user_name, post_reply_id)
VALUES (6, 'テスト', '木から落ちる', NULL);

INSERT INTO Post (thread_id, content, post_user_name, post_reply_id)
VALUES (7, 'テスト', '手が出る', NULL);

INSERT INTO Post (thread_id, content, post_user_name, post_reply_id)
VALUES (8, 'テスト', '産むが易し', NULL);

INSERT INTO Post (thread_id, content, post_user_name, post_reply_id)
VALUES (9, 'テスト', '八起き', NULL);

INSERT INTO Post (thread_id, content, post_user_name, post_reply_id)
VALUES (10, 'テスト', '川流れ', NULL);

INSERT INTO Post (thread_id, content, post_user_name, post_reply_id)
VALUES (11, 'テスト', '三年', NULL);
INSERT INTO Post (thread_id, content, post_user_name, post_reply_id)
VALUES (12, 'テスト', '先の杖', NULL);

INSERT INTO Post (thread_id, content, post_user_name, post_reply_id)
VALUES (13, 'テスト', '鷹を生む', NULL);

INSERT INTO Post (thread_id, content, post_user_name, post_reply_id)
VALUES (14, 'テスト', '念仏', NULL);
INSERT INTO Post (thread_id, content, post_user_name, post_reply_id)
VALUES (15, 'テスト', '闇', NULL);

INSERT INTO Post (thread_id, content, post_user_name, post_reply_id)
VALUES (16, 'テスト', '真珠', NULL);

INSERT INTO Post (thread_id, content, post_user_name, post_reply_id)
VALUES (17, 'テスト', '二鳥', NULL);

INSERT INTO Post (thread_id, content, post_user_name, post_reply_id)
VALUES (18, 'テスト', '鬼はなし', NULL);

INSERT INTO Post (thread_id, content, post_user_name, post_reply_id)
VALUES (19, 'テスト', '蛙', NULL);

INSERT INTO Post (thread_id, content, post_user_name, post_reply_id)
VALUES (20, 'テスト', '馬', NULL);


commit;
exit;

