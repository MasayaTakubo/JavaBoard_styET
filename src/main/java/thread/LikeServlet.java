package thread;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ThreadInfoDAO;

public class LikeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int postId = Integer.parseInt(request.getParameter("postId"));
        ThreadInfoDAO threadInfoDAO = new ThreadInfoDAO();
        try {
            threadInfoDAO.incrementLikes(postId);
            int threadId = threadInfoDAO.getThreadIdByPostId(postId);
            response.sendRedirect("ThreadInfoServlet?threadId=" + threadId);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/HTML/unknownError.html");

        }
    }
}
