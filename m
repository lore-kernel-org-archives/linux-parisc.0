Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by dsl2.external.hp.com (Postfix) with ESMTP id E4475483E
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Nov 2003 02:01:23 -0700 (MST)
Date: Mon, 3 Nov 2003 09:59:36 +0100
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] what's up with the ipc syscalls?
Message-ID: <20031103085936.GB9083@solo.franken.de>
References: <20031101082451.GJ28967@tausq.org> <20031102180150.GA14554@solo.franken.de> <20031102181252.GY28967@tausq.org> <20031102214200.GA5299@solo.franken.de> <20031102215528.GC28967@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031102215528.GC28967@tausq.org>
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

On Sun, Nov 02, 2003 at 01:55:28PM -0800, Randolph Chung wrote:
> - fix glibc to pass in IPC_64 properly into the kernel from now on, 
>   2.4 will still work with current hacks.

no, 2.4 will break, because shmctl will try to fixup structs, which
don't need fixing. Please look at the code in sys_parisc.c

> - fix 2.6 to detect the IPC_64 flag and go through the "normal"
>   (arch-indep) path to figure out it should use the new structs

we only have new structs in the sense of ipc/*.c. That old stuff
is older x86 stuff, we never had. The only problem is, that we
had some broken structs, which weren't working on 64bit kernel, because
the alignment was broken.

> 2.6 is broken as it is now, so there's no 2.6 compatibility to worry
> about.

so why no just use the same way, I changed it in 2.4 ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
