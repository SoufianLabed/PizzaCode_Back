package com.example.PizzaCode.controllers;


import com.example.PizzaCode.payload.request.LoginRequest;
import com.example.PizzaCode.services.PizzaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/default/")
public class DefaultController {

    @Autowired
    PizzaService pizzaService;

    @GetMapping("/pizza")
    public ResponseEntity<?> getAllPizza() {
        return ResponseEntity.ok(pizzaService.getAllPizza());
    }

    @GetMapping("/pizza/{name}")
    public ResponseEntity<?> getPizzaByName(@PathVariable String name) {
        return ResponseEntity.ok(pizzaService.getPizzaByName(name));
    }
}
