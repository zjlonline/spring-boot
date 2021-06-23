package cn.com.sise.repository;

import cn.com.sise.pojo.Apart;
import cn.com.sise.pojo.Student;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
@Mapper
@Repository
public interface ApartMapper {
    public List<Apart> aparts();
    public List<Student> find(Student student);
    public List<Apart> select(Apart apart);
}
