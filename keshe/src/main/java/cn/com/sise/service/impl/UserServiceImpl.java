package cn.com.sise.service.impl;

import cn.com.sise.pojo.User;
import cn.com.sise.repository.UserRepository;
import cn.com.sise.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    public User login(String username, String password) {
        User login=userRepository.find(username,password);
        System.out.println(login);
        return login;
    }
}
