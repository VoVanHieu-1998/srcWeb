package com.cdweb.controller.client;

import com.cdweb.entity.Comment;
import com.cdweb.entity.CommentForm;
import com.cdweb.model.response.JsonResponse;
import com.cdweb.service.ICommentService;
import com.cdweb.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

@Controller
public class CommentController {
    @Autowired
    IProductService iProductService;
    @Autowired
    ICommentService iCommentService;

    @RequestMapping(value = "/comment/add", method = RequestMethod.POST, produces = org.springframework.http.MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public JsonResponse comment(Model model, @ModelAttribute("data") CommentForm commentForm,
                                BindingResult result, Errors error) {


        JsonResponse response = new JsonResponse();
        ValidationUtils.rejectIfEmptyOrWhitespace(result, "name", "Họ tên không được để trống.");
        ValidationUtils.rejectIfEmptyOrWhitespace(result, "email", "Email không được để trống.");

        if (commentForm.getCmtContent().length() < 2) {
            error.reject("cmtContent", "Nội dung đánh giá quá ít. Vui lòng nhập thêm nội dung đánh giá về sản phẩm.");
        }


        if (!result.hasErrors()) {


            Comment comment = new Comment();
            comment.setContent(commentForm.getCmtContent());
            comment.setPhoneNumber(commentForm.getSdt());
            comment.setEmail(commentForm.getEmail());
            comment.setName(commentForm.getName());
            comment.setActiveFlag(1);
            comment.setCreateDate(new Date());
            comment.setProduct_cmt(this.iProductService.getProductId(commentForm.getProductId()));


            try {
                int id = this.iCommentService.addComment(comment);
                response.setStatus("SUCCESS");
            } catch (Exception e) {

                e.printStackTrace();
                response.setStatus("FAIL");

            }


        } else {
            response.setStatus("FAIL");
            response.setResult(result.getAllErrors());
        }

        return response;

    }
}
