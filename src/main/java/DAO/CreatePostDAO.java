package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
                
                int postReplyId = createPostDTO.getPostReplyId();
                if (postReplyId >= 1) {
                    if (doesPostExist(postReplyId)) {
                        statement.setInt(4, postReplyId);
                    } else {
                        statement.setNull(4, java.sql.Types.INTEGER);
                    }
                } else {
                    statement.setNull(4, java.sql.Types.INTEGER);
                }

                // SQL文を実行
                statement.executeUpdate();
            }
        }
    }
    public boolean doesPostExist(int postId) throws SQLException, ClassNotFoundException {
        String sql = "SELECT 1 FROM Post WHERE Post_ID = ?";
        Connection connection = DatabaseConnection.getConnection();
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, postId);
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();  // Post_IDが存在すればtrue、存在しなければfalse
            }
        }
    }
}
