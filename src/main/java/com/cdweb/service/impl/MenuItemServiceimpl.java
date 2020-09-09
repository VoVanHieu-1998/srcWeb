package com.cdweb.service.impl;

import com.cdweb.entity.MenuItem;
import com.cdweb.repo.IMenuitemRepo;
import com.cdweb.service.IMenuIteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuItemServiceimpl implements IMenuIteService {
    @Autowired
    IMenuitemRepo iMenuitemRepo;
    @Override
    public List<MenuItem> getMenu(int parent_menu, int x, int y) {
        return iMenuitemRepo.getMenu(parent_menu,x,y);
    }
}
