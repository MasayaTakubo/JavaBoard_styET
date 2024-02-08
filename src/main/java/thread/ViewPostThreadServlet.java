package thread;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewPostThreadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // リクエストパラメータからスレッドのIDを取得
        int threadId = Integer.parseInt(request.getParameter("id"));

        // スレッドのIDをリクエストにセット
        request.setAttribute("threadId", threadId);

        // ThreadInfoServlet にフォワード
        RequestDispatcher dispatcher = request.getRequestDispatcher("/ThreadInfoServlet");
        dispatcher.forward(request, response);
    }

}
