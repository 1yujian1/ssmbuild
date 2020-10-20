package com.hekaihang.dao;

import com.hekaihang.pojo.Books;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookMapper {
    //增删改查
    int addBook(Books books);

    int deleteBookById(@Param("bookId") int id);

    int updateBook(Books books);

    Books queryBookById(@Param("bookId") int id);

    //查询全部的书
    List<Books> queryAllBook();

    Books queryBookByName(String name);

}
