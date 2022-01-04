package com.nhky.config.safe;

import com.nhky.annotation.Xss;
import org.apache.logging.log4j.core.config.plugins.validation.ConstraintValidator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 自定义xss校验注解实现
 * 
 * @author ruoyi
 */
public class XssValidator implements ConstraintValidator<Xss>
{
    private final String HTML_PATTERN = "<(\\S*?)[^>]*>.*?|<.*? />";

//    @Override
//    public boolean isValid(String value, ConstraintValidatorContext constraintValidatorContext)
//    {
//        return false;
//    }

    @Override
    public void initialize(Xss xss) {

    }

    @Override
    public boolean isValid(Object o) {
        Pattern pattern = Pattern.compile(HTML_PATTERN);
        Matcher matcher = pattern.matcher(String.valueOf(o));
        return matcher.matches();
    }
}