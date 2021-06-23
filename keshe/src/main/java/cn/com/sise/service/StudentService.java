package cn.com.sise.service;

import cn.com.sise.pojo.Student;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface StudentService {
    PageInfo<Student> findall(Integer page, Integer limit);
    public int del(Integer id);
    public List<Student> select(String keyword);
    public List<Student> ceshi();
    public  Student add(Student student);
}
