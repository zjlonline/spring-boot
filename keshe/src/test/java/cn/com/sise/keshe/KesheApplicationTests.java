package cn.com.sise.keshe;

import cn.com.sise.pojo.Apart;
import cn.com.sise.pojo.Student;
import cn.com.sise.pojo.User;
import cn.com.sise.repository.ApartMapper;
import cn.com.sise.repository.ApartReository;
import cn.com.sise.repository.StudentRepository;
import cn.com.sise.repository.UserRepository;
import cn.com.sise.service.ApartService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class KesheApplicationTests {
    @Autowired
    StudentRepository studentRepository;
    @Autowired
    ApartService apart;
    @Autowired
    ApartReository a;
    @Autowired
    private ApartMapper apartMapper;
    @Test
    void contextLoads() {
        List<Apart> apart=apartMapper.aparts();
        System.out.println(apart);

    }

}
