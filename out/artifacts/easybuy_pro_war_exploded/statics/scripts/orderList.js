$(function () {
    //根据订单id和订单人姓名使用Ajax查询相关订单列表
    var $btn=$("#btn");
    //选取表格元素
    var $orderTable=$("#orderList");
    //获取表格中的数据
    var $orderTableHtml=$orderTable.html();
    //选取ul列表
    var $ul=$("#list");
    $btn.click(function() {
                var $entityId=$("#entityId");
                var $userId=$("#userId");
                //借助ajax请求用于给order.jsp页面中java代码块中需要用到的entityId，userName传值
                $.ajax({
                    url:"fuzzyOrderList",
                    type:"GET",
                    data:{entityId:$entityId.val(),usrName:$userId.val()},
                    dataType:"Json",
                    success:function (data) {
                        //判断是否输入了订单id或者订单人姓名
                        if(data.orderList!=null){
                            //获取返回的结果集
                            var orderList=data.orderList;
                            //遍历订单列表集合
                            //将遍历的订单嵌入到表格当中
                            //将表格内容清空

                            $orderTable.html("");
                            var tables="";
                            //将获取到的订单列表进行遍历
                            tables+="<c:forEach items=\"orderList\" var=\"order\" varStatus=\"index\">"+
                                "<tr>" +
                                "<th colspan=\"2\">" +
                                "单号：${order.eo_id}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                                "时间：<fmt:formatDate value=\"${order.eo_create_time}\" pattern=\"yyyy-MM-dd\"></fmt:formatDate>" +
                                "</th>" +
                                "<th colspan=\"2\">状态:<select name=\"status\">" +
                                "<option value=\"1\"  >待审核</option>" +
                                "<option value=\"2\"  >审核通过</option>" +
                                "<option value=\"3\"  >配货</option>" +
                                "<option value=\"4\" >发货</option>" +
                                "<option value=\"5\"  >收货确认</option>" +
                                "</select>" +
                                "</th>" +
                                "</tr>" +
                                "<c:forEach items=\"${order.orderDetailList}\" var=\"orderDetail\" varStatus=\"index\">" +
                                "<tr>" +
                                "<td class=\"first w4 c\">" +
                                "<img src=\"../images/product/${orderDetail.product.ep_file_name}\" />${orderDetail.product.ep_name}" +
                                "</td>" +
                                "<td >" +
                                "${orderDetail.product.ep_price}" +
                                "</td>" +
                                "<td>" +
                                "${orderDetail.eod_quantity}" +
                                "</td>" +
                                "<c:if test=\"${index.first}\">" +
                                "<td class=\"w1 c\" rowspan=\"${order.orderDetailList.size()}\">" +
                                "总计：${order.eo_cost}" +
                                "</td>" +
                                "</c:if>"
                                "</c:forEach>" +
                                "</tr>" +
                                "</c:forEach>"
                            $("select").find("option[value = '"+ele.eo_status+"']").attr("selected","selected");
                            $orderTable.html(tables);
                            $ul.hide();
                        }else if(data.messeage==0){
                            $orderTable.html($orderTableHtml);
                            $ul.show();
                        }else{
                            alert(data.messeage);
                            $orderTable.html($orderTableHtml);
                            $ul.show();
                        }
                    },
                    error:function () {
                        alert("查询失败，请重试!");
                    }
                })
            });
});