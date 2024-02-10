package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.ThreadSearchDTO;
import connect.DatabaseConnection;

public class ThreadSearchDAO {
    public static List<ThreadSearchDTO> searchByThreadTitle(String keyword) throws ClassNotFoundException {
        List<ThreadSearchDTO> searchResults = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            conn = DatabaseConnection.getConnection(); // データベースの接続を取得
            
            // SQLクエリを準備
            String sql = "SELECT * FROM thread WHERE thread_name LIKE ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + keyword + "%");
            
            // SQLクエリを実行し、結果を取得
            rs = pstmt.executeQuery();
            
            // 結果をDTOに変換してリストに追加
            while (rs.next()) {
                ThreadSearchDTO dto = new ThreadSearchDTO();
                dto.setThreadId(rs.getInt("thread_id"));
                dto.setThreadTitle(rs.getString("thread_name"));
                dto.setCreatorName(rs.getString("creatname"));
                dto.setPosterName(rs.getString("poster_name"));
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
    
    public static List<ThreadSearchDTO> searchByCreatorName(String keyword) throws ClassNotFoundException {
        List<ThreadSearchDTO> searchResults = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            conn = DatabaseConnection.getConnection(); // データベースの接続を取得
            
            // SQLクエリを準備
            String sql = "SELECT * FROM thread WHERE creator_name LIKE ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + keyword + "%");
            
            // SQLクエリを実行し、結果を取得
            rs = pstmt.executeQuery();
            
            // 結果をDTOに変換してリストに追加
            while (rs.next()) {
                ThreadSearchDTO dto = new ThreadSearchDTO();
                dto.setThreadId(rs.getInt("thread_id"));
                dto.setThreadTitle(rs.getString("thread_title"));
                dto.setCreatorName(rs.getString("creator_name"));
                dto.setPosterName(rs.getString("poster_name"));
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
    
    public static List<ThreadSearchDTO> searchByPostUserName(String keyword) throws ClassNotFoundException {
        List<ThreadSearchDTO> searchResults = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            conn = DatabaseConnection.getConnection(); // データベースの接続を取得
            
            // SQLクエリを準備
            String sql = "SELECT * FROM post WHERE post_user_name LIKE ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + keyword + "%");
            
            // SQLクエリを実行し、結果を取得
            rs = pstmt.executeQuery();
            
            // 結果をDTOに変換してリストに追加
            while (rs.next()) {
                ThreadSearchDTO dto = new ThreadSearchDTO();
                dto.setThreadId(rs.getInt("thread_id"));
                dto.setThreadTitle(rs.getString("thread_title"));
                dto.setCreatorName(rs.getString("creator_name"));
                dto.setPosterName(rs.getString("poster_name"));
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
    
    public static List<ThreadSearchDTO> searchByThreadId(int keyword) throws ClassNotFoundException {
        List<ThreadSearchDTO> searchResults = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            conn = DatabaseConnection.getConnection(); // データベースの接続を取得
            
            // SQLクエリを準備
            String sql = "SELECT * FROM thread WHERE thread_id = ?";
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
                dto.setPosterName(rs.getString("poster_name"));
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
            String sql = "SELECT * FROM post WHERE content LIKE ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + keyword + "%");
            
            // SQLクエリを実行し、結果を取得
            rs = pstmt.executeQuery();
            
            // 結果をDTOに変換してリストに追加
            while (rs.next()) {
                ThreadSearchDTO dto = new ThreadSearchDTO();
                dto.setThreadId(rs.getInt("thread_id"));
                dto.setThreadTitle(rs.getString("thread_title"));
                dto.setCreatorName(rs.getString("creator_name"));
                dto.setPosterName(rs.getString("poster_name"));
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
}
