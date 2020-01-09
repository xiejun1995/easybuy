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
        var $eoStatus=$("#eoStatus");
        var $phone=$("#phone");
        //借助ajax请求用于给order.jsp页面中java代码块中需要用到的entityId，userName传值
        $.ajax({
            url:"fuzzyOrderList",
            type:"GET",
            data:{entityId:$entityId.val(),eoStatus:$eoStatus.val(),phone:$phone.val()},
            dataType:"Json",
            success:function (data) {
                //判断是否输入了订单id或者订单人姓名
                if(data.fuzzyOrderList!=null && data.fuzzyOrderList!=undefined){
                    //遍历订单列表集合
                    //将遍历的订单嵌入到表格当中
                    //将表格内容清空
                    $orderTable.html("");
                    //定义一个字符串变量用于拼接字符串
                    var tables="";
                    //获取返回的数据并将其转换为jquery对象
                    var $orderList=$(data.fuzzyOrderList);
                    $orderList.each(function (index,element) {
                        if(element.eoStatus!=5){
                            tables+="<tr><th colspan='4'>单号："+element.eoId+
                                    "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;创建时间："+element.dateString+
                                    "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订货人姓名："+element.eoUserName+
                                    "</th>"+
                                    "<th colspan='1' id='status' >状态:";
                                    switch (element.eoStatus) {
                                        case 1:
                                            tables+="<span><strong>待审核</strong></span></th></tr>";
                                            break;
                                        case 2:
                                            tables+="<span><strong>审核通过</strong></span></th></tr>";
                                            break;
                                        case 3:
                                            tables+="<span><strong>配货</strong></span></th></tr>";
                                            break;
                                        case 4:
                                            tables+="<span><strong>发货</strong></span></th></tr>";
                                            break;
                                        default:
                                            tables+="<span><strong>状态未知</strong></span></th></tr>";
                                            break;
                                    }
                                    var $orderDetailList=$(element.orderDetailList);
                                    $orderDetailList.each(function (i,ele) {
                                       tables+="<tr><td class='first w4 c'>"+
                                           "<a href='product-careful.jsp?epId="+ele.product.epId+"'><img src='../images/product/"+ele.product.epFileName+"'/></a>"+
                                           "<a href='product-careful.jsp?epId="+ele.product.epId+"'>"+ele.product.epName+"</a>"+
                                           "</td><td >"+ele.product.epPrice+
                                           "</td><td>"+ele.eodQuantity+
                                           "</td><td>合计："+ele.eodCost+"</td>";
                                            if(i==0){
                                                tables+="<td class='w1 c' rowspan='"+$orderDetailList.size()+"'>"+
                                                "总计："+element.eoCost+
                                                "</td>";
                                            }
                                          tables+="</tr>"
                                    });
                        }
                    });
                    $orderTable.html(tables);
                    $ul.hide();
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