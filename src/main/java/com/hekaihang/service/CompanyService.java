package com.hekaihang.service;

import com.hekaihang.pojo.Companies;

import java.util.List;
import java.util.Map;

public interface CompanyService {
    int addCompany(Companies company);

    int deleteCompany(String coname);

    int updateCompany(Companies company);

    List<Companies> queryAllCompany();

    List<String> queryAllCompanyName();

    String findCompanySort(String coname);

    List<Companies> queryCompanyByName(String coname);


    List<Map<String,Integer>> queryCompany_makeup();

    List<Map<String,Integer>> queryCompany_devote();


}
