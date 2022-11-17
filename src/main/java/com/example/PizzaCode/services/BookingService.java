package com.example.PizzaCode.services;

import com.example.PizzaCode.models.Booking;
import com.example.PizzaCode.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookingService {
    @Autowired
    BookingRepository bookingRepository;

    public Booking postBooking(Booking booking){
        return bookingRepository.save(booking);
    }


}
