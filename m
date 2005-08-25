From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Latest 2.6.13-rc6-pa2 test pr :_(
Date: Thu, 25 Aug 2005 13:04:04 -0400 (EDT)
Message-ID: <200508251704.j7PH44IE011159@hiauly1.hia.nrc.ca>
References: <430DEAD5.9070008@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org (Randolph Chung)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <430DEAD5.9070008@tausq.org> from "Randolph Chung" at Aug 25,
	2005 11:59:17 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > Still don't know.  I have been working on the java testsuite which
> > appears to cause most of the kernel bugs.  I fixed a bug last weekend
> > where the signal handler caused a SIGSEGV.  An incorrect count was
> > used to copy a mmapped block.  We still have a problem with PR218.exe.
> > The DWARF unwind fails to stop and allocates a huge amount of memory.
> > PR218 is a simple test to test whether the runtime can catch a null
> > pointer exception from a leaf routine.  I think there is a bug in
> > MD_FALLBACK_FRAME_STATE_FOR.  It replaces the %r2 value with the
> > iaoq[0] value and I think this fails when we need to unwind through
> > a leaf function which doesn't save %r2.
> 
> Can you explain more where this is broken?

No.  I need to do more debugging.

> I'm assuming you are talking about this bit of code:
> 
>      134   fs->regs.reg[2].how = REG_SAVED_OFFSET;
>      135   fs->regs.reg[2].loc.offset = (long) &sc->sc_iaoq[0] - new_cfa;
>      136   fs->retaddr_column = 2;

Yes.  See the alpha implementation that uses an alternate column
for signal handlers.

> sc_iaoq[0] should be the pc when the signal handler was triggered, so it 
> shouldn't matter if it's a leaf func or not. We are simply telling the 
> unwinder that reg[2] has the return address of the current (signal 
> handler) function, and the value of reg[2] can be computed with a stack 
> offset. When is this wrong?

I'm not sure.  The func that triggers the exception looks like this:

00010cc4 <_ZN5PR2183fooEPS_>:
10cc4:       0f 28 10 9c     ldw 4(r25),ret0
10cc8:       37 9c 00 08     ldo 4(ret0),ret0
10ccc:       0f 3c 12 88     stw ret0,4(r25)
10cd0:       e8 40 c0 02     bv,n r0(rp)

It doesn't have a frame.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
