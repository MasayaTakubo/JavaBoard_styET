package thread;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ThreadInfoDAO;
import DTO.ThreadInfoDTO;

public class ThreadInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    int threadID = 0;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String referer = request.getHeader("referer");
    	System.out.println(referer);
    	if (referer != null && referer.contains(request.getContextPath() + "/ThreadInfoServlet")) {
    		// セッションを取得
	    	HttpSession session = request.getSession();
	    	// セッションスコープから"threadID"を取得
	    	threadID = (int) session.getAttribute("threadID");
    	}else {
	    	threadID = Integer.parseInt(request.getAttribute("threadID").toString());

	    }
    	 
        // スレッドのIDをもとに、スレッドの情報を取得するDAOを呼び出し
        ThreadInfoDAO threadInfoDAO = new ThreadInfoDAO();
        try {	
            List<ThreadInfoDTO> threadInfoList = threadInfoDAO.getThreadInfo(threadID);

            // 取得したスレッドの情報をリクエストスコープにセット
            request.setAttribute("threadInfoList", threadInfoList);

            // JSPにフォワード
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/view_Thread.jsp");
            dispatcher.forward(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // エラーが発生した場合はエラーページにリダイレクトするなどの処理を行う
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}
