package thread;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CreateThreadDAO;

public class CreateThreadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("UTF-8");        
	// フォームから入力されたデータを取得
        String threadName = request.getParameter("threadName");
        String userName = request.getParameter("userName");
        String postText = request.getParameter("postText");
        
        // DAOを使用してThreadを作成し、Postを投稿
        CreateThreadDAO dao = new CreateThreadDAO();
        try {
            int threadID = dao.createThreadAndPost(threadName, userName, postText);
            // ThreadIDと投稿内容をログに記録
            System.out.println("ThreadID: " + threadID + ", Post Text: " + postText);
            // 成功した場合は適切なレスポンスを返す
            response.getWriter().write("Thread and Post created successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            // エラー時の処理
            response.getWriter().write("Error: Thread and Post creation failed.");
        }
    }
}
