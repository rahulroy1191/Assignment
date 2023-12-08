// interface defined
abstract class Role {
  // role is Student and teacher
  void displayRole();
}

class Person implements Role {
  // person class attributes
  String name;
  int age;
  String address;
  Role role;

  Person(this.name, this.age, this.address, this.role);

  // getter methods
  String get getName {
    return name;
  }

  int get getAge {
    return age;
  }

  String get getAddress {
    return address;
  }

  // Role interface methods
  @override
  void displayRole() {
    role.displayRole();
  }
}

class StudentRole implements Role {
  @override
  void displayRole() {
    print('Role: Student');
  }
}

class TeacherRole implements Role {
  @override
  void displayRole() {
    print('Role: Teacher');
  }
}

class Student extends Person {
  // student class attributes
  int studentId;
  int grade;
  List<int> courseScores = [];

  // this is Student constructor
  Student(String name, int age, String address, this.studentId, this.grade)
      : super(name, age, address, StudentRole());

  @override
  void displayRole() {
    print('Student Information: ');
    super.displayRole();
  }

  double calculateAverage() {
    int sum = courseScores.reduce((value, element) => value + element);
    double average = sum / courseScores.length;
    return average;
  }
}

class Teacher extends Person {
  int teacherId;
  List<String> coursesTaught = [];

  Teacher(
      String name, int age, String address, this.teacherId, this.coursesTaught)
      : super(name, age, address, TeacherRole());

  @override
  void displayRole() {
    print('Teacher Information: ');
    super.displayRole();
  }

  // method created for courses taught
  void displayCoursesTaught() {
    print('Courses Taught: $coursesTaught');
  }
}

// new class for studentManagementSystem
class StudentManagementSystem {
  static void main() {
    // instance of student and teacher class
    var student = Student('Rahul Roy', 19, '123 Main Street', 1234, 12);
    var teacher = Teacher(
        'Rafat J.M', 35, '456 Oak St', 14, ['Math', 'English', 'Bangla']);

    // attribute set
    student.courseScores = [90, 85, 82];

    // role of each person using displayRole method
    student.displayRole();
    print('Name: ${student.getName}');
    print('Age: ${student.getAge}');
    print('Address: ${student.getAddress}');
    print('Average: ${student.calculateAverage()}');
    print('\n');

    teacher.displayRole();
    print('Name: ${teacher.getName}');
    print('Age: ${teacher.getAge}');
    print('Address: ${teacher.getAddress}');
    teacher.displayCoursesTaught();
  }
}

void main() {
  StudentManagementSystem.main();
}
