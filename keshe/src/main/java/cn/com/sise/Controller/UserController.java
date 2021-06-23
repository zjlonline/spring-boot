package cn.com.sise.Controller;

import cn.com.sise.pojo.User;
import cn.com.sise.repository.UserRepository;
import cn.com.sise.service.UserService;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller

public class UserController {
    JSONObject jsonmain = new JSONObject();
    @Autowired
    private UserService userService;
    @GetMapping("/userlogin")
    public String ceshi(){
        return "login";
    }
    @PostMapping("/login")
    public String selectAll(String username, String password, HttpServletRequest request, HttpSession session){
        username= request.getParameter("username");
        password= request.getParameter("password");
        User u=userService.login(username,password);
        if (u!=null){
        session.setAttribute("user",username);
        jsonmain.put("msg","OK");
        return "jsp/Main";
        }else{
            return "/userlogin";
        }

    }
}
