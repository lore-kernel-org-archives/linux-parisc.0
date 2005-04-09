From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] pthread problems - test program
Date: Sat, 9 Apr 2005 02:37:50 -0400
Message-ID: <20050409063750.GQ1833@baldric.uwo.ca>
References: <20050408212918.GK1833@baldric.uwo.ca>
	<200504082254.j38MsKfA018596@hiauly1.hia.nrc.ca>
	<20050409055852.GM1833@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 Randolph Chung <tausq@debian.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050409055852.GM1833@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Apr 09, 2005 at 01:58:52AM -0400, Carlos O'Donell wrote:
> On Fri, Apr 08, 2005 at 06:54:20PM -0400, John David Anglin wrote:
> > > Since technically this is not possible, the mutex .lock in __fork_block
> > > makes sure that such a thing can't occur.
> > 
> > The program hangs doesn't it?
> 
> I just realized the program doesn't call pthread_atfork and it still
> hangs. Though it doesn't hang on i386. Is there a relied upon semantic
> we are missing here?

The following hangs and I don't really know why... maybe I'm just
sleepy :)

--- 
#include <stdio.h>
#include <signal.h>
#include <sys/types.h>

void exit_on_signal(int signr)
{
  fprintf(stderr, "Thread %d, exiting on signal %d.\n", getpid(), signr); 
  exit(0);
}

int main(void)
{
  pid_t parent = getpid();
  printf("Parent thread is %d\n",parent);
  signal(SIGUSR2,exit_on_signal);
  if (fork() == 0) 
    {
      /* child kills parent */
      printf("Child thread is %d\n",getpid());
      kill(parent, SIGUSR2);
    } 
  else 
    {
      printf("Parent done.\n");
    }
  exit(0);
}
---

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
