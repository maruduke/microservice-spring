package com.example.stompchat;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.kafka.annotation.EnableKafka;

@EnableKafka
@SpringBootApplication
public class StompChatApplication {

    public static void main(String[] args) {
        SpringApplication.run(StompChatApplication.class, args);
    }

}
