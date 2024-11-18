package com.book_catalog.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(Exception.class)
    public String handleException(Exception ex, Model model) {
        model.addAttribute("errorMessage", ex.getMessage());
        return "error";
    }

    @ExceptionHandler(ApiUnavailableException.class)
    public String handleBackendUnavailable(ApiUnavailableException ex, Model model) {
        model.addAttribute("errorMessage", ex.getMessage());
        return "backend-error"; // Points to a custom JSP page
    }
}
