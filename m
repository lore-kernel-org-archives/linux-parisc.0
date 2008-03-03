From: Stuart Brady <sdbrady@ntlworld.com>
Subject: Segfault when using SDL with POSIX timers
Date: Mon, 3 Mar 2008 04:47:27 +0000
Message-ID: <20080303044727.GA22047@miranda.arrow>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

The test program below segfaults on parisc, but not on x86-64.  It's
based on code from QEMU, which was crashing on exit.  Can anyone see
what the cause is?  Here's the backtrace:

Program received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x4000 (LWP 8682)]
0x00000000 in ?? ()
(gdb) bt
#0  0x00000000 in ?? ()
#1  0x403c7aac in ?? () from /lib/ld.so.1
#2  0x403c7c08 in ?? () from /lib/ld.so.1
#3  0x400490dc in ?? () from /lib/libdl.so.2
#4  0x403c1834 in ?? () from /lib/ld.so.1
#5  0x40049590 in ?? () from /lib/libdl.so.2
#6  0x40049118 in dlclose () from /lib/libdl.so.2
#7  0x403297f4 in ?? () from /usr/lib/libSDL-1.2.so.0
#8  0x4031fff8 in SDL_VideoQuit () from /usr/lib/libSDL-1.2.so.0
#9  0x402f2c78 in SDL_QuitSubSystem () from /usr/lib/libSDL-1.2.so.0
#10 0x402f2d20 in SDL_Quit () from /usr/lib/libSDL-1.2.so.0
#11 0x000109d8 in main ()

The output is simply:

Starting timer
Starting SDL
Quitting SDL
Segmentation fault (core dumped)

I'm running Debian Etch, with libc6 2.7-6, linux-image-2.6.22-3-parisc64
libsdl1.2debian-alsa 1.2.13-2.  I've tried gcc-3.4.6-6 and gcc-4.2.3-1.
I built it with "gcc -Wall -I/usr/include/SDL -lSDL -lrt
sdl-timer-test.c -o sdl-timer-test".

Here's the code:

#include <stdio.h>
#include <signal.h>
#include <time.h>
#include <SDL.h>

void display_init(void)
{
    if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_NOPARACHUTE)) {
        fprintf(stderr, "SDL init failed\n");
        exit(1);
    }
    /* NOTE: we still want Ctrl-C to work, so we undo the SDL redirections */
    signal(SIGINT, SIG_DFL);
    signal(SIGQUIT, SIG_DFL);
}

static void host_alarm_handler(int host_signum)
{
    fprintf(stderr, "alarm\n");
}

static void start_timer(void)
{
    struct sigevent ev;
    timer_t host_timer;
    struct sigaction act;

    sigfillset(&act.sa_mask);
    act.sa_flags = 0;
    act.sa_handler = host_alarm_handler;

    sigaction(SIGALRM, &act, NULL);

    ev.sigev_value.sival_int = 0;
    ev.sigev_notify = SIGEV_SIGNAL;
    ev.sigev_signo = SIGALRM;

    if (timer_create(CLOCK_REALTIME, &ev, &host_timer)) {
        perror("timer_create");
        fprintf(stderr, "timer init failed\n");
        exit(1);
    }
}

int main(int argc, char **argv)
{
    fprintf(stderr, "Starting timer\n");
    start_timer();
    fprintf(stderr, "Starting SDL\n");
    display_init();
    fprintf(stderr, "Quitting SDL\n");
    SDL_Quit();
    fprintf(stderr, "Exitting\n");
    exit(0);
}

If I remove SDL_INIT_NOPARACHUTE, I get the following:

Starting timer
Starting SDL
Quitting SDL
*** glibc detected *** ./sdl-timer-test: double free or corruption (top): 0x00031d18 ***
Aborted (core dumped)

On x86-64, with or without SDL_INIT_NOPARACHUTE, it exits successfully:

Starting timer
Starting SDL
Quitting SDL
Exiting
-- 
Stuart Brady
