Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id DF582484E
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Nov 2003 14:55:18 -0700 (MST)
Date: Sun, 2 Nov 2003 13:55:28 -0800
From: Randolph Chung <randolph@tausq.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] what's up with the ipc syscalls?
Message-ID: <20031102215528.GC28967@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20031101082451.GJ28967@tausq.org> <20031102180150.GA14554@solo.franken.de> <20031102181252.GY28967@tausq.org> <20031102214200.GA5299@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031102214200.GA5299@solo.franken.de>
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

> look at the switch statements in msg.c/sem.c/shm.c. If you don't mask
> off IPC_64, the cases don't match.
> 
> > right now glibc *doesn't* call the syscall with IPC_64, but i'm about to
> > make it do that again.
> 
> I don't think this is a good idea, because by checking for IPC_64 we
> could see, whether an old glibc is used and could convert structs
> (see sys_parisc.c:sys_shmctl_broken()).

?

the whole point is to check the value passed in from userspace instead
of forcing a particular value in the kernel, right?

what i'm proposing is:
- don't touch 2.4, glibc can pass in IPC_64 or not, and it will work
  (since the kernel forces something anyway)

- fix glibc to pass in IPC_64 properly into the kernel from now on, 
  2.4 will still work with current hacks.

- fix 2.6 to detect the IPC_64 flag and go through the "normal"
  (arch-indep) path to figure out it should use the new structs

2.6 is broken as it is now, so there's no 2.6 compatibility to worry
about.

did i miss something?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
