package com.hekaihang.service;

import com.hekaihang.dao.ContractMapper;
import com.hekaihang.pojo.Contracts;

public class ContractServiceImpl implements ContractService {

    ContractMapper contractMapper;

    public void setContractMapper(ContractMapper contractMapper) {
        this.contractMapper = contractMapper;
    }

    @Override
    public int addContract(Contracts contracts) {
        return contractMapper.addContract(contracts);
    }

    @Override
    public int deleteContractById(int id) {
        return contractMapper.deleteContractById(id);
    }

    @Override
    public Contracts queryAllContracts() {
        return contractMapper.queryAllContracts();
    }

    @Override
    public Contracts queryContractsById(int id) {
        return contractMapper.queryContractsById(id);
    }
}
