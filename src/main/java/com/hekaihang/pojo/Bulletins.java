package com.hekaihang.pojo;

import java.util.Date;

public class Bulletins {
    private String message;
    private String time;
    private int admin_id;
    private String admin_name;
    private String title;
    private int bul_id;

    public String getAdmin_name() {
        return admin_name;
    }

    public void setAdmin_name(String admin_name) {
        this.admin_name = admin_name;
    }

    public int getBul_id() {
        return bul_id;
    }

    public void setBul_id(int bul_id) {
        this.bul_id = bul_id;
    }


    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public String toString() {
        return "Bulletins{" +
                "message='" + message + '\'' +
                ", time='" + time + '\'' +
                ", admin_id=" + admin_id +
                ", admin_name='" + admin_name + '\'' +
                ", title='" + title + '\'' +
                ", bul_id=" + bul_id +
                '}';
    }
}
