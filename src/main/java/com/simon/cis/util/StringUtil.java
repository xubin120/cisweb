package com.simon.cis.util;

public class StringUtil {
    /**
     * 判断字符串是否为null或者为空字符串
     * 
     * @param str
     * @return
     */
    public static boolean isEmpty(String str) {
        return str == null || str.length() == 0;
    }

    public static String[] stringToArray(String str) {
        String[] strArr = str.split(",");
        return strArr;
    }
}
