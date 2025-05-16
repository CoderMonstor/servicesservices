package com.lmy.services.utils;

public class Result<T> {

    private T data;
    private String code;
    private String msg;
    private Long total;
    private Integer totalPage;

    public static <T> Result<T> error(String msg) {
        return new Result<>("0", msg);
    }
    public Result() {
        this.data = null;
        this.code = "1";
    }

    public Result(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Result(T data, String code, String msg) {
        this.data = data;
        this.code = code;
        this.msg = msg;
    }
    public Result(T data, String code, String msg, Long total, Integer totalPage) {
        this.data = data;
        this.code = code;
        this.msg = msg;
        this.total = total;
        this.totalPage = totalPage;
    }

    public Result(T data, String code, String msg, Integer totalPage) {
        this.data = data;
        this.code = code;
        this.msg = msg;
        this.totalPage = totalPage;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    @Override
    public String toString() {
        return "JsonResult{" +
                "data=" + data +
                ", code='" + code + '\'' +
                ", msg='" + msg + '\'' +
                '}';
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }
}
