import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class create_Thread_Servlet extends HttpServlet {
    private ArrayList<create_Thread_Servlet> sendThread = new ArrayList<>();
    private String threadname;
    private String username;
    private String text;
    private int threadid;

    public String getThreadname() {
		return threadname;
	}

	public void setThreadname(String threadname) {
		this.threadname = threadname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
    
    public create_Thread_Servlet(String tname, String uname) {
		threadname = tname;
		username = uname;
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        threadname = request.getParameter("threadname");
		username = request.getParameter("username");

		create_Thread_Servlet createThread = new create_Thread_Servlet(threadname,username);
		sendThread.add(createThread);

		request.setAttribute("contents", createThread);
		request.setAttribute("name", threadname);
		request.setAttribute("text", username);
        RequestDispatcher dispatcher = request.getRequestDispatcher("sendDB");
		dispatcher.forward(request, response);
    }
}