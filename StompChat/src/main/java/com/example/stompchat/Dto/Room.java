package com.example.stompchat.Dto;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
public class Room {
    @Id @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int roomId;
    private String roomName;

    public Room(String roomName) {
        this.roomName = roomName;
    }
}
