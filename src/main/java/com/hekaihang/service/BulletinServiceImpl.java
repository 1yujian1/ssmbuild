package com.hekaihang.service;

import com.hekaihang.dao.BulletinMapper;
import com.hekaihang.pojo.Bulletins;

import java.util.List;

public class BulletinServiceImpl implements BulletinService {
    private BulletinMapper bulletinMapper;

    public void setBulletinMapper(BulletinMapper bulletinMapper) {
        this.bulletinMapper = bulletinMapper;
    }

    @Override
    public int addBulletin(Bulletins bulletins) {
        return bulletinMapper.addBulletin(bulletins);
    }

    @Override
    public int deleteBulById(int id) {
        return bulletinMapper.deleteBulById(id);
    }

    @Override
    public int updateBul(Bulletins bulletins) {
        return bulletinMapper.updateBul(bulletins);
    }


    @Override
    public List<Bulletins> queryAllBul() {
        return bulletinMapper.queryAllBul();
    }

    @Override
    public List<Bulletins> queryBulByadmin_id(int id) {
        return bulletinMapper.queryBulByadmin_id(id);
    }

    @Override
    public List<Bulletins> queryBulBytitle(String title) {
        return bulletinMapper.queryBulBytitle(title);
    }

    @Override
    public List<Bulletins> queryBulByadmin_idtitle(int id, String title) {
        return bulletinMapper.queryBulByadmin_idtitle(id,title);
    }
}
