package com.hekaihang.service;

import com.hekaihang.dao.BookMapper;
import com.hekaihang.pojo.Books;

import java.util.List;

public class BookServiceImpl implements BookService {

    //业务层调持久层：组合dao层
    private  BookMapper bookMapper;

    public void setBookMapper(BookMapper bookMapper) {
        this.bookMapper = bookMapper;
    }

    @Override
    public int addBook(Books books) {
        return bookMapper.addBook(books);
    }

    @Override
    public int deleteBookById(int id) {
        return bookMapper.deleteBookById(id);
    }

    @Override
    public int updateBook(Books books) {
        return bookMapper.updateBook(books);
    }

    @Override
    public Books queryBookById(int id) {
        return bookMapper.queryBookById(id);
    }

    @Override
    public List<Books> queryAllBook() {
        return bookMapper.queryAllBook();
    }

    @Override
    public Books queryBookByName(String name) {
        return bookMapper.queryBookByName(name);

    }
}
