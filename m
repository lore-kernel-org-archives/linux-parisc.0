From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Mon, 1 Feb 2010 10:47:10 -0500
Message-ID: <20100201154709.GA27256@hiauly1.hia.nrc.ca>
References: <4B65F2AD.3060408@gmx.de> <20100201002612.F0A754EA9@hiauly1.hia.nrc.ca> <119aab441002010458g25373efex418886aca95ff4bd@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="9jxsPFA5p3P2qPhR"
Cc: Helge Deller <deller@gmx.de>, dave.anglin@nrc-cnrc.gc.ca,
	linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab441002010458g25373efex418886aca95ff4bd@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, 01 Feb 2010, Carlos O'Donell wrote:

> Do you have a copy of minifail I can run as a contained test case?

I've attached two versions -- the original and a simpler revised version.

The revised version shows that this is a clone/fork problem.  If the
parent waits for the child thread to set run before forking, the test
doesn't fail.  If the static definition of run is changed to 1, the
test fails.  I had added some loops at one time to show that this isn't
an exit issue. 

This is not to say that Helge isn't right about threads incorrectly using
exit.

The failure is always the stack of the child thread is overwritten with
zeros.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="minifail.cpp"

#include <QtCore/QCoreApplication>
#include <QtCore/QThread>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

class MyThread : public QThread
{
	void run();
};

void MyThread::run() {
	printf("Thread OK.\n");
}

int qt_test(int argc, char** argv) {
	QCoreApplication app(argc, argv);

	MyThread thread;
	thread.start();

	int p[2];
	char buf;
	pipe(p);

	switch (fork()) {
		case -1:
			perror("fork() failed");
		case 0:
			printf("Child OK.\n");
			write(p[1], "\0", 1);
			exit(0);
		default:
			break;
		
	}
	close(p[1]);
	read(p[0], &buf, 1);
	thread.wait();
	return 0;
}

void* thread_run(void* arg) {
	printf("Thread OK.\n");
}

int pure_test() {
	pthread_t thread;
	pthread_create(&thread, NULL, thread_run, NULL);

	int p[2];
	char buf;
	pipe(p);

	switch (fork()) {
		case -1:
			perror("fork() failed");
		case 0:
			close(p[0]);
			printf("Child OK.\n");
			write(p[1], "\0", 1);
			exit(0);
		default:
			break;
		
	}
	
	close(p[1]);
	read(p[0], &buf, 1);
	pthread_join(thread, NULL);
	return 0;
}

int main(int argc, char** argv) {
	if (argc == 2) {
		if (!strcmp("qt", argv[1])) {
			return qt_test(argc, argv);
		}
	}
	return pure_test();
}

--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="minifail6.cpp"

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

--9jxsPFA5p3P2qPhR--
