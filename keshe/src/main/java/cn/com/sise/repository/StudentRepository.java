package cn.com.sise.repository;

import cn.com.sise.pojo.Student;
import com.github.pagehelper.Page;
import org.apache.ibatis.annotations.Insert;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;

public interface StudentRepository extends JpaRepository<Student,Integer> {
    @Query(value="select * from student ",nativeQuery = true)
    List<Student> finall();
    @Transactional
    @Modifying
    @Query(value=" delete from student where id=?1",nativeQuery = true)
    public int del(Integer id);
    @Query(value=" select * from student where id like concat('%',?1,'%') or name like concat('%',?1,'%') or sex like concat('%',?1,'%') or major like concat('%',?1,'%') or school like concat('%',?1,'%') or clas like concat('%',?1,'%') or sushe like concat('%',?1,'%') or room like concat('%',?1,'%')",nativeQuery=true)
    public List<Student> select(String keyword);
    @Query(value="select * from student ",nativeQuery = true)
    Page<Student> finall(Pageable page);
    @Query(value="select * from student ",nativeQuery=true)
    List<Student> ceshi();
}
