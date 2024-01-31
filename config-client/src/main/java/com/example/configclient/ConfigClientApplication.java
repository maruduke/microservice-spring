package com.example.configclient;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;

@SpringBootApplication
public class ConfigClientApplication {


    public static void main(String[] args) {

        SpringApplication.run(ConfigClientApplication.class, args);
    }

}
