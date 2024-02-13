package com.example.stompchat.Controller;

import com.example.stompchat.Dto.ChatMessage;
import lombok.RequiredArgsConstructor;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Component;


@Component
@RequiredArgsConstructor
public class KafkaListener {

    private final SimpMessagingTemplate messagingTemplate;

    @org.springframework.kafka.annotation.KafkaListener(topics="chat", groupId="test", containerFactory = "factory")
    public void test(ChatMessage chatMessage) {
        System.out.println("kafka listenr: " + chatMessage.getMessage());
//        System.out.println(chatMessage.key());
//        System.out.println(chatMessage.value());
//        System.out.println(chatMessage.value().getMessage());
//        messagingTemplate.convertAndSend("/topic/chat/", chatMessage.value());
    }


}
