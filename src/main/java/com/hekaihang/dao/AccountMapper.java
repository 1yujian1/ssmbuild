package com.hekaihang.dao;

import com.hekaihang.pojo.Accounts;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AccountMapper {
    //增加一个新的销售人员账户（设置密码，部门，姓名）
    int addAccount(Accounts accounts);

    //通过一个账户id删除销售人员账户
    int deleteAccountById(@Param("id") int id);

    //通过账户id修改账户信息
    int updateAccount(Accounts accounts);

    //通过账户id修改账户密码
    int updateAccountPass(Accounts accounts);

    //部门调用
    int updateAccountDepart(Accounts accounts);



    Accounts queryAccountById(@Param("id") int id);



    //查询全部的账户
    List<Accounts> queryAllAccount();

    //查询所有的销售员账户
    List<Accounts> queryAllAccount0();

    //按name查询账户
    List<Accounts> queryAccountByName(@Param("name")String name);

    //按部门查询账户
    List<Accounts> queryAccountByDepart(String department);


    List<Accounts> queryAccountByIdPass(@Param("id") int id,@Param("password") String password);


}
