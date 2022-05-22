package com.example.webnhacdeepdark.model;

public class ObjectResponse {
    private String message ;
    private Object data ;

    public ObjectResponse(String message, Object data) {
        this.message = message;
        this.data = data;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String messgae) {
        this.message = messgae;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
