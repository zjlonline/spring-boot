package cn.com.sise.repository;

import cn.com.sise.pojo.Apart;
import cn.com.sise.pojo.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.beans.Transient;
import java.util.List;

public interface ApartReository extends JpaRepository<Apart,Integer> {
    @Query(value = "select a.id, a.sushe,a.room,max,a.school,s.num from apartinfo a JOIN (select count(room) as num,apart_id,sushe ,school,room from student GROUP BY room,sushe ) s on a.room=s.room and a.sushe=s.sushe and a.id=s.apart_id GROUP BY room,sushe",nativeQuery = true)
    public List<Apart> apart();
    @Query(value="select * from apartinfo",nativeQuery=true)
    public List<Apart> ceshi();

}
