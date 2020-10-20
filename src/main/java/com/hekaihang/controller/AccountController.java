package com.hekaihang.controller;


import com.hekaihang.pojo.Accounts;
import com.hekaihang.service.AccountService;
import com.hekaihang.service.CompanyService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;


//所有关于账户的操作
@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    @Qualifier("AccountServiceImpl")
    private AccountService accountService;

    @Autowired
    @Qualifier("CompanyServiceImpl")
    private CompanyService companyService;


    //到组织界面
    @RequestMapping("/tostruct")
    public String toStruct(){
        return "/organization_struct";
    }

    //判断账户登录是否成功
    @RequestMapping("/login")
    @ResponseBody
    public boolean login(String id,String password, HttpSession session) {
        if (accountService.login(Integer.valueOf(id),password, session)){
            return true;
        }else {
            return false;
        }
    }

    //登录成功后去往主页面
    @RequestMapping("/toMain")
    public String toMain(){
        return "/main";
    }

    //退出账户
    @RequestMapping("/doLogOut")
    public String toIndex(HttpSession session){

        try {
            session.removeAttribute("account");
        }catch (Exception e){
        }
        return "redirect:/index.jsp";
    }

    //去往查看个人信息界面
    @RequestMapping("/toPerson")
    public String toPerson(){

        return "/personal_info";
    }

    @RequestMapping("/UpdatePerson")
    public String UpdatePerson(Accounts account,HttpSession session){
        accountService.updateAccount(account);
        try {
            session.removeAttribute("account");
            session.setAttribute("account",account);
        }catch (Exception e){
        }
        return "/personal_info";
    }

    //修改密码
    @RequestMapping("/updatePass")
    @ResponseBody
    public boolean UpdatePass(String id,String password, HttpSession session) {
        Accounts account=(Accounts) session.getAttribute("account");
        account.setPassword(password);
        accountService.updateAccountPass(account);
        session.setAttribute("account.password",password);
        return true;
    }


    //重置密码
    @RequestMapping("/resettingPass")
    @ResponseBody
    public boolean resettingPass(String id) {
        Accounts account=accountService.queryAccountById(Integer.valueOf(id));
        account.setPassword(id);
        accountService.updateAccountPass(account);
        return account.getId()==Integer.valueOf(account.getPassword());

    }

    //部门调动
    @RequestMapping("/resettingDepart")
    @ResponseBody
    public boolean resettingDepart(String id,String department) {
        Accounts account=accountService.queryAccountById(Integer.valueOf(id));
        account.setDepartment(department);
        accountService.updateAccountDepart(account);
        return true;
    }

    //删除账户
    @RequestMapping("/deleteAccount")
    @ResponseBody
    public boolean deleteAccount(String id) {

        accountService.deleteAccountById(Integer.valueOf(id));
        return true;

    }

    //增加员工账户（实习生）
    @RequestMapping("/addAccount")
    @ResponseBody
    public boolean addAccount(String name) {
        Accounts account=new Accounts();
        account.setName(name);
        accountService.addAccount(account);
        return true;
    }

    //跳转到查询所有员工信息界面
    @RequestMapping("/toEmployee")
    public String toEmployee(){

        return "/employee";
    }

    //查询所有员工信息
    @RequestMapping(value = "/allEmployee", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public  String findAllEmp()
    {
        List<Accounts> accounts=accountService.queryAllAccount0();
        int size=accounts.size();

        JSONArray json=JSONArray.fromObject(accounts);
        String js = json.toString();
        String jso = "{\"code\":0,\"msg\":\"\",\"count\":"+size+",\"data\":"+js+"}";
        return jso;
    }


    //用name查询员工信息
    @RequestMapping(value = "/findEmpByName", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public  String findEmpByName(String name)
    {
        if(name.equals("")){
            List<Accounts> accounts=accountService.queryAllAccount0();
            int size=accounts.size();

            JSONArray json=JSONArray.fromObject(accounts);
            String js = json.toString();
            String jso = "{\"code\":0,\"msg\":\"\",\"count\":"+size+",\"data\":"+js+"}";
            return jso;
        }else {

            List<Accounts> accounts = accountService.queryAccountByName(name);
            int size = accounts.size();

            JSONArray json = JSONArray.fromObject(accounts);
            String js = json.toString();
            String jso = "{\"code\":0,\"msg\":\"\",\"count\":" + size + ",\"data\":" + js + "}";
            return jso;
        }
    }


    //通过一个公司的名字查找该业务的销售员信息
    @RequestMapping(value = "/employeebydepart", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public  String findEmpByDepart(String coname)
    {
        System.out.println(coname);

        System.out.println("0");

        String scort=companyService.findCompanySort(coname);
        System.out.println("1");
        List<Accounts> accounts=accountService.queryAccountByDepart(scort);
        System.out.println("2");

        int size=accounts.size();

        JSONArray json=JSONArray.fromObject(accounts);
        String js = json.toString();
        String jso = "{\"code\":0,\"msg\":\"\",\"count\":"+size+",\"data\":"+js+"}";
        System.out.println(jso);

        return jso;
    }

}
