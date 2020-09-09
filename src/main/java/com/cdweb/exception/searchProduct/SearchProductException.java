package com.cdweb.exception.searchProduct;

public class SearchProductException extends RuntimeException {

    public SearchProductException() {
    }

    public SearchProductException(String message) {
        super(message);
    }

    public SearchProductException(String message, Throwable cause) {
        super(message, cause);
    }

    public SearchProductException(Throwable cause) {
        super(cause);
    }

    public SearchProductException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }

}
