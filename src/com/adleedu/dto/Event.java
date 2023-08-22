package com.adleedu.dto;

public class Event {
  private int eno;
  private boolean status = true;
  private String regdate;
  private String startdate = null;
  private String enddate = null;
  private String title;
  private String content;
  private String img_name;
  private String img_path;

  private int cnt = 0;

  public Event() {
  }

  public Event(int eno, boolean status, String regdate, String startdate, String enddate, String title, String content, String img_name, String img_path, int cnt) {
    this.eno = eno;
    this.status = status;
    this.regdate = regdate;
    this.startdate = startdate;
    this.enddate = enddate;
    this.title = title;
    this.content = content;
    this.img_name = img_name;
    this.img_path = img_path;
    this.cnt = cnt;
  }

  public void print(){
    System.out.print(this.eno);
    System.out.print(this.status);
    System.out.print(this.regdate);
    System.out.print(this.startdate);
    System.out.print(this.enddate);
    System.out.print(this.title);
    System.out.print(this.content);
    System.out.print(this.img_name);
    System.out.println(this.img_path);
  }
  public int getEno() {
    return eno;
  }

  public void setEno(int eno) {
    this.eno = eno;
  }

  public boolean isStatus() {
    return status;
  }

  public void setStatus(boolean status) {
    this.status = status;
  }

  public String getRegdate() {
    return regdate;
  }

  public void setRegdate(String regdate) {
    this.regdate = regdate;
  }

  public String getStartdate() {
    return startdate;
  }

  public void setStartdate(String startdate) {
    this.startdate = startdate;
  }

  public String getEnddate() {
    return enddate;
  }

  public void setEnddate(String enddate) {
    this.enddate = enddate;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getImg_name() {
    return img_name;
  }

  public void setImg_name(String img_name) {
    this.img_name = img_name;
  }

  public String getImg_path() {
    return img_path;
  }

  public void setImg_path(String img_path) {
    this.img_path = img_path;
  }

  public int getCnt() {
    return cnt;
  }

  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
}
