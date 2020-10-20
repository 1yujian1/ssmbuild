package com.hekaihang.controller;

import com.hekaihang.pojo.Contracts;
import com.hekaihang.service.ContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/contract")
public class ContractController {
    @Autowired
    @Qualifier("ContractServiceImpl")
    private ContractService contractService;

    @RequestMapping("/toaddcontract")
    public String toContract(){
        return "/add_contract";
    }

    @RequestMapping("/addcontract")
    public String addContract(String scontract,String scontract_name){
        Contracts contracts=new Contracts();
        contracts.setScontract(Integer.valueOf(scontract));
        contracts.setScontract_name(scontract_name);
        contracts.setScontract_status("待审核");
        contracts.setSorder(Integer.valueOf(scontract));
        contractService.addContract(contracts);
        return "/add_contract";
    }

}
