package com.cdweb.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "menuitems")
public class MenuItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    String menu_name;
    String icon;
    String link;
    int parent_menu;
    String menu_background;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMenu_name() {
        return menu_name;
    }

    public void setMenu_name(String menu_name) {
        this.menu_name = menu_name;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public int getParent_menu() {
        return parent_menu;
    }

    public void setParent_menu(int parent_menu) {
        this.parent_menu = parent_menu;
    }

    public String getMenu_background() {
        return menu_background;
    }

    public void setMenu_background(String menu_background) {
        this.menu_background = menu_background;
    }
}
