package com.example.configclient.Config;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class configController {

    @Value("${code.message}")
    private String message;
    @Value("${code.info}")
    private String info;

    @GetMapping("/")
    public String test() {
        System.out.println(info);
        return message;
    }

}
