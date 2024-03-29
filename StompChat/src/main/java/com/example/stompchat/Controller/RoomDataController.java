package com.example.stompchat.Controller;

import com.example.stompchat.Dto.Room;
import com.example.stompchat.Service.RoomService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/room")
@CrossOrigin(origins = "*")
public class RoomDataController {

    private final RoomService roomService;

    @PostMapping()
    public Room createRoom(@RequestBody String roomName) {
        Room save = roomService.save(new Room(roomName));
        return save;
    }

    @GetMapping()
    public List<Room> getRoom() {
        return roomService.getRoomsAll();
    }

}
