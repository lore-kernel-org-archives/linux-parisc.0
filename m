From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH] fix SMP TLB optimisations
Date: Sun, 25 Feb 2007 16:19:29 -0500 (EST)
Message-ID: <200702252119.l1PLJTk7014385__6611.7953313098$1416624316$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440702251242m6d064ae3ld37ec940b363960e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: James.Bottomley@steeleye.com,
 parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702251242m6d064ae3ld37ec940b363960e@mail.gmail.com>
	from "Carlos O'Donell" at Feb 25, 2007 03:42:03 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Because this is non-PIC code the save/restore of r19 has been turned
> into a NOP.

Why a NOP?  Wouldn't a newline be ok?

> > It could be replaced by a mtsp instruction:
> >
> >         mtsp %r0,%sr2
> >
> > This would ensure that sr2 is always set correctly for the branch to
> > the gateway page.
> 
> ... only for people with a recent enough glibc.

Sure!  However, I thought I saw people requesting new syscalls, etc ;)

> > Don't like what's going on with fr22 in the above code.  Seems like a
> > GCC optimization bug since it looks like there are a few general registers
> > that could be used.
> 
> Why a bug? It's a register just like any other.

It's an optimization bug because copying from a general to a floating
register has to be done through memory.  A stack local would save
a read and write.  In this case, all the manipulation is done before
the syscall and there would appear to be sufficient general registers
available to do the job.  GCC's register allocator should be smart
enough to figure this out...

I haven't studied this in detail but GCC on the PA allocates floating
registers first.  It's claimed in the code that this results in better
code.  This allocation scheme was probably based on work done at Utah
in the early 90's.  So, things may have changed.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
