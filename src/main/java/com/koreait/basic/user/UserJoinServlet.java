package com.koreait.basic.user;

import com.koreait.basic.Utils;
import com.koreait.basic.dao.UserDAO;
import com.koreait.basic.user.model.UserEntity;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/join")
public class UserJoinServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        Utils.displayView("회원가입", "user/join", req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String uid = req.getParameter("uid");
        String upw = req.getParameter("upw");
        String nm = req.getParameter("nm");
        int gender = Utils.getParameterInt(req, "gender");
        String hashPw = BCrypt.hashpw(upw, BCrypt.gensalt());

        UserEntity entity = new UserEntity();
        entity.setUid(uid);
        entity.setUpw(hashPw);
        entity.setNm(nm);
        entity.setGender(gender);

        int result = UserDAO.join(entity);
        switch(result){
            case 1:
                res.sendRedirect("/user/login");
                break;
            default:
                req.setAttribute("err","회원가입에 실패하였습니다.");
                doGet(req, res);
                break;
        }


    }
}