Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5E010484E
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Nov 2003 11:09:12 -0700 (MST)
Date: Sun, 2 Nov 2003 10:12:52 -0800
From: Randolph Chung <randolph@tausq.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] what's up with the ipc syscalls?
Message-ID: <20031102181252.GY28967@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20031101082451.GJ28967@tausq.org> <20031102180150.GA14554@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031102180150.GA14554@solo.franken.de>
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

> if this makes a difference, something in ipc/util.c is missing. When I
> added the code above, I also made the ipc_parse_version only return
> IPC_64, because we never had IPC_OLD. Older glibc made the call with
> IPC_64 set, so we needed the wrapper in sys_parisc.c. I just looked
> at the 2.4 version of ipc/util.c and it's still ok ...

Ah! that explains it.... that change was not brought forward to 2.6...
i was wondering why my test worked on 2.4 and failed on 2.6....

anyway, if we are only supporting IPC_64, then why mask off the IPC64
bit in the wrapper? if the ipc/utils.c stuff isn't there, wouldn't it
default to doing the right thing when IPC_64 is set?

right now glibc *doesn't* call the syscall with IPC_64, but i'm about to
make it do that again.

thanks,
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
