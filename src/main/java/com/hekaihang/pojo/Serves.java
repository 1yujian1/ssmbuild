package com.hekaihang.pojo;

public class Serves {
    int sid;
    int sserver;
    String scompany;
    int scontract;
    String scontract_status;
    int sorder;
    String sorder_status;
    String serve_status;
    String serve_title;
    String serve_content;
    int serve_creater;

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getSserver() {
        return sserver;
    }

    public void setSserver(int sserver) {
        this.sserver = sserver;
    }

    public String getScompany() {
        return scompany;
    }

    public void setScompany(String scompany) {
        this.scompany = scompany;
    }

    public int getScontract() {
        return scontract;
    }

    public void setScontract(int scontract) {
        this.scontract = scontract;
    }

    public String getScontract_status() {
        return scontract_status;
    }

    public void setScontract_status(String scontract_status) {
        this.scontract_status = scontract_status;
    }

    public int getSorder() {
        return sorder;
    }

    public void setSorder(int sorder) {
        this.sorder = sorder;
    }

    public String getSorder_status() {
        return sorder_status;
    }

    public void setSorder_status(String sorder_status) {
        this.sorder_status = sorder_status;
    }

    public String getServe_status() {
        return serve_status;
    }

    public void setServe_status(String serve_status) {
        this.serve_status = serve_status;
    }

    public String getServe_title() {
        return serve_title;
    }

    public void setServe_title(String serve_title) {
        this.serve_title = serve_title;
    }

    public String getServe_content() {
        return serve_content;
    }

    public void setServe_content(String serve_content) {
        this.serve_content = serve_content;
    }

    public int getServe_creater() {
        return serve_creater;
    }

    public void setServe_creater(int serve_creater) {
        this.serve_creater = serve_creater;
    }

    @Override
    public String toString() {
        return "Serves{" +
                "sid=" + sid +
                ", sserver=" + sserver +
                ", scompany='" + scompany + '\'' +
                ", scontract=" + scontract +
                ", scontract_status='" + scontract_status + '\'' +
                ", sorder=" + sorder +
                ", sorder_status='" + sorder_status + '\'' +
                ", serve_status='" + serve_status + '\'' +
                ", serve_title='" + serve_title + '\'' +
                ", serve_content='" + serve_content + '\'' +
                ", serve_creater=" + serve_creater +
                '}';
    }
}
