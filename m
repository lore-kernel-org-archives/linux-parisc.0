From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: ls -l is broken
Date: Fri, 11 Apr 2008 14:00:16 -0400
Message-ID: <20080411180016.GL27073@phobos.i.cabal.ca>
References: <20080406222813.F11CA4E43@hiauly1.hia.nrc.ca> <20080411174123.GK27073@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080411174123.GK27073@phobos.i.cabal.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Apr 11, 2008 at 01:41:23PM -0400, Kyle McMartin wrote:
> > ii  coreutils      6.10-3         The GNU core utilities
> > ii  libc6          2.7-6          GNU C Library: Shared libraries
> > dave@mx3210:~/gnu/gcc/gcc$ uname -a
> > Linux mx3210 2.6.22.19 #4 SMP Tue Apr 1 19:24:18 EDT 2008 parisc64 GNU/Linux
> 
> I'm seeing this now as well... strace seems to barf on ptrace for some
> reason (but is working fine otherwise... odd)
>

This must be a bug in the new glibc in sid... I'm seeing it on machines
with old kernels upgraded to sid (and, obviously, on machines with brand
new kernels.)

Either that or some glibc change is exposing a bug in our syscalls. I'll
try to puzzle out why ptrace is broken this weekend.

--Kyle 
