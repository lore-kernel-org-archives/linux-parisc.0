Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA17411
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Jan 2001 14:38:13 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 22 Jan 2001 21:42:03 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id A37FAB005; Mon, 22 Jan 2001 21:32:19 +0000 (GMT)
Date: Mon, 22 Jan 2001 21:32:19 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: tar hangs on 715/75 (spinlock problem)
Message-ID: <20010122213219.Q3571@linuxcare.com>
References: <20010122165014.O3571@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010122165014.O3571@linuxcare.com>; from rhirst@linuxcare.com on Mon, Jan 22, 2001 at 04:50:14PM +0000
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jan 22, 2001 at 04:50:14PM +0000, Richard Hirst wrote:
> Hi,
>   tar (and nscd) hang on my 715/75.  Same binaries/libraries work on
> the B180.  The hang is in __pthread_acquire() called from

This is because ldcw behaves differently on the 715/75 and the B180.

Take this code (which is basically a bit of libpthread):


========================= ldcw.c =============================
#include <stdio.h>
#include <time.h>

#define MAX_SPIN_COUNT  32
#define SPIN_SLEEP_DURATION     2000000

extern inline long int
testandset (int *spinlock)
{
  int ret;

  __asm__ __volatile__(
       "ldcw 0(%2),%0"
       : "=r"(ret), "=m"(*spinlock)
       : "r"(spinlock));

  return ret == 0;
}


static void __pthread_acquire(int * spinlock)
{
  int cnt = 0;
  struct timespec tm;

  while (testandset(spinlock)) {
    if (cnt < MAX_SPIN_COUNT) {
      sched_yield();
      cnt++;
    } else {
      tm.tv_sec = 0;
      tm.tv_nsec = SPIN_SLEEP_DURATION;
      nanosleep(&tm, NULL);
      cnt = 0;
    }
  }
}

int s = 1;

int main(int argc, char **argv)
{
//      printf("&s = %p\n", &s);
        __pthread_acquire(&s);

        return 0;
}
================================================================


and compile with "gcc -O -Wall -o ldcw ldcw.c"

Run it on a B180 and it completes; run it on a 715/75 and it loops
in __pthread_acquire().

If you uncomment the printf at the beginning of main() it completes
on the 715/75 also.

Is there some cacheline requirements on spinlocks that libpthread needs
to take in to account?

Richard
