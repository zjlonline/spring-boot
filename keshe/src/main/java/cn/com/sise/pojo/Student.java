package cn.com.sise.pojo;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "student")
public class Student implements Serializable {
    @Id
    @Column(name = "id")
    private int id;
    @Column(name = "name")
    private String name;
    @Column(name = "sex")
    private String sex;
    @Column(name = "major")
    private String major;
    @Column(name = "school")
    private String school;
    @Column(name = "clas")
    private String clas;
    @Column(name = "sushe")
    private String sushe;
    @Column(name = "room")
    private String room;
    @Column(name = "keyword")
    private String keyword;
    @Transient
    private String num;
    @Column(name="apart_id")
    private int apartId;

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public int getApartId() {
        return apartId;
    }

    public void setApartId(int apartId) {
        this.apartId = apartId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getClas() {
        return clas;
    }

    public void setClas(String clas) {
        this.clas = clas;
    }

    public String getSushe() {
        return sushe;
    }

    public void setSushe(String sushe) {
        this.sushe = sushe;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", major='" + major + '\'' +
                ", school='" + school + '\'' +
                ", clas='" + clas + '\'' +
                ", sushe='" + sushe + '\'' +
                ", room='" + room + '\'' +
//                ", keyword='" + keyword + '\'' +
                ", num='" + num + '\'' +
                ", apartId=" + apartId +
                '}';
    }
}
