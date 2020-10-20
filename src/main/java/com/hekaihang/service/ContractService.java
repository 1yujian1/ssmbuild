package com.hekaihang.service;

import com.hekaihang.pojo.Contracts;

public interface ContractService {

    int addContract(Contracts contracts);

    int deleteContractById(int id);


    Contracts queryAllContracts();

    Contracts queryContractsById(int id);
}
