From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: Need help writing register consistency test?
Date: Thu, 16 Sep 2004 15:19:46 -0400 (EDT)
Message-ID: <200409161919.i8GJJk7v007348@hiauly1.hia.nrc.ca>
References: <20040916172131.GF28936@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: James.Bottomley@steeleye.com,
 parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040916172131.GF28936@baldric.uwo.ca> from "Carlos O'Donell" at
	Sep 16, 2004 01:21:32 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > > Why isn't this the debug ld.so?
> > 
> > dave@gsyprf11:~/gcc-4.0$ ll /usr/lib/debug/ld.so.1
> > lrwxr-xr-x  1 root root 11 Sep 12 22:15 /usr/lib/debug/ld.so.1 ->
> ld-2.3.2.so
> 
> Yes, but that isn't what you are using.

Doh, I'm using the default set by ld.  This can be changed using
the --dynamic-linker file option.

> > Makes life difficult, hey :(  However, I'm only seeing this stuff
> > with 64-bit kernels.
> 
> Or is it that only 64-bit boxes are fast enough to expose a race
> condition?

I doubt it's a speed issue as my c3750 has a faster cpu.  However,
it could be a SMP problem.

> > > So you are saying that the code should have given that value, but
> > > something corrupted the value before it was used?
> > 
> > Yes.
> 
> That is a very interesting hypothesis. It looks like the bug I used to
> track down with r19 corruption only under certain return paths of fork
> in the kernel. I'll be frank it takes some serious debugging.
> 
> -- Help Needed! --
> 
> There are only 235 syscalls, some of which don't need to be tested, only
> a small fraction could be tested with some special program? A program
> that would check for register value consistency across the call?
> This would have caught our r19 corruption through fork, perhaps there
> are other temp register uses that clobber a single register? It would be
> a starting place.

I'm not sure that this is a syscall problem although it might be.  There
weren't any syscalls between the load for r3 and when it was used as far
as I can tell.  So, if this is a syscall problem, it would have to be a
syscall that was done in a signal handler.  The difficulty in writing
a program such as that suggested above is that it has to somehow test
all the return paths in the kernel for each syscall.

Had another SEGV building GCC last night of gsyprf11.

I certainly agree that this type of problem needs some serious debugging.
I think logging of SEGVs is somewhat broken.  It looks like kernel logging
stops when /var fills up and doesn't automatically restart when the problem
is cleared.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
