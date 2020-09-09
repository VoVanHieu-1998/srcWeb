package com.cdweb.repo;

import com.cdweb.entity.MenuItem;

import java.util.List;

public interface IMenuitemRepo {
    public List<MenuItem> getMenu(int parent_menu, int x, int y);
}
