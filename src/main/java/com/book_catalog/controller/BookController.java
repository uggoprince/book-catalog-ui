package com.book_catalog.controller;

import com.book_catalog.model.Book;
import com.book_catalog.service.BookService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class BookController {
    private static final Logger log = LoggerFactory.getLogger(BookController.class);
    private final BookService bookService;

    @Autowired
    public BookController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping("/")
    public String index(Model model) {
        List<Book> books = bookService.getBooks();
        model.addAttribute("books", books);
        return "index"; // Refers to WEB-INF/views/index.jsp
    }

//    @RequestMapping("/error")
//    public String handleError() {
//        return "error"; // Return the name of your custom error page
//    }
}
