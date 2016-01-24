#!/bin/sh

./CodeCoverage.exe -e tst\\Win32\\Debug\\AvocadoTimetableEndToEndTests.exe -m tst\\Win32\\Debug\\AvocadoTimetableEndToEndTests.map -od coverage_reports -html \
  -uf coverage_files.lst \
  -sp \
    'd:\Develop\Delphi\Avocado-ReportTimetable\src' \
    'd:\Develop\Delphi\Avocado-ReportTimetable\src\db' \
    'd:\Develop\Delphi\Avocado-ReportTimetable\src\gui' \
    'd:\Develop\Delphi\Avocado-ReportTimetable\src\model'
