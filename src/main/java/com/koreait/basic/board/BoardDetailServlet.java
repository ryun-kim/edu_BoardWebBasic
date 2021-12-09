package com.koreait.basic.board;

import com.koreait.basic.Utils;
import com.koreait.basic.board.model.BoardCmtDTO;
import com.koreait.basic.board.model.BoardDTO;
import com.koreait.basic.board.model.BoardEntity;
import com.koreait.basic.board.model.BoardVO;
import com.koreait.basic.dao.BoardCmtDAO;
import com.koreait.basic.dao.BoardDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/board/detail")
public class BoardDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int nohits = Utils.getParameterInt(req,"nohits");
        int iboard =Utils.getParameterInt(req,"iboard");
        BoardDTO dto = new BoardDTO();
        dto.setIboard(iboard);

        BoardVO data = BoardDAO.selBoardDetail(dto);

        BoardCmtDTO cmtParam = new BoardCmtDTO();
        cmtParam.setIboard(iboard);
        req.setAttribute("cmtList", BoardCmtDAO.selBoardCmtList(cmtParam));

        // 로그인 한 사람의 pk값과 data에 들어있는 writer값이 다르거나
        // 로그인이 안되어 있다면 hit 값 올림
        int loginUserPk = Utils.getLoginUserPk(req);
        if(data.getWriter()  != loginUserPk && nohits != 1){ //로그인 안 되어 있으면 0, 로그인 되어 있으면 pk값값
           BoardDAO.updBoardHitUp(dto);
        }

        req.setAttribute("detail", data);
        Utils.displayView("글내용", "board/detail", req, res);




    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {


    }
}
