abstract class HomePageEvents {}

class HomePageDots extends HomePageEvents {
  final int index;

  HomePageDots(this.index);
}
// Thêm sự kiện cho việc chọn danh sách khóa học
class SelectCourseType extends HomePageEvents {
  final String courseType;

  SelectCourseType(this.courseType);
}