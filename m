From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Mon, 4 Jan 2010 13:22:45 -0500
Message-ID: <20100104182244.GB2252@hiauly1.hia.nrc.ca>
References: <20100104162732.10090@gmx.net> <20100104173239.6C0AF5183@hiauly1.hia.nrc.ca> <119aab441001041002r4757d4f9re9f8c54e0049090b@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	dave.anglin@nrc-cnrc.gc.ca
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab441001041002r4757d4f9re9f8c54e0049090b@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 04 Jan 2010, Carlos O'Donell wrote:

> On Mon, Jan 4, 2010 at 12:32 PM, John David Anglin
> <dave@hiauly1.hia.nrc.ca> wrote:
> >> e) Thus the child either crashes, overwrites memory of the parent or does other things wrong.
> >
> > I don't see how the forked child can affect the memory of the parent.
> > It can close files and affect the parent that way (child should use
> > _exit and not exit).
> >
> > If the forked child actually overwrites memory of the parent, this is
> > a big bug in the linux fork code.
> 
> We have two bugs that are getting mixed here.
> 
> Your original post has to do with a futex wait failure, this is
> possibly related to the hppa low level lock implementation. I am
> updating the hppa implementation to see if I can fix this for you.
> 
> Helge's comments relate only to the vfork crash, and the Qt thread
> creation issue being seen by debian.

I was talking about the debian thread creation bug in the above.
I haven't been able to duplicate the vfork crash that you posted.
The expect/tcl futex bug is likely related to the debian bug (this
is what expect does in testsuite runs).  Reduced minifail testcase
is below.

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
