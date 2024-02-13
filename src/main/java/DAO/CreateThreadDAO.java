package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DTO.CreateThreadDTO;

public class CreateThreadDAO {
    // Threadを作成し、Postを投稿するメソッド
    public int createThreadAndPost(CreateThreadDTO threadDTO) throws SQLException, ClassNotFoundException {
    	String createThreadSQL = "INSERT INTO Thread (thread_name, creator_name) VALUES (?, ?)";
    	String createPostSQL = "INSERT INTO Post (thread_id, content,post_user_name) VALUES (?, ?, ?)";

        
        Connection connection = null;
        PreparedStatement createThreadPS = null;
        PreparedStatement createPostPS = null;
        ResultSet generatedKeys = null;
        int threadID = -1;
        
        try {
        	Class.forName("oracle.jdbc.driver.OracleDriver");
			
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","info","pro");
            connection.setAutoCommit(false); // トランザクションを開始
            
            // Threadを作成
            createThreadPS = connection.prepareStatement(createThreadSQL, new String[]{"thread_id"});
            createThreadPS.setString(1, threadDTO.getThreadName());
            createThreadPS.setString(2, threadDTO.getUserName());
            createThreadPS.executeUpdate();
            generatedKeys = createThreadPS.getGeneratedKeys();
            if (generatedKeys.next()) {
                threadID = generatedKeys.getInt(1); // 自動生成されたThreadIDを取得
            } else {
                throw new SQLException("Creating thread failed, no ID obtained.");
            }
            
            // Postを投稿
            createPostPS = connection.prepareStatement(createPostSQL);
            createPostPS.setInt(1, threadID);
            createPostPS.setString(2, threadDTO.getPostText());
            createPostPS.setString(3, threadDTO.getUserName());
            createPostPS.executeUpdate();
            
            connection.commit(); // トランザクションをコミット
            return threadID;
            
        } catch (SQLException e) {
            if (connection != null) {
                connection.rollback(); // エラーが発生した場合はロールバック
            }
            throw e;
        } finally {
            if (generatedKeys != null) {
                generatedKeys.close();
            }
            if (createThreadPS != null) {
                createThreadPS.close();
            }
            if (createPostPS != null) {
                createPostPS.close();
            }
            if (connection != null) {
                connection.setAutoCommit(true); // トランザクションを終了
                connection.close();
            }
        }
    }
}
