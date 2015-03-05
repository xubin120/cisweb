//中文日期时间控件
$.fn.datetimepicker.dates['zh-CN'] = {
  days: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"],
  daysShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日"],
  daysMin:  ["日", "一", "二", "三", "四", "五", "六", "日"],
  months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
  monthsShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
  today: "今天",
  suffix: [],
  meridiem: ["上午", "下午"],
  rtl: false // 从右向左书写的语言你可以使用 rtl: true 来设置
};


//文本框只能输入数字，并屏蔽输入法和粘贴  
$.fn.numeral = function() {     
	$(this).css("ime-mode", "disabled");     
    this.bind("keypress",function(e) {     
        var code = (e.keyCode ? e.keyCode : e.which);  //兼容火狐 IE      
        if(!$.browser.msie&&(e.keyCode==0x8))  //火狐下不能使用退格键     
        {     
        	return ;     
        }     
        return code >= 48 && code<= 57;     
    });     
    this.bind("blur", function() {     
    	if (this.value.lastIndexOf(".") == (this.value.length - 1)) {     
        	this.value = this.value.substr(0, this.value.length - 1);     
        } else if (isNaN(this.value)) {     
            this.value = "";     
        }     
    });     
    this.bind("paste", function() {     
        var s = clipboardData.getData('text');     
        if (!/\D/.test(s));     
        value = s.replace(/^0*/, '');     
        return false;     
    });     
    this.bind("dragenter", function() {     
        return false;     
    });     
    this.bind("keyup", function() {     
    	if (/(^0+)/.test(this.value)) {     
        	this.value = this.value.replace(/^0*/, '');     
        }     
    });     
};   