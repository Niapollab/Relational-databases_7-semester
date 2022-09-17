ACCEPT promt_student_surname char prompt 'Введите фамилию студента: ';

DECLARE
  grades_sum NUMBER;

  FUNCTION sum_of_grades_by_subject(student_surname IN CHAR)
    RETURN NUMBER IS grades_sum NUMBER;
  BEGIN
    SELECT SUM(EXAMS.MARK)
    INTO grades_sum
    FROM EXAMS
    WHERE EXAMS.stud_id IN (
      SELECT STUDENT.STUD_ID
      FROM STUDENT
      WHERE STUDENT.SURNAME = student_surname
    );

    RETURN grades_sum;
  END;

BEGIN
  grades_sum := sum_of_grades_by_subject('&promt_student_surname');
  dbms_output.put_line('Сумма оценок по предметам: '||grades_sum);
END;
/