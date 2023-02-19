package co.comento.backend.dao;

import co.comento.backend.model.Course;
import java.util.List;
import org.springframework.data.repository.CrudRepository;

public interface CourseRepository extends CrudRepository<Course, Integer> {

    @Override
    List<Course> findAll();

}
