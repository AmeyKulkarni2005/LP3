// SPDX-License-Identifier: MIT
pragma solidity 0.8.38;

contract StudentOperations{

    struct Student{
        uint256 RollNo;
        string Name;
        string Class;
        uint256 Marks;
    }

    Student[] students;

    function add_student(uint256 _rollno, string memory _name, string memory _class, uint256 _marks) public{
        Student memory s = Student(_rollno, _name, _class, _marks);
        students.push(s);
    }

    function get_student(uint256 index) public view returns (uint256, string memory, string memory, uint256){
        Student memory s = students[index];
        return (s.RollNo, s.Name, s.Class, s.Marks);
    }

    function get_student_count() public view returns (uint256){
        return students.length;
    }
}
