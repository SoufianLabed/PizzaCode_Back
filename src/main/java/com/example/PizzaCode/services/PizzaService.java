package com.example.PizzaCode.services;

import com.example.PizzaCode.models.Pizza;
import com.example.PizzaCode.repository.PizzaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PizzaService {
    @Autowired
    PizzaRepository pizzaRepository;

    public List<Pizza> getAllPizza(){
        return pizzaRepository.findAll();
    }

    public Pizza getPizzaByName(String name){
        return pizzaRepository.findByName(name).orElseThrow();
    }

}
