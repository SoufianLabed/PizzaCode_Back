package com.example.PizzaCode.services;
import com.example.PizzaCode.models.Contact;
import com.example.PizzaCode.repository.ContactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ContactService {
    @Autowired
    ContactRepository contactRepository;

    public Contact postContact(Contact contact){
        return contactRepository.save(contact);
    }


}
