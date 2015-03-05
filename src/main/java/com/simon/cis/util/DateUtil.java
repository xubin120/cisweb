/*
 * Copyright (c) 2013, FPX and/or its affiliates. All rights reserved.
 * Use, Copy is subject to authorized license.
 */
package com.simon.cis.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 日期工具类
 * 
 * @author simon
 * @date 2014年12月8日
 */
public class DateUtil {

//    private static Logger logger = Logger.getLogger(DateUtil.class);
    
    /**
     * 后一天
     */
    private static final int NEXT_DAY = 1;
    
    /**
     * 前一天
     */
    private static final int PREVIOUS_DAY = -1;
    
    /**
     * 当晚24点
     */
    private static final int TONIGHT_24_POINTS = 24;
    
    /**
     * 得到指定格式的日期/时间
     * 
     * @param formatStr 日期格式，例如：yyyy-MM-dd / yyyy-MM-dd HH:mm:ss
     * @param date Date型时间
     * @return 转换后的日期
     */
    public static String getDateString(String formatStr, Date date) {
        String dateStr = "";
        try {
            SimpleDateFormat sdf = new SimpleDateFormat(formatStr);
            dateStr = sdf.format(date.getTime());
        } catch (IllegalArgumentException iae) {
        }

        return dateStr;
    }

    /**
     * 得到指定格式的日期/时间
     * 
     * @param formatStr 日期格式，例如：yyyy-MM-dd / yyyy-MM-dd HH:mm:ss
     * @param date Date型时间
     * @return 转换后的日期
     */
    @SuppressWarnings("deprecation")
    public static String getDateString(String formatStr, String date)  {
        String dateStr = "";
        try {
            SimpleDateFormat sdf = new SimpleDateFormat(formatStr);
            dateStr = sdf.format(sdf.parse(date));
        } catch (ParseException iae) {
            iae.printStackTrace();
        }

        return dateStr;
    }

    /**
     * 将String类型日期转换为Date类型
     * 
     * @param s String类型日期
     * @return Date类型日期
     */
    public static Date getStringToDate(String s) {
        Date date = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            date = sdf.parse(s);
        } catch (ParseException pe) {
        }

        return date;
    }

    /**
     * 获取指定日期后一天日期
     * 
     * @param specifiedDate 指定日期
     * @return 后一天日期
     */
    public static Date getNextDay(Date specifiedDate) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(specifiedDate);
        calendar.add(Calendar.DAY_OF_MONTH, NEXT_DAY);
        return calendar.getTime();
    }

    /**
     * 获取指定日期前一天日期
     * 
     * @param specifiedDate 指定日期
     * @return 前一天日期
     */
    public static Date getPreviousDay(Date specifiedDate) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(specifiedDate);
        calendar.add(Calendar.DAY_OF_MONTH, PREVIOUS_DAY);
        return calendar.getTime();
    }

    /**
     * 获得指定日期当天0点时间
     * 
     * @param date 指定日期
     * @return 当天0点时间
     */
    public static Date getDayMorning(Date date) {
        Calendar cal = Calendar.getInstance();

        cal.setTime(date);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.MILLISECOND, 0);

        return cal.getTime();
    }

    /**
     * 获得指定日期当天24点时间
     * 
     * @param date 指定日期
     * @return 当天24点时间
     */
    public static Date getDayNight(Date date) {
        Calendar cal = Calendar.getInstance();

        cal.setTime(date);
        cal.set(Calendar.HOUR_OF_DAY, TONIGHT_24_POINTS);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.MILLISECOND, 0);

        return cal.getTime();
    }

    /**
     * 日期比较
     * 
     * @param specifiedTimeMillis 指定的时间
     * @return 计较结果，指定的时间在指定的0点~24点范围内，则返回true，否则返回false
     */
    public static boolean compareTime(long specifiedTimeMillis) {
        boolean isGreater = false;
        Calendar startCalendar = Calendar.getInstance();
        Calendar endCalendar = Calendar.getInstance();
        Calendar currentCalendar = Calendar.getInstance();
        Calendar spamMailModifyCalendar = Calendar.getInstance();

        Date specifiedDate = getPreviousDay(currentCalendar.getTime());
        Date startDate = getDayMorning(specifiedDate);
        Date endDate = getDayNight(specifiedDate);

        startCalendar.setTime(startDate);
        endCalendar.setTime(endDate);
        spamMailModifyCalendar.setTime(new Date(specifiedTimeMillis));

        int compareStartValue = spamMailModifyCalendar.compareTo(startCalendar);
        int compareEndValue = spamMailModifyCalendar.compareTo(endCalendar);

        if (compareStartValue > 0 && compareEndValue < 0) {
            isGreater = true;
        }
        return isGreater;
    }
    
    /**
     * 处理日期或时间
     * 
     * @param format 日期或时间格式
     * @param date 日期或时间
     * @return 处理后的值
     */
    public static String dealDateOrDateTime(String format, String date) {
        return date == null ? "" : getDateString(format, date); 
    }
}
