package com.hekaihang.pojo;

public class Companies {
    String coname;
    float cosatisfy;
    int cocredit;
    int coorder;
    String coadress;
    String cophone;
    String csort;
    String cname;
    String csex;
    String cemail;
    String cphone;
    String remark;



    public String getConame() {

        return coname;
    }

    public void setConame(String coname) {
        this.coname = coname;
    }

    public float getCosatisfy() {
        return cosatisfy;
    }

    public void setCosatisfy(float cosatisfy) {
        this.cosatisfy = cosatisfy;
    }

    public int getCocredit() {
        return cocredit;
    }

    public void setCocredit(int cocredit) {
        this.cocredit = cocredit;
    }

    public int getCoorder() {
        return coorder;
    }

    public void setCoorder(int coorder) {
        this.coorder = coorder;
    }

    public String getCoadress() {
        return coadress;
    }

    public void setCoadress(String coadress) {
        this.coadress = coadress;
    }

    public String getCophone() {
        return cophone;
    }

    public void setCophone(String cophone) {
        this.cophone = cophone;
    }

    public String getCsort() {
        return csort;
    }

    public void setCsort(String csort) {
        this.csort = csort;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCsex() {
        return csex;
    }

    public void setCsex(String csex) {
        this.csex = csex;
    }

    public String getCemail() {
        return cemail;
    }

    public void setCemail(String cemail) {
        this.cemail = cemail;
    }

    public String getCphone() {
        return cphone;
    }

    public void setCphone(String cphone) {
        this.cphone = cphone;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Companies{" +
                "coname='" + coname + '\'' +
                ", cosatisfy=" + cosatisfy +
                ", cocredit=" + cocredit +
                ", coorder=" + coorder +
                ", coadress='" + coadress + '\'' +
                ", cophone='" + cophone + '\'' +
                ", csort='" + csort + '\'' +
                ", cname='" + cname + '\'' +
                ", csex='" + csex + '\'' +
                ", cemail='" + cemail + '\'' +
                ", cphone='" + cphone + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
