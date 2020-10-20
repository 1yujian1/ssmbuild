package com.hekaihang.pojo;

public class Orders {
    int sorder;
    int product_id;
    int product_num;
    String sorder_status;


    public int getSorder() {
        return sorder;
    }

    public void setSorder(int sorder) {
        this.sorder = sorder;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getProduct_num() {
        return product_num;
    }

    public void setProduct_num(int product_num) {
        this.product_num = product_num;
    }

    public String getSorder_status() {
        return sorder_status;
    }

    public void setSorder_status(String sorder_status) {
        this.sorder_status = sorder_status;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "sorder=" + sorder +
                ", product_id=" + product_id +
                ", product_num=" + product_num +
                ", sorder_status='" + sorder_status + '\'' +
                '}';
    }
}
