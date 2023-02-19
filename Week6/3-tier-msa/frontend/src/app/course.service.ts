import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Course } from './model/course';

@Injectable({
  providedIn: 'root',
})
export class CourseService {
  constructor(private http: HttpClient) {}

  public postCourse(course: Course) {
    return this.http.post('http://<Backend Ingress Address>/postcourse', course, {
      responseType: 'text' as 'json',
    });
  }

  public updateCourse(course: Course) {
    return this.http.put('http://<Backend Ingress Address>/updatecourse', course, {
      responseType: 'text' as 'json',
    });
  }

  public getCourses() {
    return this.http.get('http://<Backend Ingress Address>/getallcourses');
  }

  public getCourseById(courseId: number) {
    return this.http.get(
      'http://<Backend Ingress Address>/getcoursebyid?courseId=' + courseId
    );
  }

  public deleteCourse(courseId: number) {
    return this.http.delete(
      'http://<Backend Ingress Address>/deletecourse?courseId=' + courseId
    );
  }
}
