package com.book_catalog.model;


import java.time.LocalDateTime;
import java.util.Date;

public class Book {
    private Long id;
    private String name;
    private String isbnNumber;
    private String author;
    private Date publishedDate;
    private Double price;
    private String type;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
