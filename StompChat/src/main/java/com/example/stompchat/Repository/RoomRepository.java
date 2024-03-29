package com.example.stompchat.Repository;

import com.example.stompchat.Dto.Room;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoomRepository extends JpaRepository<Room, Integer> {

    public List<Room> findAll();
    public Room save(Room room);
}
