package com.hekaihang.pojo;

public class Contracts {
    int scontract;
    String scontract_status;
    int sorder;
    String scontract_name;


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

    public String getScontract_name() {
        return scontract_name;
    }

    public void setScontract_name(String scontract_name) {
        this.scontract_name = scontract_name;
    }

    @Override
    public String toString() {
        return "Contracts{" +
                "scontract=" + scontract +
                ", scontract_status='" + scontract_status + '\'' +
                ", sorder=" + sorder +
                ", scontract_name='" + scontract_name + '\'' +
                '}';
    }
}
