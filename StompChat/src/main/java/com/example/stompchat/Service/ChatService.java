package com.example.stompchat.Service;

import com.example.stompchat.Dto.ChatMessage;
import lombok.RequiredArgsConstructor;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ChatService {
    private final KafkaTemplate<String, ChatMessage> kafkaTemplate;

    public void sendMessage(String topic, ChatMessage message) {
        System.out.println(message.getMessage());
        kafkaTemplate.send(topic, message);
    }
}
