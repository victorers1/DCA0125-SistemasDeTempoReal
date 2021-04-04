#include <iostream>
#include <fstream>
#include <sstream>

#include <stdio.h>
#include <cstring>
#include <cstdlib>

#include <csignal>
#include <cmath>

#include <ncurses.h>
#include <unistd.h>
#include <sched.h>
#include <termio.h>
#include <sys/types.h>
#include <sys/time.h>
#include <sys/resource.h>

using namespace std;

int option = 0;
string view_processes_command = "ps -aeo user,comm,pid,psr,pcpu,pri,ni,cputime | head -30";

int promptInt(string name)
{
    int integer;
    cout << name << ": ";
    cin >> integer;
    return integer;
}

void killTask()
{
    cout << "KILL PROCESS\n";
    int pid = promptInt("PID");
    printf("Process %d was ", pid);
    cout << (kill(pid, SIGKILL) ? "NOT killed due to an error" : "successfully killed");

    cout << endl;
}

void pauseTask()
{
    cout << "PAUSE PROCESS\n";
    int pid = promptInt("PID");
    printf("Process %d was ", pid);
    cout << (kill(pid, SIGSTOP) ? "NOT stopped due to an error" : "successfully stopped");
    cout << endl;
}

void continueTask()
{
    cout << "CONTINUE PROCESS\n";
    int pid = promptInt("PID");
    printf("Process %d was ", pid);
    cout << (kill(pid, SIGCONT) ? "NOT continued due to an error" : "successfully continued");
    cout << endl;
}

void setTaskPriority()
{
    cout << "SET PROCESS PRIORITY\n";
    int pid = promptInt("PID"), priority = promptInt("Priority");
    printf("Process %d is ", pid);
}

void setTaskCore()
{
    cout << "SET PROCESS CPU\n";
    int pid = promptInt("PID"), core = promptInt("New core");

    cpu_set_t mask;
    CPU_ZERO(&mask);
    CPU_SET(core, &mask);

    printf("Process %d is ", pid);
    cout << sched_setaffinity(pid, sizeof(mask), &mask) ? "NOT" : "";
    printf(" running on core %d", core);
    // if (sched_setaffinity(pid, sizeof(mask), &mask) == 0)
    // {
    //     printf("now running on core %d", core);
    //     sleep(2);
    //     system("clear");
    // }
    // else
    // {
    //     printf("NOT running on core %d due to an error", core);
    // }
}

void filterTask()
{
    cout << "FILTER PROCESS\n";
    int pid = promptInt("PID");
}

void taskTree()
{
}

int main(int argc, char const *argv[])
{
    do
    {
        system("clear");
        system(view_processes_command.c_str());

        cout << "\n\nMENU";
        cout << "\n1 - Kill";
        cout << "\n2 - Pause";
        cout << "\n3 - Continue";
        cout << "\n4 - Set priority";
        cout << "\n5 - Set core";
        cout << "\n6 - Task Tree";
        cout << "\n7 - Filter";
        cout << "\n8 - Close\n\n";

        switch (option)
        {
        case 1:
            killTask();
            break;

        case 2:
            pauseTask();
            break;

        case 3:
            continueTask();
            break;

        case 4:
            setTaskPriority();
            break;

        case 5:
            setTaskCore();
            break;

        case 6:
            filterTask();
            break;

        case 7:
            taskTree();
            break;

        case 0:
        default:
            break;
        }

        cout << "\n\nChoose command to run: ";
    } while (cin >> option && option != 8);

    cout << "Program finnished\n";

    return 0;
}
