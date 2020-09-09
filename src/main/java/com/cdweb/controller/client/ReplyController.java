package com.cdweb.controller.client;

import com.cdweb.entity.Reply;
import com.cdweb.entity.ReplyForm;
import com.cdweb.model.response.JSonResponse2;
import com.cdweb.service.ICommentService;
import com.cdweb.service.IReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

@Controller
public class ReplyController {
    @Autowired
    IReplyService iReplyService;
    @Autowired
    ICommentService iCommentService;
    @RequestMapping(value = "/reply/add", method = RequestMethod.POST, produces = org.springframework.http.MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public JSonResponse2 reply(@ModelAttribute("dataReply") ReplyForm replyForm,
                               BindingResult results, Errors errors) {

        System.out.println("name" + replyForm.getName());
        System.out.println("comment id" + replyForm.getCommentId());

        JSonResponse2 response = new JSonResponse2();
        ValidationUtils.rejectIfEmptyOrWhitespace(results, "name", "Họ tên không được để trống.");
        ValidationUtils.rejectIfEmptyOrWhitespace(results, "email", "Email không được để trống.");

        if (replyForm.getReplyContent().length() < 5) {
            errors.reject("replyContent", "Nội dung đánh giá quá ít. Vui lòng nhập thêm nội dung đánh giá về sản phẩm..");
        }
        if(StringUtils.isEmpty(replyForm.getCommentId())) {
            errors.reject("commentId", "Chưa chọn");
        }


        if (!results.hasErrors()) {

            Reply reply = new Reply();
            reply.setComment_reply(this.iCommentService.getCommentById(replyForm.getCommentId()));
            reply.setContent(replyForm.getReplyContent());
            reply.setName(replyForm.getName());
            reply.setEmail(replyForm.getEmail());
            reply.setPhoneNumber(replyForm.getSdt());
            reply.setActiveFlag(1);
            reply.setCreateDate(new Date());

            try {
                int id= this.iReplyService.addReply(reply);
                response.setStatus("SUCCESS");
            } catch (Exception e) {

                e.printStackTrace();
                response.setStatus("FAIL");

            }
        }

        else {
            response.setStatus("FAIL");
            response.setResult(results.getAllErrors());
        }

        return response;

    }
}
