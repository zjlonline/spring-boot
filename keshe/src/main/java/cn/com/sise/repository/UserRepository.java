package cn.com.sise.repository;

import cn.com.sise.pojo.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
public interface UserRepository extends JpaRepository<User,Integer> {
        @Query(value="select * from user u where username=?1 and password=?2",nativeQuery = true)
        public User find(String username,String password);
}
