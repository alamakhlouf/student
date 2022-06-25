package com.example.student.Student;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.LocalDate;
import java.util.List;

@Configuration
public class StudentConfig {
    @Bean
    CommandLineRunner commandLineRunner(StudentRepositry studentRepositry) {
        return args -> {
         Student ala =   new Student("Test1",
                    LocalDate.of(2000, 1,1),"Test1@gmail");
            Student fares =   new Student("Test2",
                    LocalDate.of(1997, 1,1),"Test2@gmail");

            studentRepositry.saveAll(List.of(ala,fares));
        };
    }
}
