package com.example.PizzaCode.controllers;


import com.example.PizzaCode.models.Booking;
import com.example.PizzaCode.models.Contact;
import com.example.PizzaCode.payload.request.LoginRequest;
import com.example.PizzaCode.services.BookingService;
import com.example.PizzaCode.services.ContactService;
import com.example.PizzaCode.services.PizzaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@CrossOrigin(origins = "*", allowedHeaders = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/default/")
public class DefaultController {

    @Autowired
    PizzaService pizzaService;
    @Autowired
    BookingService bookingService;
    @Autowired
    ContactService contactService;
    @GetMapping("/pizza")
    public ResponseEntity<?> getAllPizza() {
        return ResponseEntity.ok(pizzaService.getAllPizza());
    }

    @GetMapping("/pizza/{name}")
    public ResponseEntity<?> getPizzaByName(@PathVariable String name) {
        return ResponseEntity.ok(pizzaService.getPizzaByName(name));
    }

    @PostMapping("/booking")
    public ResponseEntity<?> postBooking(@RequestBody Booking booking) {
        return ResponseEntity.ok(bookingService.postBooking(booking));
    }

    @PostMapping("/contact")
    public ResponseEntity<?> postContact(@RequestBody Contact contact) {
        return ResponseEntity.ok(contactService.postContact(contact));
    }
}
