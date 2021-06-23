package cn.com.sise.Controller;

import cn.com.sise.pojo.Apart;
import cn.com.sise.pojo.Student;
import cn.com.sise.repository.ApartMapper;
import cn.com.sise.repository.StudentRepository;
import cn.com.sise.service.ApartService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Apart")
public class ApartController {
    @Autowired
    private ApartMapper apartMapper;
    @Autowired
    private StudentRepository studentRepository;
    @GetMapping("/apart")
    public String getApart(){
        return "jsp/apart";
    }
    @ResponseBody
    @RequestMapping("/getapart")
    public  String aparts(){
        List<Apart> aparts=apartMapper.aparts();
        Map map=new HashMap();
        map.put("data",aparts);
        map.put("count",aparts.size());
        map.put("msg","");
        map.put("code",0);
        String result= JSON.toJSONString(map);
        System.out.println(result);
        return result;

    }
    @ResponseBody
    @GetMapping("/ceshi")
    public String list(){
        List<Apart> aparts=apartMapper.aparts();
        Map map=new HashMap();
        map.put("data",aparts);
        map.put("count",aparts.size());
        map.put("msg","");
        map.put("code",0);
        String result= JSON.toJSONString(map);
        return result;
    }
    @ResponseBody
    @RequestMapping("/findapart")
    public String findapart(Student student, HttpServletRequest request){
        String sushe=request.getParameter("sushe");
        String room=request.getParameter("room");
        student.setRoom(room);
        student.setSushe(sushe);
        List<Student> find=apartMapper.find(student);
        Map map=new HashMap();
        map.put("msg","");
        map.put("code",0);
        map.put("data",find);
        map.put("count",find.size());
        String result= JSON.toJSONString(map);
        return result;
    }
    @ResponseBody
    @RequestMapping("/selectApart")
    public String select(Apart apart, HttpServletRequest request){
        String dormitory=request.getParameter("dormitory");
        apart.setDormitory(dormitory);
        List<Apart> select=apartMapper.select(apart);
        Map map=new HashMap();
        map.put("data",select);
        map.put("count",select.size());
        map.put("msg","");
        map.put("code",0);
        String result= JSON.toJSONString(map);
        System.out.println(result);
        return result;
    }
}
