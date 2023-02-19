import { Component, OnInit } from '@angular/core';
import { CourseService } from '../course.service';
import { Course } from '../model/course';

@Component({
  selector: 'app-addcourse',
  templateUrl: './addcourse.component.html',
  styleUrls: ['./addcourse.component.scss'],
})
export class AddcourseComponent implements OnInit {
  course: any = new Course(0, '', '');
  courses: any;

  constructor(private service: CourseService) {}

  ngOnInit(): void {
    let response = this.service.getCourses();
    response.subscribe((data) => (this.courses = data));
  }

  public registerCourse() {
    let response = this.service.postCourse(this.course);
    response.subscribe((data) => (this.courses = data));
  }

  public updateCourseNow() {
    let response = this.service.updateCourse(this.course);
    response.subscribe((data) => (this.courses = data));
  }

  public searchById(courseId: number) {
    let response = this.service.getCourseById(courseId);
    response.subscribe((data) => (this.courses = data));
  }

  public deleteCourse(courseId: number) {
    let response = this.service.deleteCourse(courseId);
    response.subscribe((data) => (this.courses = data));
  }
}
