package com.simon.cis.util;

import java.util.MissingResourceException;
import java.util.ResourceBundle;

import org.apache.log4j.Logger;

/**
 * 资源文件工具类
 * 
 * @author simon
 * @date 2014年12月7日
 */
public class PropertiesUtil {
    
    private static Logger logger = Logger.getLogger(PropertiesUtil.class);
 
    /**
     * 属性文件名
     */
    private static final String PROPERTY_FILENAME = "config";

    /**
     * 资源文件对象
     */
    private static ResourceBundle rb = null;

    static {
        try {
            rb = ResourceBundle.getBundle(PROPERTY_FILENAME);
        } catch (MissingResourceException mre) {
        }
    }
    
    /**
     * 获取属性值
     * 
     * @param key 需要取值的键
     * @return 值
     */
    public static String getPropertyValue(String key) throws Exception{
        String val = "";

        val = rb.getString(key);
    
        if (val != null && !val.isEmpty()) {
            val = val.trim();
        }

        return val;
    }
}
