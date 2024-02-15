package thread;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CreatePostDAO;
import DTO.CreatePostDTO;

public class CreatePostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
        // リクエストパラメータから投稿情報を取得
        int threadId = Integer.parseInt(request.getParameter("threadId"));
        String content = request.getParameter("content");
        String postUserName = request.getParameter("postUserName");
        String postIdParam = request.getParameter("postId");
        int postReplyId = (postIdParam != null && !postIdParam.isEmpty()) ? Integer.parseInt(postIdParam) : 0;
        System.out.println(postReplyId);

        // 投稿情報をCreatePostDTOにセット
        CreatePostDTO createPostDTO = new CreatePostDTO();
        createPostDTO.setThreadId(threadId);
        createPostDTO.setContent(content);
        System.out.println(content); 
        createPostDTO.setPostUserName(postUserName);
        System.out.println(postUserName);
        createPostDTO.setPostReplyId(postReplyId);

        // 投稿情報をデータベースに登録するためのDAOを呼び出し
        CreatePostDAO createPostDAO = new CreatePostDAO();
        try {
            createPostDAO.createPost(createPostDTO);
            // 投稿が成功したらスレッドの詳細ページにリダイレクト
            response.sendRedirect("/JavaBoard_styET/thread?id=" + threadId);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // エラーが発生した場合はエラーページにリダイレクト
            response.sendRedirect("/JavaBoard_styET/HTML/createPostError.html");
        }
    }
}