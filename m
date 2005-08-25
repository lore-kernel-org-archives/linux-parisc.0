From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Latest 2.6.13-rc6-pa2 test pr :_(
Date: Thu, 25 Aug 2005 23:59:17 +0800
Message-ID: <430DEAD5.9070008@tausq.org>
References: <200508241530.j7OFUFwS005854@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200508241530.j7OFUFwS005854@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Still don't know.  I have been working on the java testsuite which
> appears to cause most of the kernel bugs.  I fixed a bug last weekend
> where the signal handler caused a SIGSEGV.  An incorrect count was
> used to copy a mmapped block.  We still have a problem with PR218.exe.
> The DWARF unwind fails to stop and allocates a huge amount of memory.
> PR218 is a simple test to test whether the runtime can catch a null
> pointer exception from a leaf routine.  I think there is a bug in
> MD_FALLBACK_FRAME_STATE_FOR.  It replaces the %r2 value with the
> iaoq[0] value and I think this fails when we need to unwind through
> a leaf function which doesn't save %r2.

Can you explain more where this is broken?

I'm assuming you are talking about this bit of code:

     134   fs->regs.reg[2].how = REG_SAVED_OFFSET;
     135   fs->regs.reg[2].loc.offset = (long) &sc->sc_iaoq[0] - new_cfa;
     136   fs->retaddr_column = 2;

sc_iaoq[0] should be the pc when the signal handler was triggered, so it 
shouldn't matter if it's a leaf func or not. We are simply telling the 
unwinder that reg[2] has the return address of the current (signal 
handler) function, and the value of reg[2] can be computed with a stack 
offset. When is this wrong?

randolph
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
