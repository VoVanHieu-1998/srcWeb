package com.cdweb.controller.client.api;

import com.cdweb.entity.*;
import com.cdweb.service.IProductDetailService;
import com.cdweb.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("api/getImgProductDetail/")
@SessionAttributes({"cart"})
public class APIProductDetail {
    @Autowired
    IProductDetailService iProductDetailService;
    @Autowired
    IProductService iProductService;
    List<CartSession> cartSessions = new ArrayList<>();

    @RequestMapping(value = "{id}", method = RequestMethod.GET, produces = org.springframework.http.MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ProductDetail getImgProductDetail(@PathVariable(name = "id") int id) {
        ProductDetail pd = this.iProductDetailService.getPDById(id);
        Spec spec = new Spec();
        spec.setSpecsId(pd.getSpec_proDetail().getSpecsId());

        SpecDetail specDetail ;
        Set<SpecDetail> specDetails = new HashSet<>();

        for (SpecDetail sd : pd.getSpec_proDetail().getSpecDetails()) {
            specDetail = new SpecDetail();
            specDetail.setSpecsdetailId(sd.getSpecsdetailId());
            specDetail.setName(sd.getName());
            specDetail.setValue(sd.getValue());
            specDetails.add(specDetail);
        }

        spec.setSpecDetails(specDetails);

        ProductDetail pro = new ProductDetail();
        pro.setProductdetailId(pd.getProductdetailId());
        pro.setSpec_proDetail(spec);
        pro.setColor_proDetail(pd.getColor_proDetail());
        pro.setPrice(pd.getPrice());
        pro.setImg_url(pd.getImg_url());
        pro.setCreateDate(pd.getCreateDate());
        pro.setUpdateDate(pd.getUpdateDate());
        return pro;
    }

}

