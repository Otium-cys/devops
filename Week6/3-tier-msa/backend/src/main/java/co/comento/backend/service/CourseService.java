package co.comento.backend.service;

import co.comento.backend.dao.CourseRepository;
import co.comento.backend.exception.CourseNotFoundException;
import co.comento.backend.model.Course;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CourseService {

    private final CourseRepository repository;

    public Course saveCourse(final Course course) {
        return repository.save(course);
    }

    public Course updateCourse(final Course course) {
        return repository.save(course);
    }

    public List<Course> findAllCourses() {
        return repository.findAll();
    }

    public Course findCourseById(final int courseId) {
        return repository.findById(courseId).
                orElseThrow(() -> new CourseNotFoundException("Course by id " + courseId + " was not found"));
    }

    public void deleteCourse(final int courseId) {
        repository.deleteById(courseId);
    }

}
