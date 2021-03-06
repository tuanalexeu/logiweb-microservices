package com.alekseytyan.client.controller;

import com.alekseytyan.client.dto.ClientLoadDTO;
import com.alekseytyan.client.dto.GenericResponse;
import com.alekseytyan.client.dto.StatusDTO;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.SneakyThrows;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.annotation.PostConstruct;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

@Controller
public class ClientOrderController {

    private Client clientFindOrder;

    @Autowired
    private Environment env;

    @PostConstruct
    public void init() {
        Client clientSaveOrder = ClientBuilder.newClient();
//        targetSaveOrder = clientSaveOrder.target("http://" + env.getProperty("logiweb-host") + "/save-client-order");

        clientFindOrder = ClientBuilder.newClient();
    }

    /**
     * Check if authorized user has any role in Spring security
     * @return - true, if they have
     */
    private boolean isAuthenticated() {
        return SecurityContextHolder.getContext().getAuthentication() != null &&
                SecurityContextHolder.getContext().getAuthentication().isAuthenticated() &&
                //when Anonymous Authentication is enabled
                !(SecurityContextHolder.getContext().getAuthentication()
                        instanceof AnonymousAuthenticationToken);
    }

    @PostMapping(value = "/make-order")
    public String makeOrder(@ModelAttribute ClientLoadDTO clientLoadDTO) {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        String token = UUID.randomUUID().toString();

        ObjectMapper mapper = new ObjectMapper();

        String result = "redirect:/profile?success=";

        try (CloseableHttpClient client = HttpClients.createDefault()) {

            HttpPost request = new HttpPost("http://" + env.getProperty("logiweb-host") + "/save-client-order");

            ArrayList<NameValuePair> postParameters = new ArrayList<>();
            postParameters.add(new BasicNameValuePair("clientId",auth.getName()));
            postParameters.add(new BasicNameValuePair("cityLoad", clientLoadDTO.getCityLoad()));
            postParameters.add(new BasicNameValuePair("cityUnload", clientLoadDTO.getCityUnload()));
            postParameters.add(new BasicNameValuePair("name", clientLoadDTO.getName()));
            postParameters.add(new BasicNameValuePair("weight", String.valueOf(clientLoadDTO.getWeight())));
            postParameters.add(new BasicNameValuePair("status", clientLoadDTO.getStatus().toString()));
            postParameters.add(new BasicNameValuePair("orderToken", token));

            request.setEntity(new UrlEncodedFormEntity(postParameters, "UTF-8"));

            StatusDTO response = client.execute(request, httpResponse ->
                    mapper.readValue(httpResponse.getEntity().getContent(), StatusDTO.class));

            if(response.isSuccess()) {
                result += "true&token=" + token;
            } else {
                result += "false&token" + token;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return result;
    }

    @SneakyThrows
    @GetMapping(value = "/find-order")
    public String findOrder(Model model, @RequestParam String orderToken) {

        ObjectMapper mapper = new ObjectMapper();

        //    private WebTarget targetSaveOrder;
        WebTarget targetFindOrder = clientFindOrder.target(
                "http://" + env.getProperty("logiweb-host") + "/find-client-order?orderToken=" + orderToken
        );


        GenericResponse<ClientLoadDTO> response = mapper.readValue(
                targetFindOrder.request(MediaType.APPLICATION_JSON).get(String.class),
                new TypeReference<GenericResponse<ClientLoadDTO>>(){}
        );

        if(response.getAttachedObj() != null) {
            model.addAttribute("order", response.getAttachedObj());
        } else {
            model.addAttribute("error", "No such order");
        }

        if(isAuthenticated()) {
            return "home";
        }

        return "home-non-auth";
    }

}
