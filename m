From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Thu, 11 Mar 2010 18:32:59 -0500
Message-ID: <20100311233258.GA19140@hiauly1.hia.nrc.ca>
References: <20100307171207.GA22856@hiauly1.hia.nrc.ca> <20100307203230.CAC964E77@hiauly1.hia.nrc.ca> <20100311032049.GA14312@hiauly1.hia.nrc.ca> <20100311135418.GA22698@bombadil.infradead.org> <20100311224044.GA18789@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="YiEDa0DAkWCtVeE4"
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>, deller@gmx.de,
	carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100311224044.GA18789@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, 11 Mar 2010, John David Anglin wrote:

> I am 95% certain that the bug has to do with the clone implementation
> and scheduling.  I have attached another version of the minifail test.
> The loops after the fork and pthread_create calls are to isolate these
> syscalls.  Typically, I see something like:

Attached.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="minifail9.cpp"

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

static volatile int run = 1;

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
	int i;
	pthread_t thread;
	pthread_create(&thread, NULL, thread_run, NULL);

	while (!run)
	  pthread_yield();
	switch (fork()) {
		case -1:
			perror("fork() failed");
		case 0:
			write(1,"Child OK.\n",10);
			_exit(0);
		default:
			break;
		
	}
	pthread_yield();
	for (i = 20000000; i; i--)
	  continue;
	write(1,"Fork done\n",10);
	pthread_join(thread, NULL);
	return 0;
}

int main(int argc, char** argv) {
	return pure_test();
}

--YiEDa0DAkWCtVeE4--
