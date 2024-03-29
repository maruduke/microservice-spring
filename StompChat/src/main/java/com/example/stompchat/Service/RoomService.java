package com.example.stompchat.Service;

import com.example.stompchat.Dto.Room;
import com.example.stompchat.Repository.RoomRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RoomService {
    private final RoomRepository roomRepository;

    public List<Room> getRoomsAll() {
        List<Room> rooms = roomRepository.findAll();
        return rooms;
    }

    public Room save(Room room) {
        return roomRepository.save(room);
    }

}
