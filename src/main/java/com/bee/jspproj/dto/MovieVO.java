package com.bee.jspproj.dto;

import lombok.Data;

@Data
public class MovieVO {

    public String getMv_the_origin_url() {
        return mv_the_origin_url;
    }

    public void setMv_the_origin_url(String mv_the_origin_url) {
        this.mv_the_origin_url = mv_the_origin_url;
    }

    public String getMv_title() {
        return mv_title;
    }

    public void setMv_title(String mv_title) {
        this.mv_title = mv_title;
    }

    private String mv_the_origin_url;
    private String mv_title;


}
