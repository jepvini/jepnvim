#include <stdio.h>

int
leap_year(int year)
{
  if (year % 4 == 0 && year % 400 != 0)
    return 1;
  return 0;
}

int
monthtifier(int days, char *month, unsigned leap)
{
  if (days <= 31) {
    month[0] = 'j';
    month[1] = 'a';
    month[2] = 'n';
    month[3] = '\0';

    return days;
  }
  days -= 31;
  if (leap) {
    if (days <= 29) {
      month[0] = 'f';
      month[1] = 'e';
      month[2] = 'b';
      month[3] = '\0';

      return days;
    }
  } else {
    if (days <= 28) {
      month[0] = 'f';
      month[1] = 'e';
      month[2] = 'b';
      month[3] = '\0';

      return days;
    }
  }
  days -= 28;
  if (leap)
    days--;
  if (days <= 31) {
    month[0] = 'm';
    month[1] = 'a';
    month[2] = 'r';
    month[3] = '\0';

    return days;
  }
  days -= 31;
  if (days <= 30) {
    month[0] = 'a';
    month[1] = 'p';
    month[2] = 'r';
    month[3] = '\0';

    return days;
  }
  days -= 30;
  if (days <= 31) {
    month[0] = 'm';
    month[1] = 'a';
    month[2] = 'y';
    month[3] = '\0';

    return days;
  }
  days -= 31;
  if (days <= 30) {
    month[0] = 'j';
    month[1] = 'u';
    month[2] = 'n';
    month[3] = '\0';

    return days;
  }
  days -= 30;
  if (days <= 31) {
    month[0] = 'j';
    month[1] = 'u';
    month[2] = 'l';
    month[3] = '\0';

    return days;
  }
  days -= 31;
  if (days <= 31) {
    month[0] = 'a';
    month[1] = 'u';
    month[2] = 'g';
    month[3] = '\0';

    return days;
  }
  days -= 31;
  if (days <= 30) {
    month[0] = 's';
    month[1] = 'e';
    month[2] = 'p';
    month[3] = '\0';

    return days;
  }
  days -= 30;
  if (days <= 31) {
    month[0] = 'o';
    month[1] = 'c';
    month[2] = 't';
    month[3] = '\0';

    return days;
  }
  days -= 31;
  if (days <= 30) {
    month[0] = 'n';
    month[1] = 'o';
    month[2] = 'v';
    month[3] = '\0';

    return days;
  }
  days -= 30;

  month[0] = 'd';
  month[1] = 'i';
  month[2] = 'c';
  month[3] = '\0';

  return days;
}

int
main()
{
  unsigned years, days, hours, minutes;
  unsigned year = 1970;
  // unsigned seconds = 0x7FFFFFFE;
  unsigned seconds = 1725810693;
  unsigned leap    = 0;

  char month[4];

  days = seconds / (60 * 60 * 24);

  years = 0;
  for (;;) {
    if (leap_year(year)) {
      if (days >= 366) {
        year++;
        years++;
        days -= 366;
      } else {
        break;
      }
    } else {
      if (days >= 365) {
        year++;
        years++;
        days -= 365;
      } else {
        break;
      }
    }
  }
  year -= years;

  days++;
  leap = leap_year(year + years);
  days = monthtifier(days, month, leap);

  hours   = (seconds / 3600) % 24;
  minutes = (seconds / 60) % 60;
  seconds = seconds % 60;

  printf(
      "%u %s %u, at %02u:%02u:%02u\n", days, month, year + years, hours,
      minutes, seconds
  );
}
