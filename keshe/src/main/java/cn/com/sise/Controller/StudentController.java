package cn.com.sise.Controller;

import cn.com.sise.pojo.Student;
import cn.com.sise.repository.StudentRepository;
import cn.com.sise.service.StudentService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class StudentController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private StudentRepository studentRepository;
    @ResponseBody
    @RequestMapping("/find")
    public String find(@RequestParam(value = "page",required = false,defaultValue = "1")Integer page,@RequestParam(value = "limit",required = false,defaultValue = "10")Integer limit){
        System.out.println(page);
        System.out.println(limit);
        Pageable pageable=PageRequest.of(page-1,limit);
        Page<Student> students=studentRepository.finall(pageable);
        long count=studentRepository.count();
        PageInfo<Student> userPageInfo = new PageInfo<Student>(students);
//        PageHelper.startPage(page, limit);
//        PageInfo<Student> list=studentService.findall(page, limit);
//        Pageable pageable
//        PageInfo<Student> userPageInfo = new PageInfo<Student>(list);
        System.out.println(students);
        Map map=new HashMap();
        map.put("data",userPageInfo.getList());
        map.put("count",count);
//        map.put("pageSize",limit);
        map.put("msg","");
        map.put("code",200);
        String result= JSON.toJSONString(map);
        System.out.println(result);
        return result;

    }
    @RequestMapping("/add")
    public Student add(Student student, HttpServletResponse response){
        System.out.println(student);
        Student stu=studentService.add(student);
        return stu;
    }
    @RequestMapping("/update")
    public Student update(Student student, HttpServletResponse response,HttpServletRequest request){
        String name=request.getParameter("name");
        System.out.println(name);
       Student stu= studentRepository.save(student);
        System.out.println(stu);
        return stu;
    }
    @RequestMapping("/del")
    public int del(Integer id, HttpServletResponse response) {
        int row = studentService.del(id);
        JSONObject jsonmain = new JSONObject();
        if (row > 0) {
            response.setStatus(200);
            jsonmain.put("code", "200");
            jsonmain.put("msg", "updated");

        } else {
            response.setStatus(500);
            jsonmain.put("code", "500");
            jsonmain.put("msg", "Error");
        }
        return row;
    }
    @ResponseBody
    @RequestMapping("/select")
    public String select(Student student, HttpServletRequest request) {
        String key= request.getParameter("keyword");
        student.setName(key);
//        ExampleMatcher matcher=ExampleMatcher.matching().withMatcher("name",ExampleMatcher.GenericPropertyMatchers.contains());
//        Example<Student> example=Example.of(student,matcher);
//        List<Student> list=studentRepository.findAll(example);
        List<Student> list=studentService.select(key);
        Map map=new HashMap();
        map.put("data",list);
        map.put("count",list.size());
        map.put("msg","");
        map.put("code",200);
        String result=JSON.toJSONString(map);
        System.out.println(result);
        return result;
    }
    @ResponseBody
    @RequestMapping("/ceshi12")
    public String ceshi(){
        List<Student> list=studentService.ceshi();
        Map map=new HashMap();
        map.put("msg","");
        map.put("count",list.size());
        map.put("data",list);
        map.put("code",0);
        JSONObject jsonmain = new JSONObject();
        String result= JSON.toJSONString(map);
        return result;
    }
    @GetMapping("/xiao")
    public String xiao(){
        return "/jsp/ceshi";
    }
}
