package com.hekaihang.dao;

import com.hekaihang.pojo.Companies;

import java.util.List;
import java.util.Map;

public interface CompanyMapper {

    int addCompany(Companies company);

    int deleteCompany(String coname);

    int updateCompany(Companies company);

    String findCompanySort(String coname);

    List<Companies> queryAllCompany();

    List<Companies> queryCompanyByName(String coname);

    List<String> queryAllCompanyName();

    List<Map<String,Integer>> queryCompany_makeup();
    List<Map<String,Integer>> queryCompany_devote();
}
