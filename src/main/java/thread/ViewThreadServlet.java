package thread;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ViewThreadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null) {
            int threadID = Integer.parseInt(idParam);

            // スレッドのIDをリクエストにセット
            //request.setAttribute("threadID", threadID);
            HttpSession session = request.getSession();
            session.setAttribute("threadID", threadID);

            response.sendRedirect(request.getContextPath() + "/ThreadInfoServlet?id=" + threadID);
        } else {
            // リクエストパラメータ "id" が存在しない場合の処理
            // 例えば、エラーページにリダイレクトするなどの処理を記述する
            response.sendRedirect("/HTML/unknownError.html");
        }
    }
}
