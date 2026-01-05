package com.example.ai_chatbot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class AiChatbotApplication {
    public static void main(String[] args) {
        SpringApplication.run(AiChatbotApplication.class, args);
    }
}
