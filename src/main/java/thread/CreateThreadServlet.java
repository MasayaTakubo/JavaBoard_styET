package thread;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CreateThreadDAO;
import DTO.CreateThreadDTO;

public class CreateThreadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // フォームから入力されたデータを取得
        String threadName = request.getParameter("threadName");
        String userName = request.getParameter("userName");
        String postText = request.getParameter("postText");

        // DTOにデータを設定
        CreateThreadDTO threadDTO = new CreateThreadDTO();
        threadDTO.setThreadName(threadName);
        threadDTO.setUserName(userName);
        threadDTO.setPostText(postText);

        // DAOを使用してThreadを作成し、Postを投稿
        CreateThreadDAO dao = new CreateThreadDAO();
        try {
            int threadID = dao.createThreadAndPost(threadDTO);
            // ThreadIDと投稿内容をログに記録
            System.out.println("ThreadID: " + threadID + ", Post Text: " + postText); //セッションスコープにデータ登録
            HttpSession session = request.getSession();
            session.setAttribute("threadID", threadID);
            //this.doGet(request,response);
            response.sendRedirect(request.getContextPath() + "/ThreadInfoServlet?id=" + threadID);
        } catch (Exception e) {
            e.printStackTrace();
            // エラーが発生した場合はエラーページにリダイレクト
            response.sendRedirect(request.getContextPath() + "/HTML/createThreadError.html");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*request.setCharacterEncoding("UTF-8");
        request.setAttribute("threadID", threadID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/ThreadInfoServlet");
        dispatcher.forward(request, response);*/
        doPost(request, response);
    }
}
