package com.example.service1.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

@RestController
public class testController {
    @GetMapping("/")
    public Mono<String> test() {
        return Mono.just("test");
    }
}
