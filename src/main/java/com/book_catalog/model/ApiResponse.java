package com.book_catalog.model;

import lombok.Builder;
import lombok.Data;

import java.util.Map;

@Data
@Builder
public class ApiResponse<T> {
    private String message;
    private boolean success;
    private T data;
    private Map<String, String> error;
}
