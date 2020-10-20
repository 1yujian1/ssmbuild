package com.hekaihang.service;

import com.hekaihang.dao.ServeMapper;
import com.hekaihang.pojo.Serves;

import java.util.List;

public class ServeServiceImpl implements ServeService {
    ServeMapper serveMapper;

    public void setServeMapper(ServeMapper serveMapper) {
        this.serveMapper = serveMapper;
    }

    @Override
    public int addServe(Serves serves) {
        return serveMapper.addServe(serves);
    }

    @Override
    public int deleteServe(Serves serves) {
        return serveMapper.deleteServe(serves);
    }

    @Override
    public int[] findLastServeId() {
        return serveMapper.findLastServeId();
    }

    @Override
    public List<Serves> findAllServe() {
        return serveMapper.findAllServe();
    }

    @Override
    public Serves findServeById(int sid) {
        return serveMapper.findServeById(sid);
    }
}
