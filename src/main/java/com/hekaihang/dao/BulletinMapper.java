package com.hekaihang.dao;

import com.hekaihang.pojo.Bulletins;

import java.util.List;

public interface BulletinMapper {

    int addBulletin(Bulletins bulletins);

    int deleteBulById(int id);

    int updateBul(Bulletins bulletins);



    //查询所有公告信息
    List<Bulletins> queryAllBul();

    //通过发布人员id查询公告
    List<Bulletins> queryBulByadmin_id(int id);

    //通过公告标题查询公告
    List<Bulletins> queryBulBytitle(String title);


    List<Bulletins> queryBulByadmin_idtitle(int id,String title);

}
