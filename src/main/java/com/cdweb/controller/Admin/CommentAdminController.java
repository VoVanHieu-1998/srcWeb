package com.cdweb.controller.Admin;

import com.cdweb.entity.Comment;
import com.cdweb.entity.Product;
import com.cdweb.service.ICommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

@Controller
public class CommentAdminController {
    @Autowired
    ICommentService iCommentService;
    @RequestMapping("admin/comment/list")
    public String comment(ModelMap modelMap){
        List<Comment> commentList=iCommentService.getAll();
        modelMap.addAttribute("commentList",commentList);
        return "admin/comment";
    }
    @RequestMapping("admin/comment/delete/{id}")
    public String delete(@PathVariable int id){
        Comment comment=iCommentService.getCommentById(id);
        comment.setActiveFlag(-1);
        return "redirect:/admin/comment/list";
    }
    @GetMapping("/admin/comment/changeStatusProduct/{id}")
    public String changeStatusProduct(@PathVariable("id") int id){
        System.out.println("status @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        Comment comment = iCommentService.getCommentById(id);

        if (comment!=null){
            if (comment.getActiveFlag()==1){
                comment.setActiveFlag(0);
                comment.setUpdateDate(new Date());
                iCommentService.delete(comment);
            }
            else {
                comment.setActiveFlag(1);
                comment.setUpdateDate(new Date());
                iCommentService.delete(comment);
            }
        }
        return "redirect:/admin/product/list";
    }
}
