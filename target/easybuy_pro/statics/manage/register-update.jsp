<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.fileupload.FileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.commons.fileupload.FileUploadException" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.easybuy.pojo.EasyBuy_Product" %>
<%@ page import="com.easybuy.service.commodity.ServiceCommodityDao" %>
<%@ page import="com.easybuy.service.commodity.ServiceCommodityDaoImpl" %>
<%@ page import="com.easybuy.pojo.EasyBuyProduct" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    String fieldName="";
    EasyBuyProduct buy=new EasyBuyProduct();

    //是否是文件上传类型
    boolean flag= ServletFileUpload.isMultipartContent(request);
    out.print(flag);
    //指定上传位置
    String uploadFilepath=request.getSession().getServletContext().getRealPath("images/upload/");

    if(flag){
        FileItemFactory factory=new DiskFileItemFactory();
        ServletFileUpload upload=new ServletFileUpload(factory);
        try {
            List<FileItem> items=upload.parseRequest(request);
            Iterator<FileItem> iter=items.iterator();
            while(iter.hasNext()){
                FileItem item=iter.next();
                if (item.isFormField()){//如果是普通表单控件
                    fieldName=item.getFieldName();
                    switch (fieldName){
                        case  "ep_id":
                            buy.setEpId(Integer.parseInt(item.getString()));
                            break;
                        case "productName":
                            buy.setEpName(item.getString("utf-8"));
                            break;
                        case "productDetail":
                            buy.setEpDescription(item.getString("utf-8"));
                            break;
                        case "parentId":
                            buy.setEpcId(Integer.parseInt(item.getString()));
                            break;
                        case "productPrice":
                            buy.setEpPrice(Float.parseFloat(item.getString()));
                            break;
                        case "productNumber":
                            buy.setEpStock(Integer.parseInt(item.getString()));
                            break;
                    }
                }else{//文件
                    String fileName=item.getName();//获取文件名
                    if (fileName!=null||!fileName.equals("")){
                        File fulFile=new File(fileName);
                        File saveFile=new File(uploadFilepath,fulFile.getName());
                        item.write(saveFile);
                        String uploadFileName=fulFile.getName();
                        buy.setEpFileName(uploadFileName);
                    }
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        System.out.println("修改成功之后的文件名：" + buy.getEpFileName());
       /* System.out.println(buy.getEp_name()+"\t"+buy.getEp_description()+"\t"+buy.getEp_price()+"\t"+
                buy.getEp_stock()+"\t"+buy.getEpc_id()+"\t"+buy.getEp_file_name()+"\t"+buy.getEp_id());*/
        ServiceCommodityDao service=new ServiceCommodityDaoImpl();
        int result=service.updateCommodity(buy);
        System.out.println(result+"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        request.setAttribute("info","修改成功！");
        request.getRequestDispatcher("hint.jsp").forward(request,response);
    }
%>
