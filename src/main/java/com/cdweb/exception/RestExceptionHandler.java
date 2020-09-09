package com.cdweb.exception;

import com.cdweb.exception.auth.LoginException;
import com.cdweb.exception.searchProduct.SearchProductException;
import com.cdweb.model.response.ApiErrorResponse;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.HashMap;
import java.util.Map;

@ControllerAdvice
public class RestExceptionHandler {

    @ExceptionHandler(LoginException.class)
    public ResponseEntity<ApiErrorResponse> handleException(LoginException exc) {
        ApiErrorResponse error = new ApiErrorResponse();

        error.setTimeStamp(System.currentTimeMillis());
        error.setStatus(HttpStatus.UNAUTHORIZED.value());
        error.setError(HttpStatus.UNAUTHORIZED.getReasonPhrase());
        error.setErrors("");
        error.setMessage(exc.getMessage());

        return new ResponseEntity<>(error, HttpStatus.UNAUTHORIZED);
    }

    @ExceptionHandler(SearchProductException.class)
    public ResponseEntity<ApiErrorResponse> handleException(SearchProductException exc) {
        ApiErrorResponse error = new ApiErrorResponse();

        error.setTimeStamp(System.currentTimeMillis());
        error.setStatus(HttpStatus.NOT_FOUND.value());
        error.setError(HttpStatus.NOT_FOUND.getReasonPhrase());
        error.setErrors("");
        error.setMessage(exc.getMessage());

        return new ResponseEntity<>(error, HttpStatus.NOT_FOUND);
    }

//    @ExceptionHandler(Exception.class)
//    public ResponseEntity<ApiErrorResponse> handleException(Exception exc) {
//        ApiErrorResponse error = new ApiErrorResponse();
//
//        error.setTimeStamp(System.currentTimeMillis());
//        error.setStatus(HttpStatus.BAD_REQUEST.value());
//        error.setError(HttpStatus.BAD_REQUEST.getReasonPhrase());
//        error.setErrors("");
//        error.setMessage(exc.getMessage());
//
//        return new ResponseEntity<>(error, HttpStatus.BAD_REQUEST);
//    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ApiErrorResponse> handleException(MethodArgumentNotValidException exc) {
        Map<String, String> errors = new HashMap<>();
        exc.getBindingResult().getAllErrors().forEach((error) -> {
            String fieldName = ((FieldError) error).getField();
            String errorMessage = error.getDefaultMessage();
            errors.put(fieldName, errorMessage);
        });

        ApiErrorResponse error = new ApiErrorResponse();

        error.setTimeStamp(System.currentTimeMillis());
        error.setStatus(HttpStatus.UNPROCESSABLE_ENTITY.value());
        error.setError(HttpStatus.UNPROCESSABLE_ENTITY.getReasonPhrase());
        error.setErrors(errors);
        error.setMessage("The given data was invalid.");

        return new ResponseEntity<>(error, HttpStatus.UNPROCESSABLE_ENTITY);
    }
}
