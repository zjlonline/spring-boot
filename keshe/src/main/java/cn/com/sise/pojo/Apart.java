package cn.com.sise.pojo;

import javax.persistence.*;
import java.util.List;
@Entity
@Table(name = "apartinfo")
public class Apart {
    @Id
    @Column(name="id")
    int id;
    @Column(name ="sushe" )
    private String sushe;
    @Column(name = "room")
    private String room;
    @Column(name = "max")
    private String max;
    @Column(name = "school")
    private String school;
    @Transient
    private String num;
    @Transient
    private String dormitory;
    @OneToMany(mappedBy = "apartId")
    private List<Student> list;

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

    public String getMax() {
        return max;
    }

    public void setMax(String max) {
        this.max = max;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public String getDormitory() {
        return dormitory;
    }

    public void setDormitory(String dormitory) {
        this.dormitory = dormitory;
    }

    public List<Student> getList() {
        return list;
    }

    public void setList(List<Student> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "Apart{" +
                "id=" + id +
                ", sushe='" + sushe + '\'' +
                ", room='" + room + '\'' +
                ", max='" + max + '\'' +
                ", school='" + school + '\'' +
                ", num='" + num + '\'' +
                ", dormitory='" + dormitory + '\'' +
                ", list=" + list +
                '}';
    }
}
