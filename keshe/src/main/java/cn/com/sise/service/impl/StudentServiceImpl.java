package cn.com.sise.service.impl;

import cn.com.sise.pojo.Student;
import cn.com.sise.repository.StudentRepository;
import cn.com.sise.service.StudentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CachePut;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.TimeUnit;

@Service
@Transactional
public class StudentServiceImpl implements StudentService {
    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private StudentRepository studentRepository;
    public PageInfo<Student> findall(Integer page, Integer limit) {
             PageHelper.startPage(page, limit);
            List<Student> list=studentRepository.finall();
            PageInfo<Student> pageInfo=new PageInfo<>(list);
            return pageInfo;

    }

    @Override
    public int del(Integer id) {
        int row=studentRepository.del(id);
        return row;
    }

    @Override
    public List<Student> select(String keyword) {
        Object o=redisTemplate.opsForValue().get("keyword"+keyword);
        List<Student> list=studentRepository.select(keyword);
        return list;
    }

    @Override
    public List<Student> ceshi() {
        List<Student> list=studentRepository.ceshi();
        return list;
    }

    @Override
    @CachePut(cacheNames = "student",key ="#result.id" )
    public Student add(Student student) {
        Student stu=  studentRepository.save(student);
        return stu;
    }


}
