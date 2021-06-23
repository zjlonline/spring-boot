package cn.com.sise.pojo;

import org.springframework.data.redis.core.index.Indexed;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "user")
public class User {
    @Id
    @Column(name="username")
    private String User;
    @Column(name = "password")
    private String password;

    public String getUser() {
        return User;
    }

    public void setUser(String user) {
        User = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
                "User='" + User + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
