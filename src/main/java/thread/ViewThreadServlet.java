package thread;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewThreadServlet extends HttpServlet {
	private ArrayList<ViewThreadServlet> viewThread = new ArrayList<>();
    private String threadName;
    private String threadID;
    private String postID;
    private String content;
    private String postUserName;
    private String createTime;
    private int likes;
    private String postReplyID;
    
    
    public void viewThreadServlet(String tName, String tID, String pID, 
    		String cont, String pUser, String cTime, String pReplyID) {
		threadName = tName;
		threadID = tID;
		postID = pID;
		content = cont;
		postUserName = pUser;
		createTime = cTime;
		postReplyID = pReplyID;
	}
    
    
	
	public ArrayList<ViewThreadServlet> getSendThread() {
		return viewThread;
	}

	public void setSendThread(ArrayList<ViewThreadServlet> viewThread) {
		this.viewThread = viewThread;
	}

	public String getThreadID() {
		return threadID;
	}
	public void setThreadID(String threadID) {
		this.threadID = threadID;
	}

	public String getPostID() {
		return postID;
	}
	public void setPostID(String postID) {
		this.postID = postID;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getPostUserName() {
		return postUserName;
	}
	public void setPostUserName(String postUserName) {
		this.postUserName = postUserName;
	}

	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getPostReplyId() {
		return postReplyID;
	}
	public void setPostReplyId(String postReplyId) {
		this.postReplyID = postReplyId;
	}
	
	

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        threadName		= request.getParameter("tName");
		threadID		= request.getParameter("tID");
		postID			= request.getParameter("pID");
		content			= request.getParameter("cont");
		postUserName	= request.getParameter("pUser");
		createTime		= request.getParameter("cTime");
		postReplyID		= request.getParameter("pReplyID");

		ViewThreadServlet veiwThreadPost = new ViewThreadServlet(threadName,postUserName);
		viewThread.add(viewThread);

		request.setAttribute("contents", viewThread);
		request.setAttribute("name", threadName);
		request.setAttribute("text", postUserName);
        RequestDispatcher dispatcher = request.getRequestDispatcher("sendDB");
		dispatcher.forward(request, response);
    }
}