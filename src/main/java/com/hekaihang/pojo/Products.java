package com.hekaihang.pojo;

public class Products {
    int product_id;
    int product_reserve;
    int product_sale;
    String product_name;

    @Override
    public String toString() {
        return "Products{" +
                "product_id=" + product_id +
                ", product_reserve=" + product_reserve +
                ", product_sale=" + product_sale +
                ", product_name='" + product_name + '\'' +
                '}';
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getProduct_reserve() {
        return product_reserve;
    }

    public void setProduct_reserve(int product_reserve) {
        this.product_reserve = product_reserve;
    }

    public int getProduct_sale() {
        return product_sale;
    }

    public void setProduct_sale(int product_sale) {
        this.product_sale = product_sale;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }
}
