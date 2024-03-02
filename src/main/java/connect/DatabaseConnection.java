package connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String url = "jdbc:oracle:thin:@localhost:1521:orcl";    // データベースのURL
    private static final String user = "info";  // データベースのユーザー名
    private static final String pass = "pro";    // データベースのパスワード

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("oracle.jdbc.driver.OracleDriver");  // JDBCドライバをロード

        // データベースに接続
        Connection connection = DriverManager.getConnection(url, user, pass);
        return connection;
    }

    public void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();  // 接続を閉じる
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
