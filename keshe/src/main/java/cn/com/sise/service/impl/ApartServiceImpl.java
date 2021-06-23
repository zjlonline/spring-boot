package cn.com.sise.service.impl;

import cn.com.sise.pojo.Apart;
import cn.com.sise.pojo.Student;
import cn.com.sise.repository.ApartMapper;
import cn.com.sise.repository.ApartReository;
import cn.com.sise.service.ApartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ApartServiceImpl implements ApartService {
   @Autowired
   private ApartMapper apartMapper;
    @Override
    public List<Apart> apart() {
        List<Apart> aparts= apartMapper.aparts();
        return  aparts;
    }

    @Override
    public List<Student> find(Student student) {
        return null;
    }

    @Override
    public List<Apart> select(Apart apart) {
        return null;
    }
}
