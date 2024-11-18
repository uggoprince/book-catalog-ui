package com.book_catalog.exception;

public class ApiUnavailableException extends RuntimeException {
    public ApiUnavailableException(String message, Throwable cause) {
        super(message, cause);
    }
}
