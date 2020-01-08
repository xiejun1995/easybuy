$(function () {
    //根据订单id和订单人姓名使用Ajax查询相关订单列表
    //选取查询按钮元素
    var $btn=$("#btn");
    //选取表格元素
    var $orderTable=$("#orderList");
    //获取表格中的数据
    var $orderTableHtml=$orderTable.html();
    //选取ul列表
    var $ul=$("#list");
    //给查询按钮绑定一个click事件
    $btn.click(function() {
                var $entityId=$("#entityId");
                var $userName=$("#userName");
                //借助ajax请求用于给order.jsp页面中java代码块中需要用到的entityId，userName传值
                $.ajax({
                    url:"fuzzyOrderList",
                    type:"GET",
                    data:{entityId:$entityId.val(),userName:$userName.val()},
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
                            tables+="<c:forEach items=\"${orderList}\" var=\"order\" varStatus=\"index\">"+
                                    "<c:if test=\"${order.eoStatus!=5}\">"+
                                    "<tr>"+
                                    "<th colspan=\"2\">"+
                                    "单号：${order.eoId}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                                    "时间：<fmt:formatDate value=\"${order.eoCreateTime}\" pattern=\"yyyy-MM-dd HH:mm:ss\"></fmt:formatDate>"+
                                    "</th>"+
                                    "<th colspan=\"2\" id=\"status\">状态:"+
                                    "<c:choose >"+
                                    "<c:when test=\"${order.eoStatus==1}\">"+
                                    "<span><strong>待审核</strong></span>"+
                                    "</c:when>"+
                                    "<c:when test=\"${order.eoStatus==2}\">"+
                                    "<span><strong>审核通过</strong></span>"+
                                    "</c:when>"+
                                    "<c:when test=\"${order.eoStatus==3}\">"+
                                    "<span><strong>配货</strong></span>"+
                                    "</c:when>"+
                                    "<c:when test=\"${order.eoStatus==4}\">"+
                                    "<span><strong>发货</strong></span>"+
                                    "</c:when>"+
                                    "<c:otherwise>"+
                                    "<span><strong>状态未知</strong></span>"+
                                    "</c:otherwise>"+
                                    "</c:choose>"+
                                    "</th>"+
                                    "</tr>"+
                                    "<c:forEach items=\"${order.orderDetailList}\" var=\"orderDetail\" varStatus=\"index\">"+
                                    "<tr>"+
                                    "<td class=\"first w4 c\">"+
                                    "<img src=\"${pageContext.request.contextPath}/statics/images/product/${orderDetail.product.epFileName}\" /><a href=\"${pageContext.request.contextPath}/statics/product-view.jsp?epId=${orderDetail.product.epId}\" >${orderDetail.product.epName}</a>"+
                                    "</td>"+
                                    "<td >"+
                                    "${orderDetail.product.epPrice}"+
                                    "</td>"+
                                    "<td>"+
                                    "${orderDetail.eodQuantity}"+
                                    "</td>"+
                                    "<c:if test=\"${index.first}\">"+
                                    "<td class=\"w1 c\" rowspan=\"${order.orderDetailList.size()}\">"+
                                    "总计：${order.eoCost}"+
                                    "</td>"+
                                    "</c:if>"+
                                    "</c:forEach>"+
                                    "</tr>"+
                                    "</c:if>"+
                                    "</c:forEach>"
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