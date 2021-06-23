package cn.com.sise.service;

import cn.com.sise.pojo.User;
import cn.com.sise.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


public interface UserService {
    public User login(String username,String password);
}
