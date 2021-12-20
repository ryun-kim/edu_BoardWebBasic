package com.koreait.basic.user;

import com.koreait.basic.Utils;
import com.koreait.basic.dao.UserDAO;
import com.koreait.basic.user.model.LoginResult;
import com.koreait.basic.user.model.UserEntity;
import org.apache.catalina.User;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user/login")
public class UserLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        Utils.displayView("로그인", "user/login", req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String uid = req.getParameter("uid");
        String upw = req.getParameter("upw");
        UserEntity entity = new UserEntity();
        entity.setUid(uid);

        //LoginResult lr = UserDAO.login(entity);
        UserEntity loginUser = UserDAO.selUser(entity);
        String err = null;
        if(loginUser == null){ // 아이디 없음
            err = "아이디를 확인해 주세요.";
        }else{
            String dbpw = loginUser.getUpw();
            if(BCrypt.checkpw(upw,dbpw)){
                loginUser.setUpw(null);

                //세션에 loginUser값 등록
                HttpSession hs = req.getSession();
                hs.setAttribute("loginUser", loginUser);
                res.sendRedirect("/board/list");
                return;
            } else { //비밀번호 틀림
                err = "비밀번호를 확인해 주세요.";
            }
        }

        req.setAttribute("err", err);
        doGet(req, res);
    }
}