package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import DTO.ThreadInfoDTO;
import connect.DatabaseConnection;

public class ThreadInfoDAO {

    // スレッドの情報を取得するメソッド
    public List<ThreadInfoDTO> getThreadInfo(int threadId) throws ClassNotFoundException, SQLException {
        List<ThreadInfoDTO> threadInfoList = new ArrayList<>();
        Map<Integer, ThreadInfoDTO> parentPostsMap = new HashMap<>();

        // データベース接続を取得
        try (Connection connection = DatabaseConnection.getConnection()) {
            // SQL文を準備（スレッド名を含む）
            String sql = "SELECT p.post_id, p.content, p.post_user_name, p.create_time, p.likes, p.post_reply_id, t.thread_name "
                    + "FROM post p JOIN thread t ON p.thread_id = t.thread_id "
                    + "WHERE p.thread_id = ? ORDER BY p.post_id";
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
                        String userName = resultSet.getString("post_user_name");
                        if (userName == null || userName.isEmpty()) {
                            userName = "名無しさん";
                        }
                        threadInfoDTO.setPostUserName(userName);
                        threadInfoDTO.setLikes(resultSet.getInt("likes"));
                        threadInfoDTO.setCreateTime(resultSet.getTimestamp("create_time"));
                        threadInfoDTO.setPostReplyId(resultSet.getInt("post_reply_id"));

                        if (threadInfoDTO.getPostReplyId() == 0) { // 親投稿
                            parentPostsMap.put(threadInfoDTO.getPostId(), threadInfoDTO);
                            threadInfoList.add(threadInfoDTO);
                        } else { // 子投稿
                            ThreadInfoDTO parentPost = parentPostsMap.get(threadInfoDTO.getPostReplyId());
                            if (parentPost != null) {
                                if (parentPost.getChildPosts() == null) {
                                    parentPost.setChildPosts(new ArrayList<>());
                                }
                                parentPost.getChildPosts().add(threadInfoDTO);
                            }
                        }
                    }
                }
            }
        }

        return threadInfoList;
    }

    public void incrementLikes(int postId) throws ClassNotFoundException, SQLException {
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "UPDATE post SET likes = likes + 1 WHERE post_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, postId);
                statement.executeUpdate();
            }
        }
    }

    public int getThreadIdByPostId(int postId) throws ClassNotFoundException, SQLException {
        int threadId = 0;
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT thread_id FROM post WHERE post_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, postId);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        threadId = resultSet.getInt("thread_id");
                    }
                }
            }
        }
        return threadId;
    }
}
