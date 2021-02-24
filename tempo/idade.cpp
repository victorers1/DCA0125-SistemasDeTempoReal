#include <iostream> // para: cout
#include <time.h>   // para: gmtime()

using namespace std;

int main()
{
    // Inputs
    int day, month, year;

    // Gets system's date and time in seconds
    time_t now_in_seconds;
    (void)time(&now_in_seconds);

    // Pre-process birth_datetime to get timezone
    struct tm *birth_datetime;
    birth_datetime = localtime(&now_in_seconds);

    cout << "Insert your birth date:\n";
    cin >> day >> month >> year;

    birth_datetime->tm_mday = day;
    birth_datetime->tm_mon = month - 1;
    birth_datetime->tm_year = year - 1900;
    birth_datetime->tm_hour = -3; // localtime is 3 hours forward
    birth_datetime->tm_min = 0;
    birth_datetime->tm_sec = 0;

    time_t birth_in_seconds = mktime(birth_datetime);
    cout << "Seconds from epoch to birth: " << birth_in_seconds << endl;

    time_t time_lived_in_seconds = now_in_seconds - birth_in_seconds;
    cout << "Time lived in seconds: " << time_lived_in_seconds << endl;

    return 0;
}