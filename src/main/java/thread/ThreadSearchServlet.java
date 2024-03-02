package thread;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ThreadSearchDAO;
import DTO.ThreadSearchDTO;

public class ThreadSearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // フォームからの入力を取得
        String keyword = request.getParameter("keyword");
        System.out.println(keyword);
        String searchType = request.getParameter("searchType");

        // 検索結果を格納するリスト
        List<ThreadSearchDTO> searchResults = new ArrayList<>();

        // 適切な検索メソッドを呼び出す
        if (searchType != null && !searchType.isEmpty()) {
            if (searchType.equals("threadTitle")) {
                try {
                    searchResults = ThreadSearchDAO.searchByThreadTitle(keyword);
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            } else if (searchType.equals("creatorName")) {
                try {
                    searchResults = ThreadSearchDAO.searchByCreatorName(keyword);
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            } else if (searchType.equals("posterName")) {
                try {
                    searchResults = ThreadSearchDAO.searchByPostUserName(keyword);
                } catch (ClassNotFoundException e) {
                    // TODO 自動生成された catch ブロック
                    e.printStackTrace();
                }
            } else if (searchType.equals("threadId")) {
                try {
                    searchResults = ThreadSearchDAO.searchByThreadId(Integer.parseInt(keyword));
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            } else if (searchType.equals("content")) {
                try {
                    searchResults = ThreadSearchDAO.searchByContent(keyword);
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            } else {
            }
        }

        // 検索結果をリクエスト属性に設定
        request.setAttribute("searchResults", searchResults);

        // 検索結果をjspにフォワード
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/search_Result.jsp");
        dispatcher.forward(request, response);
    }
}
