Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (unknown [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id C843A4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 May 2003 10:27:43 -0600 (MDT)
Date: Mon, 19 May 2003 18:27:41 +0200
Message-ID: <3EC761CD0000080F@ocpmta2.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
Cc: debian-hppa@lists.debian.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] glibc pthreads actual threads?
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi all,

Sorry in advance if it is not the right place to put this question.

But I just start to learn more details about OS (A. Tanenbaum book) and
by the way try to understand a bit more about [p]threads.

I found a paper with examples (what I need much of all) and so I try by
the first one: basic_example.c (which I just change a very little for my
understanding)

/* for pthreads */
#include <pthread.h>
#include <stdio.h>

/* for getpid() */
#include <sys/types.h>
#include <unistd.h>

char * buf = "abcdefghijklmnopqrstuvwxyz";
int num_pthreads = 4;
int count = 60;
int fd = 1;

void * new_thread(void * arg)
{
    int i;
    pid_t PID=getpid();


    for (i = 0; i < count; i++) {
        fprintf(stderr, "PID: %d\n", PID);
	write(fd, arg, 1); write(fd, "\n", 1);
	sleep(1);
    }
    return(NULL);
}

main()
{
   pthread_t thread;
   int i;

   for (i = 0; i < num_pthreads; i++) {
	if (pthread_create(&thread, NULL, new_thread, (void *)(buf + i))) {
	   fprintf(stderr, "error creating a new thread \n");
	   exit(1);
	}
	pthread_detach(thread);
   }
   pthread_exit(NULL);
}

Which I compile as follow (gcc-3.3):
gcc -l pthread -o basic_example basic_example.c

That runs well (on my b2k running a 2.4.20-pa35 and libc6 2.3.1-17):
[...]
PID: 31360
a
PID: 31361
b
PID: 31362
c
PID: 31363
d
PID: 31360
a
PID: 31361
b
PID: 31362
c
PID: 31363
d
[...]

But notice  a very strange behaviour:
_the pid is not the same for each thread_ ??

Having just a small sunos 5.8 with gcc-3.2.2 (but with native libpthread)
the pb does not occurs?

Is it a limit of glibc (in general or in 2.3 only?) for all linux or only
hppa?

Thanks in advance for your attention,
    Joel



---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
