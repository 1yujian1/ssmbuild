package com.hekaihang.dao;

import com.hekaihang.pojo.Contracts;

public interface ContractMapper {

    int addContract(Contracts contracts);

    int deleteContractById(int id);


    Contracts queryAllContracts();

    Contracts queryContractsById(int id);
}
