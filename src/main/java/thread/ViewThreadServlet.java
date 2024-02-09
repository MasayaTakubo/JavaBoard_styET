package thread;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewThreadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String idParam = request.getParameter("id");
        if(idParam != null) {
            int threadID = Integer.parseInt(idParam);

            // スレッドのIDをリクエストにセット
            request.setAttribute("threadID", threadID);

            // ThreadInfoServlet にフォワード
            RequestDispatcher dispatcher = request.getRequestDispatcher("/ThreadInfoServlet");
            dispatcher.forward(request, response);
        } else {
            // リクエストパラメータ "id" が存在しない場合の処理
            // 例えば、エラーページにリダイレクトするなどの処理を記述する
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}
