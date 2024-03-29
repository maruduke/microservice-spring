package com.example.stompchat.Config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class StompConfig implements WebSocketMessageBrokerConfigurer {

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        /*
        * 소켓 연결 메서드
        *
        * addEndpoint: 소켓 연결 uri -> 서버와 연결하고 싶다면 ws/chat으로 전송
        * setAllowedOrigins: CORS 설정
        * withSockJS: 소켓을 지원하지 않는 브라우저일 경우 sockjs 사용
        *
        * */
        registry.addEndpoint("ws/chat").setAllowedOrigins("*");
    }

    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        /* Stomp 사용을 위한 Message Broker 설정 메소드
        *
        * enableSimpleBroker: memory messageBroker 활성화
        * 의문점: kafka를 사용하는데 왜 메모리 메시지 브로커를 사용하는가?
        * 테스트 및 간단한 개발에 간편하나 트래픽이 많을 경우 서버 리소스에 문제가 발생할 수 있음
        * “/topic”이 prefix로 붙은 경우, messageBroker가 해당 경로를 가로챈다
        * "/topic/{topic name}"으로 구독 가능
        * 
        * enableStompBrokerRelay: 외부 messageBroker와 연결
        * 클라이언트는 메시지를 메모리 메시지 브로커 대신에 외부 브로커를 통해 전송하고 수신합니다.
        * kafka Producer와 kafka Consumer를 자동으로 생성하여 처리한다.
        * - setRelayHost: messagebroker 호스트
        * - setRelayPort: messagebroker 포트 번호
        * - setClientLogin: 메시지 브로커 사용자 명
        * - setClientPassword: 패스워드
        *
        *
        *
        * setApplicationDestinationPrefixes: 메세지를 보낼 때, 경로를 설정해주는 함수
        * ex) /topic/hello -> /api/topic/hello
        *
        * 
        * */
//        registry.enableSimpleBroker("/topic");

        registry.enableSimpleBroker("/topic");
        registry.setApplicationDestinationPrefixes("/api");
        
    }

}
