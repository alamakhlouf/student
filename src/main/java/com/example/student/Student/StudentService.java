package com.example.student.Student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class StudentService {

    private final StudentRepositry studentRepositry ;
    @Autowired
    public StudentService(StudentRepositry studentRepositry) {
        this.studentRepositry = studentRepositry;
    }

    public List<Student> getStudent()
    {
        return studentRepositry.findAll();
    }

    public void addNewStudent(Student student) {
    Optional<Student> studentOptional = studentRepositry.findStudentByEmail(student.getEmail()) ;
        if (studentOptional.isPresent())
            {
                throw new IllegalStateException("email taken") ;
            }
        studentRepositry.save(student) ;
    }

    public void deleteStudent(Long id)
    {
        Optional<Student> student = studentRepositry.findStudentById(id) ;
        if (student.isPresent())
        {
            studentRepositry.deleteById(id); ;
        }
        else {
            throw new IllegalStateException("student with id : "+id+"  doesn't exist") ;
        }
    }

    @Transactional
    public void updateStudent(Long studentId,String name,String email)
    {
        Student student1 = studentRepositry.findById(studentId).orElseThrow(() ->
                new IllegalStateException("student with id : \"+id+\"  doesn't exist")) ;
        if (name!=null && name.length()>0 && !name.equals(student1.getName()))
        {
            student1.setName(name);
        }
        if (email!=null && email.length()>0 && !email.equals(student1.getEmail()))
        {
            Optional<Student> studentOptional = studentRepositry.findStudentByEmail(email) ;
            if (studentOptional.isPresent())
            {
                throw new IllegalStateException("email taken") ;
            }
            student1.setEmail(email);
        }

        }

}
