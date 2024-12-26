class HomePageStates {
  final int index;
  final String selectedCourseType; // Lưu trữ loại khóa học đã chọn

  const HomePageStates({this.index = 0,this.selectedCourseType = "All"});

  HomePageStates copyWith({int? index, String? selectedCourseType}) {
    return HomePageStates(index: index ?? this.index, selectedCourseType: selectedCourseType ?? this.selectedCourseType);
  }
}
