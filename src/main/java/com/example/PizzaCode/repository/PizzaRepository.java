package com.example.PizzaCode.repository;

import com.example.PizzaCode.models.ERole;
import com.example.PizzaCode.models.Pizza;
import com.example.PizzaCode.models.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PizzaRepository extends JpaRepository<Pizza, Long> {
    Optional<Pizza> findByName(String name);
}
