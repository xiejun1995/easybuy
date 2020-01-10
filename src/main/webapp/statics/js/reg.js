//日历
$("#birthday").click(function(){
    WdatePicker({
        highLineWeekDay:true //周末高亮
        ,readOnly:true      //只读，只可用控件input中 修改内容
        ,dateFmt:'yyyy-MM-dd'
    });
});
//验证账号是否为空
$(function () {
    $('#userId').blur(function () {
        var user = document.getElementById("userId");
        //判断是否是空的
        if (user.value){
            user.setCustomValidity("");
        }else if (user.validity.valueMissing){
            user.setCustomValidity("请填写用户名");
        };
        //判断是否按照格式填写
        if (user.validity.patternMismatch){
            user.setCustomValidity("用户名必须是字母开头的4~10位的英文字母和数字");
        }
    })
})