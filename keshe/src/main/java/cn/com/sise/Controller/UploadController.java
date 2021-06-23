package cn.com.sise.Controller;

import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UploadController {
    private String path="D:/images/";
    @GetMapping("/uploadController")
    public String toupload() {
        return "jsp/upload";
    }
    @ResponseBody
    @RequestMapping("/up")
    public String uploadFile(List<MultipartFile> uploadFile, MultipartFile file, HttpSession session, HttpServletRequest request) throws Exception {
        File f=new File(path);
        //判断上传文件路径是否存在；不存在，在创建目录
        if (!f.exists()){
            f.mkdir();
        }
        String OldFileName=file.getOriginalFilename();
        File newFileName=new File(path+OldFileName);
        file.transferTo(newFileName);
        Map map = new HashMap<String,Object>();
        try {
            map.put("msg","ok");
            map.put("code",200);
            map.put("data",new HashMap<String,Object>(){
                {
                    put("src",newFileName);
                }
            });

        } catch (Exception e) {
            map.put("msg","error");
            map.put("code",0);
            e.printStackTrace();
        }
        String res= JSON.toJSONString(map);
        System.out.println(res);
        return res;

    }
    }
