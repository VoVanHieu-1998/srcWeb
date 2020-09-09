package com.cdweb.validator;

import com.cdweb.entity.MyFile;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class FileValidator implements Validator {
    @Override
    public boolean supports(Class<?> aClass) {
        return aClass== MyFile.class;
    }

    @Override
    public void validate(Object o, Errors errors) {
        MyFile m = (MyFile) o;
        ValidationUtils.rejectIfEmpty(errors,"folder","msg.required");
    }
}
