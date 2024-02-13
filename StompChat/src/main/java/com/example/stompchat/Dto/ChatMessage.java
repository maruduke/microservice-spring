package com.example.stompchat.Dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@NoArgsConstructor
public class ChatMessage {
    private int roomId;
    private String senderName;
    private String message;
}
