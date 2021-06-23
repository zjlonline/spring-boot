package cn.com.sise.service;

import cn.com.sise.pojo.Apart;
import cn.com.sise.pojo.Student;

import java.util.List;

public interface ApartService {
    public List<Apart> apart();
    public List<Student> find(Student student);
    public List<Apart> select(Apart apart);
}
