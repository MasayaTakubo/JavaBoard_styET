package thread;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.TopThreadDAO;
import DTO.TopThreadDTO;

/**
 * 登録データを一覧表示するクラス
 */
public class TopServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // データベース一覧表示
        TopThreadDAO dao = new TopThreadDAO();
        List<TopThreadDTO> dtoList;
        try {
            dtoList = dao.showAllList();
            // セッションの開始
            HttpSession session = request.getSession();
            // セッションスコープにデータ登録
            session.setAttribute("DTOlist", dtoList);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/thread_List.jsp");
        dispatcher.forward(request, response);
    }
}
