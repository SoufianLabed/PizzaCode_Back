package com.example.PizzaCode.repository;

import com.example.PizzaCode.models.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Long> {
    Optional<Booking> findByDate(String name);
    Optional<Booking> findByLastname(String name);
}