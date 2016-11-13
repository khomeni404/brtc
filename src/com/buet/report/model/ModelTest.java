package com.buet.report.model;

import java.util.ArrayList;

public class ModelTest {
    public static void main(String[] args) {
        DataBeanList DataBeanList = new DataBeanList();
        ArrayList<DataBean> dataBeans = DataBeanList.getDataBeanList();
        for(DataBean dataBean : dataBeans) {
            System.out.println(dataBean.getName());
        }
    }
}
