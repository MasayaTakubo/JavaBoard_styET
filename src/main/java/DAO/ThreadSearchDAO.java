package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.ThreadSearchDTO;
import connect.DatabaseConnection;

/*searchByThreadTitle...OK
  searchByCreatorName...OK
  searchByPostUserName...OK
  searchByThreadId...OK
  searchByContent...OK
*/
public class ThreadSearchDAO {
    public static List<ThreadSearchDTO> searchByThreadTitle(String keyword) throws ClassNotFoundException {
        List<ThreadSearchDTO> searchResults = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseConnection.getConnection(); // データベースの接続を取得

            // SQLクエリを準備
            String sql = "SELECT t.thread_id, t.thread_name, t.creator_name, p.post_user_name, p.content " +
                    "FROM thread t JOIN post p ON t.thread_id = p.thread_id " +
                    "WHERE t.THREAD_NAME LIKE ? ORDER BY t.thread_id";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + keyword + "%");

            // SQLクエリを実行し、結果を取得
            rs = pstmt.executeQuery();
            while (rs.next()) {
                // 結果をDTOに変換してリストに追加
                ThreadSearchDTO dto = new ThreadSearchDTO();
                dto.setThreadId(rs.getInt("thread_id"));
                dto.setThreadTitle(rs.getString("THREAD_NAME"));
                dto.setCreatorName(rs.getString("creator_name"));
                dto.setPosterName(rs.getString("post_user_name"));
                dto.setContent(rs.getString("content"));
                searchResults.add(dto);

                // 結果を表示（デバッグ用）
                System.out.println("Thread ID: " + dto.getThreadId());
                System.out.println("Thread Name: " + dto.getThreadTitle());
                System.out.println("Creator Name: " + dto.getCreatorName());
                System.out.println("Post User Name: " + dto.getPosterName());
                System.out.println("Content: " + dto.getContent());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // リソースの解放処理
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return searchResults;
    }

    public static List<ThreadSearchDTO> searchByCreatorName(String keyword) throws ClassNotFoundException {
        List<ThreadSearchDTO> searchResults = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseConnection.getConnection(); // データベースの接続を取得

            // SQLクエリを準備
            String sql = "SELECT t.thread_id, t.thread_name, t.creator_name, p.post_user_name, p.content " +
                    "FROM thread t JOIN post p ON t.thread_id = p.thread_id " +
                    "WHERE t.CREATOR_NAME LIKE ? ORDER BY t.thread_id";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + keyword + "%");

            // SQLクエリを実行し、結果を取得
            rs = pstmt.executeQuery();

            // 結果をDTOに変換してリストに追加
            while (rs.next()) {
                ThreadSearchDTO dto = new ThreadSearchDTO();
                dto.setThreadId(rs.getInt("thread_id"));
                dto.setThreadTitle(rs.getString("thread_name"));
                dto.setCreatorName(rs.getString("CREATOR_NAME"));
                dto.setPosterName(rs.getString("post_user_name"));
                dto.setContent(rs.getString("content"));
                searchResults.add(dto);
                // 結果を表示（デバッグ用）
                System.out.println("Thread ID: " + dto.getThreadId());
                System.out.println("Thread Name: " + dto.getThreadTitle());
                System.out.println("Creator Name: " + dto.getCreatorName());
                System.out.println("Post User Name: " + dto.getPosterName());
                System.out.println("Content: " + dto.getContent());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // リソースの解放処理
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return searchResults;
    }

    public static List<ThreadSearchDTO> searchByPostUserName(String keyword) throws ClassNotFoundException {
        List<ThreadSearchDTO> searchResults = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseConnection.getConnection(); // データベースの接続を取得

            // SQLクエリを準備
            String sql = "SELECT t.thread_id, t.thread_name, t.creator_name, p.post_user_name, p.content " +
                    "FROM thread t JOIN post p ON t.thread_id = p.thread_id " +
                    "WHERE p.POST_USER_NAME LIKE ? ORDER BY t.thread_id";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + keyword + "%");

            // SQLクエリを実行し、結果を取得
            rs = pstmt.executeQuery();

            // 結果をDTOに変換してリストに追加
            while (rs.next()) {
                ThreadSearchDTO dto = new ThreadSearchDTO();
                dto.setThreadId(rs.getInt("thread_id"));
                dto.setThreadTitle(rs.getString("thread_name"));
                dto.setCreatorName(rs.getString("creator_name"));
                dto.setPosterName(rs.getString("POST_USER_NAME"));
                dto.setContent(rs.getString("content"));
                // 結果を表示（デバッグ用）
                System.out.println("Thread ID: " + dto.getThreadId());
                System.out.println("Thread Name: " + dto.getThreadTitle());
                System.out.println("Creator Name: " + dto.getCreatorName());
                System.out.println("Post User Name: " + dto.getPosterName());
                System.out.println("Content: " + dto.getContent());
                searchResults.add(dto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // リソースの解放処理
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return searchResults;
    }

    public static List<ThreadSearchDTO> searchByThreadId(int keyword) throws ClassNotFoundException {
        List<ThreadSearchDTO> searchResults = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseConnection.getConnection(); // データベースの接続を取得

            // SQLクエリを準備
            String sql = "SELECT t.thread_id, t.thread_name, t.creator_name, p.post_user_name, p.content " +
                    "FROM thread t JOIN post p ON t.thread_id = p.thread_id " +
                    "WHERE t.thread_id = ? ORDER BY t.thread_id";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, keyword);

            // SQLクエリを実行し、結果を取得
            rs = pstmt.executeQuery();

            // 結果をDTOに変換してリストに追加
            while (rs.next()) {
                ThreadSearchDTO dto = new ThreadSearchDTO();
                dto.setThreadId(rs.getInt("thread_id"));
                dto.setThreadTitle(rs.getString("thread_name"));
                dto.setCreatorName(rs.getString("creator_name"));
                dto.setPosterName(rs.getString("post_user_name"));
                dto.setContent(rs.getString("content"));
                searchResults.add(dto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // リソースの解放処理
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return searchResults;
    }

    public static List<ThreadSearchDTO> searchByContent(String keyword) throws ClassNotFoundException {
        List<ThreadSearchDTO> searchResults = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseConnection.getConnection(); // データベースの接続を取得

            // SQLクエリを準備
            String sql = "SELECT t.thread_id, t.thread_name, t.creator_name, p.post_user_name, p.content " +
                    "FROM thread t JOIN post p ON t.thread_id = p.thread_id " +
                    "WHERE p.CONTENT LIKE ? ORDER BY t.thread_id";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + keyword + "%");

            // SQLクエリを実行し、結果を取得
            rs = pstmt.executeQuery();

            // 結果をDTOに変換してリストに追加
            while (rs.next()) {
                ThreadSearchDTO dto = new ThreadSearchDTO();
                dto.setThreadId(rs.getInt("thread_id"));
                dto.setThreadTitle(rs.getString("thread_name"));
                dto.setCreatorName(rs.getString("creator_name"));
                dto.setPosterName(rs.getString("post_user_name"));
                dto.setContent(rs.getString("CONTENT"));
                //デバッグ用
                System.out.println("Thread ID: " + dto.getThreadId());
                System.out.println("Thread Name: " + dto.getThreadTitle());
                System.out.println("Creator Name: " + dto.getCreatorName());
                System.out.println("Post User Name: " + dto.getPosterName());
                System.out.println("Content: " + dto.getContent());
                searchResults.add(dto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // リソースの解放処理
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return searchResults;
    }
}
