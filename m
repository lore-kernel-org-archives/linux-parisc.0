Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 467A0483E
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Nov 2003 14:46:06 -0700 (MST)
Date: Mon, 3 Nov 2003 16:41:19 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] what's up with the ipc syscalls?
Message-ID: <20031103214119.GD778@systemhalted>
References: <20031101082451.GJ28967@tausq.org> <20031102180150.GA14554@solo.franken.de> <20031102181252.GY28967@tausq.org> <20031102214200.GA5299@solo.franken.de> <20031102225626.GF26916@systemhalted> <20031103085601.GA9083@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031103085601.GA9083@solo.franken.de>
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

On Mon, Nov 03, 2003 at 09:56:01AM +0100, Thomas Bogendoerfer wrote:
> glibc 2.2.x, some weeks before woody went final. For a closer date
> check the date of my sys_parisc.c commit.

My apologies Thomas I think I begin to see your logic. Now if you follow
me I'll paint a picture.

a. We don't have an IPC multiplexor.
b. We added all such functions into syscalls.list so they would be
   generated as assembly wrappers.
c. Kernel would activate IPC64 for all the calls so it returned IPC64 to
   userspace.

> Since there might be still binaries in woody, which are compiled
> with an such an "old" glibc, we will break this binaries. The suggested
> change is an change of the kernel ABI, so I would avoid it. The problem
> with this "old" glibc was, that the structs for shmctl and friends
> weren't properly aligned for 64bit. I've changed that and also decided
> to get rid of IPC_64, because that's x86 crap.
> 
> Adding the 2.4 changes to the 2.6 kernel should fix everything.

Should an old binary exist with this old glibc, it would break should
the kernel stop activating IPC64.

I agree that the 2.4 changes forward ported will change everything, but
the glibc changes are *also* required so we can eventually turn off the
kernel code that activates IPC64 for all the incoming calls. When we
don't care about these old binaries and old glibc we will remove the
kernel code.

Now it's my turn to ask the question: Did that make any sense? :o)

c.
