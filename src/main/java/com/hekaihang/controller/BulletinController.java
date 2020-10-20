package com.hekaihang.controller;


import com.hekaihang.pojo.Accounts;
import com.hekaihang.pojo.Bulletins;
import com.hekaihang.service.BulletinService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

@Controller
@RequestMapping("/bulletin")
public class BulletinController {
    @Autowired
    @Qualifier("BulletinServiceImpl")
    private BulletinService bulletinService;

    //查询所有公告
    @RequestMapping(value = "/allBulletin" ,produces = "text/json;charset=UTF-8")
    @ResponseBody
    public  String findAllBul()
    {
        List<Bulletins> buls=bulletinService.queryAllBul();
        int size=buls.size();

        JSONArray json=JSONArray.fromObject(buls);

        String js = json.toString();
        String jso = "{\"code\":0,\"msg\":\"\",\"count\":"+size+",\"data\":"+js+"}";
        return jso;
    }

    //通过发布人员id查询
    @RequestMapping(value = "/bulletinbyid" ,produces = "text/json;charset=UTF-8")
    @ResponseBody
    public  String findBulById(HttpSession session)
    {
        Accounts accounts=(Accounts) session.getAttribute("account");

        List<Bulletins> buls=bulletinService.queryBulByadmin_id(accounts.getId());
        int size=buls.size();

        JSONArray json=JSONArray.fromObject(buls);

        String js = json.toString();
        String jso = "{\"code\":0,\"msg\":\"\",\"count\":"+size+",\"data\":"+js+"}";
        return jso;
    }

    //通过标题查询
    @RequestMapping(value = "/bulletinbytitle" ,produces = "text/json;charset=UTF-8")
    @ResponseBody
    public  String findBulByTitle(String title)
    {
        if(title.equals("")){

            List<Bulletins> buls=bulletinService.queryAllBul();
            int size=buls.size();

            JSONArray json=JSONArray.fromObject(buls);

            String js = json.toString();
            String jso = "{\"code\":0,\"msg\":\"\",\"count\":"+size+",\"data\":"+js+"}";
            return jso;
        }else{
            List<Bulletins> buls=bulletinService.queryBulBytitle(title);
            int size=buls.size();

            JSONArray json=JSONArray.fromObject(buls);

            String js = json.toString();
            String jso = "{\"code\":0,\"msg\":\"\",\"count\":"+size+",\"data\":"+js+"}";
            return jso;
        }
    }

    //通过发布人员id和标题查询
    @RequestMapping(value = "/bulletinbyid_title" ,produces = "text/json;charset=UTF-8")
    @ResponseBody
    public  String findBulByIdTitle(HttpSession session,String title)
    {

        Accounts accounts=(Accounts) session.getAttribute("account");

        if(title.equals("")){

            List<Bulletins> buls=bulletinService.queryBulByadmin_id(accounts.getId());
            int size=buls.size();


            JSONArray json=JSONArray.fromObject(buls);

            String js = json.toString();
            String jso = "{\"code\":0,\"msg\":\"\",\"count\":"+size+",\"data\":"+js+"}";
            return jso;
        }else {
            List<Bulletins> buls=new LinkedList<>();
            buls = bulletinService.queryBulByadmin_id(accounts.getId());
            List<Bulletins> buls0=new LinkedList<>();
            for(Bulletins b:buls){
                if(b.getTitle().equals(title)){
                    buls0.add(b);
                }
            }


            int size = buls0.size();
            JSONArray json = JSONArray.fromObject(buls0);
            String js = json.toString();
            String jso = "{\"code\":0,\"msg\":\"\",\"count\":" + size + ",\"data\":" + js + "}";

            return jso;
        }
    }

    @RequestMapping("/toAllBulletin")
    public String toAllBulletin(){
        return "/bulletin";
    }
    /*    public  String list(Model model){
        List<Bulletins> list=bulletinService.queryAllBul();
        model.addAttribute("list",Layui.data(100,list));
        System.out.println(Layui.data(100,list));
        return Layui.data(100,list);

    }*/

    @RequestMapping("/toChild_bulletin")
    public String toChild_bulletin(){
        return "/child_bulletin";
    }

    @RequestMapping("/toChild_add_bulletin")
    public String toChild_add_bulletin(){
        return "/child_add_bulletin";
    }

    //编辑公告
    @RequestMapping("/edit_bul")
    @ResponseBody
    public boolean EditBul(String id,String msg) {
        Bulletins bulletin=new Bulletins();
        bulletin.setMessage(msg);
        bulletin.setBul_id(Integer.valueOf(id));
        bulletinService.updateBul(bulletin);
        return true;
    }

    //删除公告
    @RequestMapping("/delete_bul")
    @ResponseBody
    public boolean DeleteBul(String id) {
        bulletinService.deleteBulById(Integer.valueOf(id));
        return true;
    }

    //发布公告
    @RequestMapping(value = "/add_bul",produces = "text/json;charset=UTF-8")
    public String AddBul(String message, String time, String admin_name, String title, HttpSession session) {
        Bulletins bulletins=new Bulletins();
        bulletins.setMessage(message);
        Accounts accounts=(Accounts)session.getAttribute("account");
        bulletins.setAdmin_id(accounts.getId());
        bulletins.setAdmin_name(admin_name);
        bulletins.setTime(time);
        bulletins.setTitle(title);

        bulletinService.addBulletin(bulletins);
        return "redirect:/bulletin/bulletinbyid";
    }

}

