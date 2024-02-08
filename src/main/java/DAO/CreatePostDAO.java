package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import DTO.CreatePostDTO;
import connect.DatabaseConnection;

public class CreatePostDAO {
    public void createPost(CreatePostDTO createPostDTO) throws ClassNotFoundException, SQLException {
        try (Connection connection = DatabaseConnection.getConnection()) {
            // SQL文を準備
            String sql = "INSERT INTO post (thread_id, content, post_user_name, post_reply_id) VALUES (?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                // パラメータをセット
                statement.setInt(1, createPostDTO.getThreadId());
                statement.setString(2, createPostDTO.getContent());
                statement.setString(3, createPostDTO.getPostUserName());
                statement.setInt(4, createPostDTO.getPostReplyId());

                // SQL文を実行
                statement.executeUpdate();
            }
        }
    }
}
