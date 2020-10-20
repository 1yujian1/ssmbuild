package com.hekaihang.service;

import com.hekaihang.dao.AccountMapper;
import com.hekaihang.pojo.Accounts;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AccountServiceImpl implements AccountService {
    private AccountMapper accountMapper;

    public void setAccountMapper(AccountMapper accountMapper) {
        this.accountMapper = accountMapper;
    }

    @Override
    public int addAccount(Accounts accounts) {
        return accountMapper.addAccount(accounts);
    }

    @Override
    public int deleteAccountById(int id) {
        return accountMapper.deleteAccountById(id);
    }

    @Override
    public int updateAccount(Accounts accounts) {
        return accountMapper.updateAccount(accounts);
    }

    @Override
    public int updateAccountPass(Accounts accounts) {
        return accountMapper.updateAccountPass(accounts);
    }

    @Override
    public int updateAccountDepart(Accounts accounts) {
        return accountMapper.updateAccountDepart(accounts);
    }

    @Override
    public Accounts queryAccountById(int id) {
        return accountMapper.queryAccountById(id);
    }

    @Override
    public List<Accounts> queryAllAccount() {
        return accountMapper.queryAllAccount();
    }

    @Override
    public List<Accounts> queryAllAccount0() {
        return accountMapper.queryAllAccount0();
    }

    @Override
    public List<Accounts> queryAccountByName(String name) {
        return accountMapper.queryAccountByName(name);
    }

    @Override
    public List<Accounts> queryAccountByDepart(String department) {
        return accountMapper.queryAccountByDepart(department);
    }

    @Override
    public boolean login(int id,String password, HttpSession session) {

         List<Accounts> accounts=accountMapper.queryAccountByIdPass(id,password);
        //如果用户存在，放入session域
        if(accounts.size()>0) {
            session.setAttribute("account", accounts.get(0));
            return  true;
        }else {
            return false;
        }
    }

}
