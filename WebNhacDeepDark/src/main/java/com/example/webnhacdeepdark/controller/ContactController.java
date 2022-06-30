package com.example.webnhacdeepdark.controller;

import com.example.webnhacdeepdark.entity.Contact;
import com.example.webnhacdeepdark.entity.Users;
import com.example.webnhacdeepdark.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;


@RestController
public class ContactController {
    @Autowired
    ContactService contactService;

    @RequestMapping(path = "/contact", method = RequestMethod.GET)
    public ModelAndView contact() {
        ModelAndView mav = new ModelAndView("contact");
        return mav;
    }

    @RequestMapping(path = "/send", method = RequestMethod.POST)
    public ModelAndView send(@RequestParam(name = "message") String message, HttpSession session) {
        Users user =(Users) session.getAttribute("user");
        Contact contact = new Contact(message, new Date(), user);
        contactService.save(contact);
        ModelAndView mav = new ModelAndView("contact");
        mav.addObject("message", true);
        return mav;
    }
}
