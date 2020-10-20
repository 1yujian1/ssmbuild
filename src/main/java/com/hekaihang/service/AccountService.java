package com.hekaihang.service;

import com.hekaihang.pojo.Accounts;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface AccountService {

    int addAccount(Accounts accounts);

    int deleteAccountById( int id);

    int updateAccount(Accounts accounts);

    int updateAccountPass(Accounts accounts);

    int updateAccountDepart(Accounts accounts);



    Accounts queryAccountById( int id);



    //查询全部的账户
    List<Accounts> queryAllAccount();

    //查询所有的销售员账户
    List<Accounts> queryAllAccount0();

    //按name查询账户
    List<Accounts> queryAccountByName(String name);

    List<Accounts> queryAccountByDepart(String department);


    boolean login(int id,String password, HttpSession session);

}
