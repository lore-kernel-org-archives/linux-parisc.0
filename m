Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by dsl2.external.hp.com (Postfix) with ESMTP id CD1AD483E
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Nov 2003 11:03:21 -0700 (MST)
Date: Sun, 2 Nov 2003 19:01:50 +0100
To: Randolph Chung <tausq@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] what's up with the ipc syscalls?
Message-ID: <20031102180150.GA14554@solo.franken.de>
References: <20031101082451.GJ28967@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031101082451.GJ28967@tausq.org>
From: tsbogend@alpha.franken.de (Thomas Bogendoerfer)
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

On Sat, Nov 01, 2003 at 12:24:51AM -0800, Randolph Chung wrote:
> in our syscall table, semctl, msgctl and shmctl are marked as "broken".
> Does anybody know what's up with that?
> 
> i did a simple hack, which is to replace
> 
>         return sys_msgctl (msqid, cmd & ~IPC_64, buf);
> 
> with 
> 
>         return sys_msgctl (msqid, cmd | IPC_64, buf);
> 
> in sys_parisc.c, and at least in some simple tests it seems to work
> (whereas the original one was really broken)

if this makes a difference, something in ipc/util.c is missing. When I
added the code above, I also made the ipc_parse_version only return
IPC_64, because we never had IPC_OLD. Older glibc made the call with
IPC_64 set, so we needed the wrapper in sys_parisc.c. I just looked
at the 2.4 version of ipc/util.c and it's still ok ...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
