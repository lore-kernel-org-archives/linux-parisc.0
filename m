Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id CCE014840
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Nov 2003 09:54:33 -0700 (MST)
Message-Id: <200311261654.hAQGsUCa011684@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [RFC] rewrite kernel spinlock code to work better with gcc
To: randolph@tausq.org
Date: Wed, 26 Nov 2003 11:54:30 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20031126070714.GN975@tausq.org> from "Randolph Chung" at Nov 25, 2003 11:07:14 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> +/* Because kmalloc only guarantees 8-byte alignment for kmalloc'd data,
> +   and GCC only guarantees 8-byte alignment for stack locals, we can't
> +   be assured of 16-byte alignment for atomic lock data even if we
> +   specify "__attribute ((aligned(16)))" in the type declaration.  So,
> +   we use a struct containing an array of four ints for the atomic lock
> +   type and dynamically select the 16-byte aligned int from the array
> +   for the semaphore.  */
> +#define __PA_LDCW_ALIGNMENT 16
> +#define __ldcw_align(a) ({ \
> +  unsigned long __ret = (unsigned long) a;                     		\
> +  __ret = (__ret + __PA_LDCW_ALIGNMENT - 1) & ~(__PA_LDCW_ALIGNMENT - 1); \
> +  (unsigned int *) __ret;                                               \
> +})

Change cast to "volatile unsigned int *".

>  typedef struct {
> -	volatile unsigned int __attribute__((aligned(16))) lock;
> +	volatile unsigned int lock[4];
>  } spinlock_t;
>  #endif

Is the struct necessary?  For example,

  typedef volatile unsigned int spinlock_t[4];

I believe that there are situations where the rest of the cache line
holding the active lock word should not be used.  The PA 1.x document
says

  When using semaphores to synchonize with I/O, care must be taken
  in placing other information in the same cache line as the semaphore.
  Data which is writeable can only be placed in the same cache line
  as a semaphore if access to write the data is controlled by the
  semaphore.

I think this restriction only applies to semaphores used both by
I/O and CPU processors, and it's not a concern for semaphores used
solely by CPU processors.  If we have locks used by I/O processors
and they are stack allocated, then some extra padding would appear
to be needed for these locks.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
