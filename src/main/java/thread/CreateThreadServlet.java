package thread;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CreateThreadServlet extends HttpServlet {
    private ArrayList<CreateThreadServlet> sendThread = new ArrayList<>();
    private String threadName;
    private String userName;
    private String postText;
    private int threadId;

	public String getThreadName() {
		return threadName;
	}

	public void setThreadName(String threadname) {
		this.threadName = threadname;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String username) {
		this.userName = username;
	}
    
	public CreateThreadServlet(String tname, String uname) {
		threadName = tname;
		userName = uname;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		threadName = request.getParameter("threadname");
		userName = request.getParameter("username");

		CreateThreadServlet createThread = new CreateThreadServlet(threadName,userName);
		sendThread.add(createThread);

		request.setAttribute("contents", createThread);
		request.setAttribute("name", threadName);
		request.setAttribute("text", userName);
		RequestDispatcher dispatcher = request.getRequestDispatcher("sendDB");
		dispatcher.forward(request, response);
    }
}