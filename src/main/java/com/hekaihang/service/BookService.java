package com.hekaihang.service;

import com.hekaihang.pojo.Books;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookService {

    //增删改查
    int addBook(Books books);

    int deleteBookById( int id);

    int updateBook(Books books);

    Books queryBookById( int id);

    //查询全部的书
    List<Books> queryAllBook();

    Books queryBookByName(String name);


}
