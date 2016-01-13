#!/bin/sh

./CodeCoverage.exe -e tst\\Win32\\Debug\\AvocadoTimetableEndToEndTests.exe -m tst\\Win32\\Debug\\AvocadoTimetableEndToEndTests.map -od coverage_reports -html \
  -uf coverage_files.lst \
  -sp \
    'c:\Develop\github\Avocado-ReportTimetable\src' \
    'c:\Develop\github\Avocado-ReportTimetable\src\db' \
    'c:\Develop\github\Avocado-ReportTimetable\src\gui' \
    'c:\Develop\github\Avocado-ReportTimetable\src\model'
