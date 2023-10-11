package servlet.admin;

import javabean.Base;
import javabean.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
@WebServlet("/admin/addModelData")
public class ModelDataAdd extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json; charset=utf8");
        // 接受数据
        String sortId = req.getParameter("sortId");
//        String id = req.getParameter("sortId");
        String postId = req.getParameter("postId");
        String postText = req.getParameter("postText");
        String userId = req.getParameter("userId");
        String imageId = req.getParameter("imageId");
        String username = req.getParameter("username");
        String label = req.getParameter("label");


        // 准备数据
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet resultSet = null;
        int result = 0;
        String sql = "";
        int count = 0 ;
        // 准备返回数据
        int code = 1;
        String msg = "";

        try {
            connection = (Connection) Base.getConnection();
            // 查询重复name
            sql = "select count(*) as count from book_sort_list where post_id=?";
            pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, postId);
            resultSet = pstmt.executeQuery();
            if(resultSet.next()) {
                // 有重复
                if(resultSet.getInt("count") > 0) {
                    msg = "postId不能重复";
                }else {
                    // 进行插入
                    sql = "insert into book_sort_list(sort_id, post_id,post_text,user_id,img_id,username,label) values(?,?,?,?,?,?,?)";
                    pstmt = connection.prepareStatement(sql);
                    pstmt.setString(1, sortId);
                    pstmt.setString(2, postId);
                    pstmt.setString(3, postText);
                    pstmt.setString(4, userId);
                    pstmt.setString(5, imageId);
                    pstmt.setString(6, username);
                    pstmt.setString(7, label);
                    result = pstmt.executeUpdate();
                    if(result == 1) {
                        code = 0;
                        msg = "添加成功";
                    }else {
                        msg = "添加失败";
                    }
                }
            }

        } catch (ClassNotFoundException e) {
            msg = "classnotfound";
        } catch (SQLException e) {
            msg = "SQL错误";
        } finally {
            try {
                Base.closeResource(connection, pstmt, resultSet);
            } catch (SQLException e) {
                msg = "关闭失败";
            }
        }

        PrintWriter out = resp.getWriter();
        out.print(Util.jsonResponse(code, msg, null));

    }
}
