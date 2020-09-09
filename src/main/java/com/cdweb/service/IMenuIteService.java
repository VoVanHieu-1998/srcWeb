package com.cdweb.service;

import com.cdweb.entity.MenuItem;

import java.util.List;

public interface IMenuIteService {
    public List<MenuItem> getMenu(int parent_menu, int x, int y);
}
