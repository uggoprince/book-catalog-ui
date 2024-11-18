package com.book_catalog.service;

import com.book_catalog.exception.ApiUnavailableException;
import com.book_catalog.model.ApiResponse;
import com.book_catalog.model.Book;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.ws.rs.ClientErrorException;
import javax.ws.rs.ProcessingException;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.MediaType;
import java.util.List;

import javax.annotation.PreDestroy;

@Service
public class BookService {
    @Value("${api.url}")
    private String apiUrl;

    private final Client client;

    public BookService() {
        this.client = ClientBuilder.newClient();
    }

    public List<Book> getBooks() {
        WebTarget target = client.target(apiUrl).path("books");
        try {
            // Use GenericType to properly parse the JSON into a List of Book objects
            ApiResponse response = target.request(MediaType.APPLICATION_JSON)
                    .get(ApiResponse.class);
            return (List<Book>) response.getData();
        } catch (ClientErrorException | ProcessingException e) {
            // Handle the error, maybe log it
            throw new RuntimeException("Error fetching books", e);
        } catch (WebApplicationException ex) {
            throw new ApiUnavailableException("The backend API is currently unreachable.", ex);
        }
    }

    @PreDestroy
    public void close() {
        if (client != null) {
            client.close();  // Ensure resources are freed
        }
    }
}

