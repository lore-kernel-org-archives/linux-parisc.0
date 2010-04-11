From: Helge Deller <deller@gmx.de>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Sun, 11 Apr 2010 20:50:31 +0200
Message-ID: <4BC219F7.5020204@gmx.de>
References: <20100408215453.GA18445@hiauly1.hia.nrc.ca> <20100408224446.96F294FA3@hiauly1.hia.nrc.ca> <x2p119aab441004090714v107c8fc1s9ca94066871a3e8b@mail.gmail.com> <20100409151330.GA23889@hiauly1.hia.nrc.ca> <4BC0E3AD.4050802@gmx.de> <20100410225355.GA2812@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000500000600050604070103"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Carlos O'Donell <carlos@systemhalted.org>, gniibe@fsij.org,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100410225355.GA2812@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------000500000600050604070103
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04/11/2010 12:53 AM, John David Anglin wrote:
> On Sat, 10 Apr 2010, Helge Deller wrote:
> 
>> Nevertheless, on my B2000 (32bit, SMP, 2.6.32.2 kernel) I still do see the minifail bug.
>> The only difference seems to be, that the minifail3 program doesn't get stuck any
>> more. It still crashes though from time to time...
> 
> There are some issues with your minifail3.c testcase.  The fork'd child
> shouldn't do any I/O and it should exit using _exit(0).  Otherwise, it
> can corrupt the I/O structures of the parent.  I'm not sure that this
> is the issue on your B2000, but it's worth a try.
> 
> The testcase when modified as above doesn't crash on my c3750 (32bit, UP,
> 2.6.32.2 kernel).
> 
> I found in debugging this testcase that the crash was always associated
> with the stack region for thread_run.  I put a big loop in thread_run.
> The index for the loop when compiled at -O0 is constantly being saved
> and restored on the stack.  I found that crashes occured after many
> iterations of the loop.  Nothing else was going on.
> 
> The COW discussion convinced me that cache flushing was the problem.
> The fork (clone) syscall causes the stack region used by thread_run
> to become COW'd.  When thread_run is scheduled, the loop caused an
> instant COW break and stack corruption.  The state of the stack region
> generally returned to its state before the fork.
> 
> If the above doesn't fix the testcase on your B2000, there must be
> some difference and other PA8000 machines.

Hi Dave,

I did tested the attached testcase. I think this is the version you sent last
time, and which has the _exit(0).

Nevertheless, I still see the crashes with all kernel patches applied.

What I usually do is to start up more than 8 screen sessions. In each of the
sessions I start the bash loop:
-> i=0; while true; do i=$(($i+1)); echo Run $i; ./minifail; done;
and detach from the screen sessions.
After some time, the load goes up to 8-16 and a few crashes fill the syslog.
I'm sure the crashes are related to how much load the machine is, and how
often process switches will happen.
How many minifail testcases do you run in parallel?


ls3017:/scratch/linux-git# uname -a

Linux ls3017 2.6.33.2-32bit #31 SMP Fri Apr 9 12:36:49 CEST 2010 parisc GNU/Linux

ls3017:/scratch/linux-git# cat /proc/cpuinfo 

cpu family      : PA-RISC 2.0

cpu             : PA8500 (PCX-W)

cpu MHz         : 440.000000

model           : 9000/785/J5000

model name      : Forte W 2-way

I-cache         : 512 KB

D-cache         : 1024 KB (WB, direct mapped)

ITLB entries    : 160

DTLB entries    : 160 - shared with ITLB


Helge

--------------000500000600050604070103
Content-Type: text/plain;
 name="minifail_dave.cpp"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="minifail_dave.cpp"

#include <pthread.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

/*
  http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=561203

  clone(child_stack=0x4088d040, flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID, parent_tidptr=0x4108c4e8, tls=0x4108c900, child_tidptr=0x4108c4e8) = 14819
[pid 14819] set_robust_list(0x4108c4f0, 0xc) = 0
[pid 14818] clone(child_stack=0, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x40002028) = 14820

 g++  minifail.cpp -o minifail -O0 -pthread -g

 i=0; while true; do i=$(($i+1)); echo Run $i; ./minifail; done;

 */
void* thread_run(void* arg) {
	write(1,"Thread OK.\n",11);
}

int pure_test() {
	pthread_t thread;
	pthread_create(&thread, NULL, thread_run, NULL);

	switch (fork()) {
		case -1:
			perror("fork() failed");
		case 0:
			write(1,"Child OK.\n",10);
			_exit(0);
		default:
			break;
		
	}
	
	pthread_join(thread, NULL);
	return 0;
}

int main(int argc, char** argv) {
	return pure_test();
}


--------------000500000600050604070103--
