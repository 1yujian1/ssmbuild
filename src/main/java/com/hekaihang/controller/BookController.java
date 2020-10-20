package com.hekaihang.controller;

import com.hekaihang.pojo.Books;
import com.hekaihang.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {
    //controller 调service 层
    @Autowired
    @Qualifier("BookServiceImpl")
    private BookService bookService;

    //查询全部的书籍，并且返回到一个书籍展示页面
    @RequestMapping("/allBook")
    public String list(Model model){
        List<Books> list=bookService.queryAllBook();
        model.addAttribute("list",list);

        return "/allBook.jsp";
    }

    //跳转到增加页面
    @RequestMapping("/toAddBook")
    public String toAddPaper(){
        return "/addBook.jsp";
    }

    //添加书籍的请求
    @RequestMapping("/addBook")
    public String addBook(Books books){
        System.out.println("addBook=>"+books);
        bookService.addBook(books);
        return "redirect:/book/allBook";//重定向到我们的@RequestMapping("/allBook")请求
    }

    //跳转到修改页面,修改需要带点信息到这个页面,id是前端页面按修改键带来的bookid
    @RequestMapping("/toUpdate")
    public String toUpdatePaper(int id,Model model){
        Books books=bookService.queryBookById(id);
        model.addAttribute("QBook",books);//定义这个QBook的原因是为了在修改页面取出来
        return "/updateBook.jsp";
    }


    //修改书籍
    @RequestMapping("/UpdateBook")
    public String updateBook(Books books){
        System.out.println("updateBook=>"+books);
        bookService.updateBook(books);
        return "redirect:/book/allBook";//重定向到我们的@RequestMapping("/allBook")请求,重新再查一遍数据库
    }

    //删除书籍
    @RequestMapping("/DeleteBook/{bookId}")
    public String deleteBook(@PathVariable("bookId") int id){
        bookService.deleteBookById(id);
        return "redirect:/book/allBook";
    }

    //按书名查询
    @RequestMapping("/queryBookByName")
    public String queryBook(String queryBookName,Model model){
        Books books=bookService.queryBookByName(queryBookName);
        List<Books> list=new ArrayList<>();
        list.add(books);
        if(books==null){
            list=bookService.queryAllBook();
            model.addAttribute("error","未查到");
        }

        model.addAttribute("list",list);
        return "/allBook.jsp";
    }



}
