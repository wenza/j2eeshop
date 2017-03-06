package com.worstentrepreneur.j2eeshop.api;


import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.worstentrepreneur.j2eeshop.api.objects.UsersTableRow;
import com.worstentrepreneur.j2eeshop.dao.entity.Customer;
import com.worstentrepreneur.utils.CustomerSessionHolder;
import com.worstentrepreneur.utils.TestReq;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/api/v1/*")
public class APIServlet extends HttpServlet{
    public APIServlet() {
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().print("GET HTTP request not supported, use POST");


    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //omp.writeValue(response.getOutputStream(),new APIMessage(apiMessage.method,apiMessage.path));
        HttpSession session = request.getSession();
        CustomerSessionHolder sh = CustomerSessionHolder.get(session);
        try{
            System.out.println("Hello");
            response.setContentType("application/json;charset=UTF-8");
            ObjectMapper omp = new ObjectMapper();
            BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){
                json = br.readLine();
            }
            System.out.println(json);
            APIMessage message = omp.readValue(json,APIMessage.class);
            //response.getWriter().print("{\"status-code\":\"1\"}");




            if(message.method== APIMessage.TYPE_GET){
                if (message.path.startsWith("/api-tests/")) {
                    Integer testID = Integer.valueOf(message.path.substring("/api-tests/".length()));
                    if(testID==1){
                        //response.getWriter().print("{\"status-code\":1}");
                        System.out.println("WRITING RESPONSE");
                        //List<UsersTableRow>  users = new ArrayList<UsersTableRow>();
                        //users.add(new UsersTableRow());users.add(new UsersTableRow());users.add(new UsersTableRow());users.add(new UsersTableRow());users.add(new UsersTableRow());users.add(new UsersTableRow());
                        //omp.writeValue(response.getOutputStream(),users);
                        //response.getWriter().print(omp.writeValueAsString(users));
                        return;
                    }else{

                        response.getWriter().print("{\"status-code\":-2}");
                        return;
                    }
                }else{
                    response.getWriter().print("{\"status-code\":-3}");
                    return;
                }
            }else if(message.method==APIMessage.TYPE_PUT){
                JsonNode requestData = omp.convertValue(message.data, JsonNode.class);//(JsonNode) message.data;//omp.convertValue//(JsonNode) message.data;
                //Customer entityNew = (Customer)message.data;//omp.readValue("123",Customer.class);
                if (message.path.startsWith("/customer/")) {
                    Integer id = Integer.valueOf(message.path.substring("/customer/".length()));
                    Customer entity = sh.jpa.selectByID(Customer.class,id);
                    if(entity==null){
                        //insert
                        omp.readerForUpdating(entity).readValue(requestData);
                        System.out.println("1"+entity);
                        System.out.println("e="+entity.getFirstname());
                        //response.getWriter().print(omp.writeValueAsString(entity));
                    }else{
                        //update
                    }
                    System.out.println("1"+entity);
                    System.out.println("e="+entity.getFirstname());

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("{\"status-code\":-1}");
            return;
        }


        response.getWriter().print("{\"status-code\":-9999}");
    }
}
