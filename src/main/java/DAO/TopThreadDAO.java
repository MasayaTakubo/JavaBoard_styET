package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.TopThreadDTO;
import connect.DatabaseConnection;

public class TopThreadDAO{

    private List<TopThreadDTO> DTOlist = new ArrayList<>();   //リストに格納

    //データベース一覧表示メソッド
    public List<TopThreadDTO> showAllList() throws ClassNotFoundException {
    	try(Connection connect = DatabaseConnection.getConnection()){
    	
        //データベースから氏名を取得するSQL文
        String sql ="select thread_id, thread_name, creator_name from thread";
        PreparedStatement ps = connect.prepareStatement(sql);

        //SQL文の実行
        ResultSet resultset = ps.executeQuery();

        while(resultset.next()){

            //データベースから取得した値をセット
            TopThreadDTO dto = new TopThreadDTO();

            //氏名の取得
            dto.setThread_ID(resultset.getInt("thread_id"));
            dto.setThread_Name(resultset.getString("thread_name"));
            dto.setCreator_Name(resultset.getString("creator_name"));
            

            DTOlist.add(dto);
        }

        resultset.close();
        ps.close();

        }catch(SQLException e) {
            e.printStackTrace();
        }
        return DTOlist;
    }
}