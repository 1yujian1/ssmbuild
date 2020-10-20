package com.hekaihang.service;

import com.hekaihang.dao.CompanyMapper;
import com.hekaihang.pojo.Companies;

import java.util.List;
import java.util.Map;

public class CompanyServiceImpl implements CompanyService{
    CompanyMapper companyMapper;

    public void setCompanyMapper(CompanyMapper companyMapper) {
        this.companyMapper=companyMapper;
    }

    @Override
    public int addCompany(Companies company) {
        return companyMapper.addCompany(company);
    }

    @Override
    public int deleteCompany(String coname) {
        return companyMapper.deleteCompany(coname);
    }

    @Override
    public int updateCompany(Companies company) {
        return companyMapper.updateCompany(company);
    }

    @Override
    public List<Companies> queryAllCompany() {
        return companyMapper.queryAllCompany();
    }

    @Override
    public List<String> queryAllCompanyName() {
        return companyMapper.queryAllCompanyName();
    }

    @Override
    public String findCompanySort(String coname) {
        return companyMapper.findCompanySort(coname);
    }

    @Override
    public List<Companies> queryCompanyByName(String coname) {
        return companyMapper.queryCompanyByName(coname);
    }

    @Override
    public List<Map<String, Integer>> queryCompany_makeup() {
        return companyMapper.queryCompany_makeup();
    }

    @Override
    public List<Map<String, Integer>> queryCompany_devote() {
        return companyMapper.queryCompany_devote();
    }


}
