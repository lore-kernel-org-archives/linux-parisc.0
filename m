Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 29 Jul 2003 13:50:58 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Matthew Wilcox <willy@debian.org>,
	Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Generic light-weight syscall.
Message-ID: <20030729175057.GA17107@systemhalted>
References: <20030725063739.GA13017@systemhalted> <20030725113700.GH1485@parcelfarce.linux.theplanet.co.uk> <20030726174845.GF31744@systemhalted> <20030726180031.GG31744@systemhalted> <20030727122745.GC16753@dsl2.external.hp.com> <20030728155703.GA32553@systemhalted> <20030728174551.GC3840@parcelfarce.linux.theplanet.co.uk> <20030728190455.GE32553@systemhalted> <20030728191420.GE3840@parcelfarce.linux.theplanet.co.uk> <20030728211012.GC6706@sleepie.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030728211012.GC6706@sleepie.demon.co.uk>
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

> > We discussed this in the Black Thorn ... record what value you last
> > returned to the user and never return less than that.
> 
> Not very nice if the difference between CPUs is significant.  You could
> find yourself checking time on CPU A, doing some work, getting moved to
> CPU B, checking time, and finding you apparently did all that in 0ns.

Willy and myself talked about this, you just return 1ns in the case
where you know that _something_ must have taken _some_ amount of time
(e.g. the insns that make up fast gettimeofday) so you couldn't have done
it in zero time :)

I also just noticed (thanks to jejb) that cr16 is readable from
userspace since we leave PSW-S cleared. So the following works:

        unsigned long cr16;
        asm("mfctl %%cr16, %0" : "=r" (cr16) : );
        printf("cr16=%lu\n",cr16);

---
carlos@firin:~$ ./test_cr16_read 
cr16=3544734914
carlos@firin:~$ ./test_cr16_read 
cr16=4230470557
carlos@firin:~$ ./test_cr16_read 
cr16=2337868642
carlos@firin:~$ 
---

It overlaps pretty fast though. Userspace could do the translation and
hold on to a 'last_tick' value and then return a really small value if
we get scheduled onto a negatively-drifted CPU? Do all CPU's update cr16?

Willy, I just realized that the following trail of function calls
doesn't really work under smp:

glibc -> 
 gettimeofday -> 
  syscall + syscall table lookup -> 
   sys32_gettimeofday ->
    do_gettimeofday ->
     gettimeoffset ( returns 0 in smp)

With the comment I don't quite understand:
linux-2.4/arch/parisc/kernel/time.c
   /*
    * FIXME: This won't work on smp because jiffies are updated by cpu
    * 0.
    *    Once parisc-linux learns the cr16 difference between
    *    processors,
    *    this could be made to work.
    */

Does that mean that our time granularity drops drastically in the SMP
case? We loose usec! (2.4 and 2.5 kernels)

c.
