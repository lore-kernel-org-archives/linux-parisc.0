Return-Path: <carlos@baldric.uwo.ca>
Received: from fep01-mail.bloor.is.net.cable.rogers.com
	(fep01-mail.bloor.is.net.cable.rogers.com [66.185.86.71])
	by dsl2.external.hp.com (Postfix) with ESMTP id 31098484B
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Jan 2004 12:26:41 -0700 (MST)
Received: from systemhalted ([24.43.33.92])
	by fep01-mail.bloor.is.net.cable.rogers.com
	(InterMail vM.5.01.05.12 201-253-122-126-112-20020820) with ESMTP id
	<20040126192357.ODEQ286904.fep01-mail.bloor.is.net.cable.rogers.com@systemhalted>
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Jan 2004 14:23:57 -0500
Date: Mon, 26 Jan 2004 14:27:00 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040126192659.GH5351@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] semid64_ds compiled on a 32-bit system has wrong
	expected size for sem_ctime
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

pa,

If anyone has been looking at his recently, please be kind enough to
explain how this compat shim works :)

Note the following things:

o semid64_ds.sem_ctime is of type __kernel_time_t
	o In a 32-bit build this is an int.
	o Generic code expects this to be a long.
	o For a 32-bit build long == int.

linux-2.6/include/asm-parisc/sembuf.h
---
#ifndef _PARISC_SEMBUF_H
#define _PARISC_SEMBUF_H

/* 
 * The semid64_ds structure for parisc architecture.
 * Note extra padding because this structure is passed back and forth
 * between kernel and user space.
 *
 * Pad space is left for:
 * - 64-bit time_t to solve y2038 problem
 * - 2 miscellaneous 32-bit values
 */

struct semid64_ds {
        struct ipc64_perm sem_perm;             /* permissions .. see ipc.h */
#ifndef __LP64__
        unsigned int    __pad1; 
#endif
        __kernel_time_t sem_otime;              /* last semop time */
#ifndef __LP64__
        unsigned int    __pad2; 
#endif
        __kernel_time_t sem_ctime;              /* last change time */
        unsigned int    sem_nsems;              /* no. of semaphores in array */
        unsigned int    __unused1;
        unsigned int    __unused2;
};

#endif /* _PARISC_SEMBUF_H */
---

linux-2.6/ipc/sem.c
---
   1299                 if(sma) {
   1300                         len += sprintf(buffer + len, "%10d %10d
                                   %4o %10lu %5u %5u %5u %5u %10lu %10lu\n",
   1301                                 sma->sem_perm.key,
   1302                                 sem_buildid(i,sma->sem_perm.seq),
   1303                                 sma->sem_perm.mode,
   1304                                 sma->sem_nsems,
   1305                                 sma->sem_perm.uid,
   1306                                 sma->sem_perm.gid,
   1307                                 sma->sem_perm.cuid,
   1308                                 sma->sem_perm.cgid,
   1309                                 sma->sem_otime,
   1310                                 sma->sem_ctime);
   1311                         sem_unlock(sma);
   1312 
   1313                         pos += len;
   1314                         if(pos < offset) {
   1315                                 len = 0;
   1316                                 begin = pos;
   1317                         }
   1318                         if(pos > offset + length)
   1319                                 goto done;
   1320                 }
---

Note that sem.c looks to have ctime as an unsigned long?
Does this mean that we should change the definition of our
posix_types.h?

linux-2.6/include/asm-parisc/posix_types.h
---
     22 /* Note these change from narrow to wide kernels */
     23 #ifdef __LP64__
     24 typedef unsigned long           __kernel_size_t;
     25 typedef long                    __kernel_ssize_t;
     26 typedef long                    __kernel_ptrdiff_t;
     27 typedef long                    __kernel_time_t;
     28 #else
     29 typedef unsigned int            __kernel_size_t;
     30 typedef int                     __kernel_ssize_t;
     31 typedef int                     __kernel_ptrdiff_t;
     32 typedef int                     __kernel_time_t;
     33 #endif
---

Should the last __kernel_time_t definition be replaced with "unsigned
long," or does the generic code *really* want the ctime to be 64-bits
regardless (see the padding in the semid64_ds structure) so that we
don't have rollover time in 2038 as noted by the comment. I think a
change in the position of sem_nsems would violate ABI, so perhaps it's
best to leave it and have the posix_types.h value change to "unsigned
long."

Thoughts or comments?

c.
