package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.ThreadInfoDTO;
import connect.DatabaseConnection;

public class ThreadInfoDAO {

    // スレッドの情報を取得するメソッド
    public List<ThreadInfoDTO> getThreadInfo(int threadId) throws ClassNotFoundException, SQLException {
        List<ThreadInfoDTO> threadInfoList = new ArrayList<>();

        // データベース接続を取得
        try (Connection connection = DatabaseConnection.getConnection()) {
            // SQL文を準備（スレッド名を含む）
            String sql = "SELECT p.post_id, p.content, p.post_user_name, p.create_time, p.likes, p.post_reply_id, t.thread_name "
                       + "FROM post p JOIN thread t ON p.thread_id = t.thread_id "
                       + "WHERE p.thread_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                // スレッドIDを設定
                statement.setInt(1, threadId);
                // SQL文を実行し、結果を取得
                try (ResultSet resultSet = statement.executeQuery()) {
                    // 結果をDTOに格納
                    while (resultSet.next()) {
                        ThreadInfoDTO threadInfoDTO = new ThreadInfoDTO();
                        threadInfoDTO.setThreadId(threadId);
                        threadInfoDTO.setPostId(resultSet.getInt("post_id"));
                        threadInfoDTO.setThreadName(resultSet.getString("thread_name"));
                        threadInfoDTO.setContent(resultSet.getString("content"));
                        threadInfoDTO.setPostUserName(resultSet.getString("post_user_name"));
                        threadInfoDTO.setLikes(resultSet.getInt("likes"));
                        threadInfoDTO.setCreateTime(resultSet.getTimestamp("create_time"));
                        threadInfoDTO.setPostReplyId(resultSet.getInt("post_reply_id"));
                        threadInfoList.add(threadInfoDTO);
                    }
                }
            }
        }

        return threadInfoList;
    }
}
