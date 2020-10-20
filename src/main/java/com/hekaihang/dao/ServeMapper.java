package com.hekaihang.dao;

import com.hekaihang.pojo.Serves;

import java.util.List;

public interface ServeMapper {

    //新增一个服务
    int addServe(Serves serves);

    //删除一个服务
    int deleteServe(Serves serves);

    //修改服务状态

    int[] findLastServeId();


    //查询所有服务
    List<Serves> findAllServe();

    //查询服务通过id
    Serves findServeById(int sid);

}
