package com.hekaihang.controller;


import com.hekaihang.pojo.Companies;
import com.hekaihang.service.CompanyService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

//所有关于公司的操作
@Controller
@RequestMapping("/company")
public class CompanyController {

    @Autowired
    @Qualifier("CompanyServiceImpl")
    private CompanyService companyService;


    //增加公司信息
    @RequestMapping("/addCompany")
    public String addAccount(String coname, String  coadress, String cophone,String csort,String cname,String csex,String cphone,String cemail,String remark) {
        Companies companies=new Companies();
        companies.setConame(coname);
        companies.setCoadress(coadress);
        companies.setCophone(cophone);
        companies.setCsort(csort);
        companies.setCname(cname);
        companies.setCsex(csex);
        companies.setCphone(cphone);
        companies.setCemail(cemail);
        companies.setRemark(remark);

        companyService.addCompany(companies);

        return "redirect:/company/tocompany";
    }


    //删除公司信息
    @RequestMapping("/deleteCompany")
    @ResponseBody
    public boolean deleteAccount(String coname) {
        companyService.deleteCompany(coname);
        return true;
    }




    @RequestMapping("/tostatis")
    public String toStatis(){
        return "/company_statis_shitu";
    }

    @RequestMapping("/todevote")
    public String toDevote(){
        return "/company_devote_shitu";
    }

    //查询所有公司信息
    @RequestMapping(value = "/allCompany", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public  String findAllEmp()
    {

        List<Companies> companies=companyService.queryAllCompany();
        int size=companies.size();

        JSONArray json=JSONArray.fromObject(companies);
        String js = json.toString();
        String jso = "{\"code\":0,\"msg\":\"\",\"count\":"+size+",\"data\":"+js+"}";

        return jso;
    }


    //按公司名查询公司信息
    @RequestMapping(value = "/CompanyByName", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public  String findEmpByName(String coname )
    {

        List<Companies> companies=companyService.queryCompanyByName(coname);
        int size=companies.size();

        JSONArray json=JSONArray.fromObject(companies);
        String js = json.toString();
        String jso = "{\"code\":0,\"msg\":\"\",\"count\":"+size+",\"data\":"+js+"}";

        return jso;
    }


    //查询所有公司构成比例
    @RequestMapping(value = "/company_makeup", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public  String findCompany_makeup()
    {

        List<Map<String,Integer>> map=companyService.queryCompany_makeup();

        int size=map.size();

        JSONArray json=JSONArray.fromObject(map);
        String js = json.toString();
        String jso="{\"list\":"+js+"}";
        return jso;
    }

    //查询所有公司订单数贡献比例
    @RequestMapping(value = "/company_devote", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public  String findCompany_devote()
    {

        List<Map<String,Integer>> map=companyService.queryCompany_devote();

        int size=map.size();

        JSONArray json=JSONArray.fromObject(map);
        String js = json.toString();
        String jso="{\"list\":"+js+"}";
        return jso;
    }


    @RequestMapping("/toaddcompany")
    public String toAddCompany(){
        return "/add_company_client";
    }

    @RequestMapping("/tocompany")
    public String toCompany(){
        return "/company_client";
    }
}
