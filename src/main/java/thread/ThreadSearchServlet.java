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
            try {
                switch (searchType) {
                    case "threadTitle":
                        searchResults = ThreadSearchDAO.searchByThreadTitle(keyword);
                        break;
                    case "creatorName":
                        searchResults = ThreadSearchDAO.searchByCreatorName(keyword);
                        break;
                    case "posterName":
                        searchResults = ThreadSearchDAO.searchByPostUserName(keyword);
                        break;
                    case "threadId":
                        searchResults = ThreadSearchDAO.searchByThreadId(Integer.parseInt(keyword));
                        break;
                    case "content":
                        searchResults = ThreadSearchDAO.searchByContent(keyword);
                        break;
                    default:
                        break;
                }
            } catch (ClassNotFoundException | NumberFormatException e) {
                e.printStackTrace();
            }
        }

        // 検索結果をリクエスト属性に設定
        request.setAttribute("searchResults", searchResults);

        // 検索結果をjspにフォワード
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/search_Result.jsp");
        dispatcher.forward(request, response);
    }
}
