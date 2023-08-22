package com.adleedu.dto;

public class Dat {

    private int dno;
    private String id;
    private String content;
    private String resdate;
    private int par;

    public int getDno() {
        return dno;
    }

    public void setDno(int dno) {
        this.dno = dno;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getResdate() {
        return resdate;
    }

    public void setResdate(String resdate) {
        this.resdate = resdate;
    }

    public int getPar() {
        return par;
    }

    public void setPar(int par) {
        this.par = par;
    }

    public Dat() {}

    public Dat(int dno, String id, String content, String resdate, int par) {
        this.dno = dno;
        this.id = id;
        this.content = content;
        this.resdate = resdate;
        this.par = par;
    }

}