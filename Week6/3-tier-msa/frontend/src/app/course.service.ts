import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Course } from './model/course';

@Injectable({
  providedIn: 'root',
})
export class CourseService {
  constructor(private http: HttpClient) { }

  public postCourse(course: Course) {
    return this.http.post('http://k8s-3tiermsa-backend-bef3a9f236-230058558.ap-northeast-2.elb.amazonaws.com', course, {
      responseType: 'text' as 'json',
    });
  }

  public updateCourse(course: Course) {
    return this.http.put('http://k8s-3tiermsa-backend-bef3a9f236-230058558.ap-northeast-2.elb.amazonaws.com', course, {
      responseType: 'text' as 'json',
    });
  }

  public getCourses() {
    return this.http.get('http://k8s-3tiermsa-backend-bef3a9f236-230058558.ap-northeast-2.elb.amazonaws.com/getallcourses');
  }

  public getCourseById(courseId: number) {
    return this.http.get(
      'http://k8s-3tiermsa-backend-bef3a9f236-230058558.ap-northeast-2.elb.amazonaws.com/getcoursebyid?courseId=' + courseId
    );
  }

  public deleteCourse(courseId: number) {
    return this.http.delete(
      'http://k8s-3tiermsa-backend-bef3a9f236-230058558.ap-northeast-2.elb.amazonaws.com/deletecourse?courseId=' + courseId
    );
  }
}
