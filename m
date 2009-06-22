From: Petr Salinger <Petr.Salinger@seznam.cz>
Subject: HPPA linux compat wrappers
Date: Mon, 22 Jun 2009 12:51:14 +0200 (CEST)
Message-ID: <Pine.LNX.4.62.0906221117370.2390@sci.felk.cvut.cz>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

> Core glibc patch:
> http://www.parisc-linux.org/~carlos/2009-06-20-glibc-hppa-nptl.diff

> Ports glibc patch:
> http://www.parisc-linux.org/~carlos/2009-06-20-glibc-ports-hppa-nptl.diff

> However, the usability testing in a chroot + vnc is showing that some
> applications are segfaulting. I've been looking into this today.

I still think there should be support for mixed ABI calls.
It would be sufficient to have at least one int of the previous
lt __spinlock place as unused in NTPL layout.

There should be change of current NPTL structure to allow it.
There are only two types of correct initializers.
It either contains all zero (modulo i.e __kind)
or it contains four one's and the rest is zero (modulo i.e __kind).

See also thread http://lists.debian.org/debian-hppa/2008/09/msg00018.html

typedef union
{
   struct __pthread_mutex_s
   {
     int __lock;
     unsigned int __count;
     int __owner;
     /* KIND must stay at this position in the structure to maintain
        binary compatibility.  */
     int __kind;
     int __lt_compat;
     unsigned int __nusers;
     __extension__ union
     {
       int __spins;
       __pthread_slist_t __list;
     };
   } __data;
   char __size[__SIZEOF_PTHREAD_MUTEX_T];
   long int __align;
} pthread_mutex_t;


The __lt_compat is inialized as zero under NPTL, it is initialized
as 1 under linuxthreads.

Similarly also for the other types.
The question is why have been sizeof(pthread_cond_t)
expanded from 48 bytes under linuxthreads into
64 bytes under NPTL. I do not see a reson for it.
IMHO, it might significantly break compatibility.

The current NPTL implementation zeroes all the fields at the begining, 
doesn't it ?
So at the begin of each affected function will be (asm coded ?)

   if (v->__lt_compat)
   {
      lock_global_pt_lock();
      if (v->__lt_compat)
      {
      		zero_all_but_lt_compat_field();
 		barrier();
                 v->__lt_compat = 0;
      };
      unlock_global_pt_lock();
   };

For the new NPTL layout the zeroing code will not be taken,
therefore almost no overhead.
There might be a congestion on global_pt_lock, but I do not believe,
there are many static initilized mutexes in any real program.
There will be no need for allocation any new structures.

The drawback is hppa specific pthread.h or need to convince Uli
to add unused zeroed field into affected structures globally.

Petr

