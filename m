Return-Path: <carlos@baldric.uwo.ca>
Received: from fep02-mail.bloor.is.net.cable.rogers.com
	(fep02-mail.bloor.is.net.cable.rogers.com [66.185.86.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id B13DF484B
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Jan 2004 12:43:41 -0700 (MST)
Received: from systemhalted ([24.43.33.92])
	by fep02-mail.bloor.is.net.cable.rogers.com
	(InterMail vM.5.01.05.12 201-253-122-126-112-20020820) with ESMTP id
	<20040126194129.MZDV116070.fep02-mail.bloor.is.net.cable.rogers.com@systemhalted>
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Jan 2004 14:41:29 -0500
Date: Mon, 26 Jan 2004 14:44:00 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] semid64_ds compiled on a 32-bit system has wrong
	expected size for sem_ctime
Message-ID: <20040126194400.GI5351@baldric.uwo.ca>
References: <20040126192659.GH5351@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040126192659.GH5351@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> struct semid64_ds {
>         struct ipc64_perm sem_perm;             /* permissions .. see ipc.h */
> #ifndef __LP64__
>         unsigned int    __pad1; 
> #endif
>         __kernel_time_t sem_otime;              /* last semop time */
> #ifndef __LP64__
>         unsigned int    __pad2; 
> #endif
>         __kernel_time_t sem_ctime;              /* last change time */
>         unsigned int    sem_nsems;              /* no. of semaphores in array */
>         unsigned int    __unused1;
>         unsigned int    __unused2;
> };

Our 32-bit userspace will see different values for this depending on
running a 32-bit kernel or 64-bit. That last sem_ctime should probably
have a padding so our 32-bit userspace sees the right thing all the
time.

Something like?

---
#ifndef __LP64__
	unsigned int	__pad3;
#endif
	__kernel_time_t sem_ctime;
---

c.
