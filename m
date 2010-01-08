From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Fri, 8 Jan 2010 16:17:32 -0500 (EST)
Message-ID: <20100108211733.852134EF4@hiauly1.hia.nrc.ca>
References: <20100108163756.48BDE5183@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, dave.anglin@nrc-cnrc.gc.ca, carlos@systemhalted.org,
	linux-parisc@vger.kernel.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100108163756.48BDE5183@hiauly1.hia.nrc.ca> from "John David Anglin" at Jan 8, 2010 11:37:55 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I added some loops in the parent and child threads.  I also added code
> in the child thread to watch the return point location on the stack
> for start_thread.  What I found is the stack gets overwritten after
> the thread has started.  At the same time, the parent is looping
> post fork.

More debugging.  It seems bad news to have more than one clone
syscall active at a time.  The thread child may still be in the kernel
when the fork syscall is made by the parent.  The testcase doesn't
fail if the parent waits for the child thread to start.  See below.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

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

static volatile int run;

void* thread_run(void* arg) {
	static long status;
	int i;
        
	run = 1;
	pthread_yield();
	for (i = 10000000; i; i--)
	   continue;
	write(1,"Thread OK.\n",11);
	return (void *)&status;
}

int pure_test() {
	pthread_t thread;
	pthread_create(&thread, NULL, thread_run, NULL);

	while (!run)
	  continue;
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
