package com.cdweb.tests;

public class Student {
    private int id;
    private String name;

    public Student(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public static void main(String[] args) {
        String st = "[\"0,1,2,3\"]";
        st.replace('[', ' ');
        String[] sts = st.split(",");


        for (int i = 0; i < sts.length; i++) {
            System.out.println(sts[i]);
        }
//        System.out.println(sts.);

    }
}
