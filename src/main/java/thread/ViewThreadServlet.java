package thread;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ViewThreadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // リクエストパラメータからスレッドのIDを取得
        String threadId = request.getParameter("id");
        

        // スレッドのIDをJSPに転送
        request.setAttribute("threadId", threadId);

        // JSPにフォワード
        request.getRequestDispatcher("/WEB-INF/jsp/view_Thread.jsp").forward(request, response);
    }

  
}