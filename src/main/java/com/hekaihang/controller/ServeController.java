package com.hekaihang.controller;


import com.hekaihang.pojo.Accounts;
import com.hekaihang.pojo.Serves;
import com.hekaihang.service.AccountService;
import com.hekaihang.service.ServeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

//所有关于服务的操作
@Controller
@RequestMapping("/serve")
public class ServeController {

    @Autowired
    @Qualifier("ServeServiceImpl")
    private ServeService serveService;

    @Autowired
    @Qualifier("AccountServiceImpl")
    private AccountService accountService;


    @RequestMapping("/toaddserver")
    public String toAddServer(){
        return "/add_serve";
    }


    @RequestMapping("/addserver")
    public String addServer(String serve_title,Integer sserver,String scompany,String serve_content,HttpSession session){
        Serves serve=new Serves();
        Accounts a=(Accounts) session.getAttribute("account");
        serve.setServe_creater(a.getId());

        serve.setSserver(sserver);
        serve.setServe_title(serve_title);
        serve.setScompany(scompany);

        serve.setServe_content(serve_content);
        int[] i=serveService.findLastServeId();
        serve.setScontract(i[0]+100001);
        serve.setSorder(i[0]+200001);


        serveService.addServe(serve);


        return "/add_serve";
    }


}
