Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, carlos@baldric.uwo.ca,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] malloc limits 
In-Reply-To: Message from "John David Anglin" <dave@hiauly1.hia.nrc.ca>
   of "Sat, 21 Sep 2002 01:24:54 EDT." <200209210524.g8L5OtNw006246@hiauly1.hia.nrc.ca>
References: <200209210524.g8L5OtNw006246@hiauly1.hia.nrc.ca> 
Date: Sat, 21 Sep 2002 16:33:52 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020921223352.C64324829@dsl2.external.hp.com>
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

"John David Anglin" wrote:
> It's the address of the next contiguous chunk.  This is roughly the sum
> of the address plus the size of the chunk to be freed.  The segv occurs
> loading the size of the next chunk using the address.

I'll assume this is happening on the A500 (PA2.0) and wonder if it's
a signed/unsigned bug. Look closely at how PA2.0 extends register
values and make sure code is treating addresses and sizes as unsigned.


> I haven't been successful debugging the code directly.  I can get the
> code to seg fault by setting SIG37 to nostop noprint, but the debugger
> seems to think the fault occurs following the INLINE_SYSCALL in
> __sigsuspend.  However, the address points to an ldi instruction
> which can't seg fault, so I don't know what's up.

Not all instructions trap precisely. FP ops definitely do not and
I thought a few others didn't either.

I'm wondering what happens when unaligned access should segfault.
Does the unaligned code handle check for that?
I'll take a quick look at that code path.


thanks,
grant
