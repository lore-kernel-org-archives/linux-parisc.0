From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] [RC] Integrate LWS CAS into hppa-linux glibc.
Date: Fri, 15 Apr 2005 12:58:59 -0400
Message-ID: <20050415165859.GC26980@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


pa,

I have checked in a test into userspace/test-lws in CVS in order to
verify that my glibc implementation actually works before integrating it
with the build.

The test is 'atomic-test' and it makes use of 'atomic.h' which will be
added to the hppa-linux glibc build. Not in debian, but in a local
experimental build to check for regressions (and do more testing).

Can someone look at the code and give some comments?
Would it be clearer if I spelled out exactly how LWS CAS works and add
it to the wiki?

Note: I would rather have the LWS CAS return to userspace instead of
spinning on the gateway page, largely because we can't deliver signals
or schedule while it sits on the gateway.

c.

---
/* Copyright (C) 2003 Free Software Foundation, Inc.
   This file is part of the GNU C Library.
   Contributed by Carlos O'Donell <carlos@baldric.uwo.ca>, 2005.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

#include <asm/errno.h>
#include <abort-instr.h>

#ifndef _BITS_ATOMIC_H
#define _BITS_ATOMIC_H	1

/* Use the kernel atomic light weight syscalls on hppa */ 

#define LWS "0xb0"
#define LWS_CAS 0x0
#define LWS_CLOBBER "r26", "r25", "r24", "r23", "r22", "r20", "r28", "r21", "memory"

/* prev = *addr;
   if (prev == old)
     *addr = new;
   return prev; */

/* The only basic operation needed is compare and exchange.  */
#define atomic_compare_and_exchange_val_acq(mem, newval, oldval) 	\
  ({									\
     int lws_errno = EAGAIN;						\
     int lws_ret;							\
     /* Catch bad users address, preread */				\
     lws_ret = *(int *)mem;						\
     while (lws_errno == EAGAIN)					\
     	lws_ret = lws_atomic_compare_and_swap(&lws_errno, LWS_CAS, 	\
						(unsigned int)mem,	\
						oldval, newval);	\
     if(lws_errno == EFAULT)						\
     	ABORT_INSTRUCTION;						\
     lws_ret;								\
   })

/* Implement compare_and_swap using a light-weight syscall */
#define lws_atomic_compare_and_swap(lws_errno, lwsnum, in0, in1, in2)	\
  ({									\
    int retval;								\
    int error;								\
    /* Make light-weight syscall */					\
    asm volatile(							\
	"copy   %3, %%r26\n\t"						\
	"copy   %4, %%r25\n\t"						\
	"copy   %5, %%r24\n\t"						\
	"ble    " LWS "(%%sr2, %%r0)\n\t"				\
	"copy   %2, %%r20\n\t"						\
	"stw    %%r28, %0\n\t"						\
	"stw    %%r21, %1\n\t"						\
	: "=m" (retval), "=m" (error)					\
        : "r" (lwsnum), "r" (in0), "r" (in1), "r" (in2)			\
	: LWS_CLOBBER							\
     );									\
    /* Set error */							\
    *lws_errno = (-1)*error;						\
    /* Equivalent return of the function */				\
    retval;								\
   })


#define atomic_compare_and_exchange_bool_acq(mem, newval, oldval) \
  ({									\
     int lws_errno = EAGAIN;						\
     int lws_ret;							\
     /* Catch bad users address, preread */				\
     lws_ret = *(int *)mem;						\
     while (lws_errno == EAGAIN)					\
     	lws_ret = lws_atomic_compare_and_swap(&lws_errno, LWS_CAS, 	\
						(unsigned int)mem,	\
						oldval, newval);	\
     if(lws_errno == EFAULT)						\
     	ABORT_INSTRUCTION;						\
     lws_ret == oldval;							\
   })

#endif	/* bits/atomic.h */
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
