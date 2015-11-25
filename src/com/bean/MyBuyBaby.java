package com.bean;

/**
 *
 * @author HJZ
 */
public class MyBuyBaby {
    private String picName = "";
    private int count=0;
    private boolean isPay = false;
    private int totMoney = 0;

    public MyBuyBaby() {
    }
    
    public MyBuyBaby(String picName, int count, int totMoney, boolean isPay) {
            this.picName=picName;   
            this.count=count;
            this.totMoney=totMoney;
            this.isPay=isPay;
    }
    /**
     * @return the picName
     */
    public String getPicName() {
        return picName;
    }

    /**
     * @param picName the picName to set
     */
    public void setPicName(String picName) {
        this.picName = picName;
    }

    /**
     * @return the count
     */
    public int getCount() {
        return count;
    }

    /**
     * @param count the count to set
     */
    public void setCount(int count) {
        this.count = count;
    }

    /**
     * @return the isPay
     */
    public boolean isIsPay() {
        return isPay;
    }

    /**
     * @param isPay the isPay to set
     */
    public void setIsPay(boolean isPay) {
        this.isPay = isPay;
    }

    /**
     * @return the totMoney
     */
    public int getTotMoney() {
        return totMoney;
    }

    /**
     * @param totMoney the totMoney to set
     */
    public void setTotMoney(int totMoney) {
        this.totMoney = totMoney;
    }
       
}
