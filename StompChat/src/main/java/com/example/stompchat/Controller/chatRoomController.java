package com.example.stompchat.Controller;

import com.example.stompchat.Dto.ChatMessage;
import com.example.stompchat.Service.ChatService;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequiredArgsConstructor
public class chatRoomController {

    private final ChatService chatService;

    @MessageMapping("/chat/message")
    public void sendMessage(ChatMessage chatMessage) {
        /*
        * client가 SEND를 할 수 있는 경로
        * WebSocketConfig에서 등록한 applicationDestinationPrfixes와 @MessageMapping의 경로가 합쳐진다
        * > /api/chat/message로 전송된 메시지는 해당 메소드 처리
        * */
        System.out.println("client send:" + chatMessage.getMessage());
        chatService.sendMessage("chat", chatMessage);
    }

    @MessageMapping("test")
    public void test(String test) {
        System.out.println(test);
    }
}
