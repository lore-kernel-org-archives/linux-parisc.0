Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id AD467482A
	for <parisc-linux@parisc-linux.org>; Fri,  4 May 2001 16:37:06 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14voBz-0000Is-00; Fri, 04 May 2001 23:36:55 +0100
Date: Fri, 4 May 2001 23:36:55 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] glibc 2.2.3: setjmp/longjmp
Message-ID: <20010504233655.K32445@parcelfarce.linux.theplanet.co.uk>
References: <20010504223825.J32445@parcelfarce.linux.theplanet.co.uk> <200105042151.RAA19009@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200105042151.RAA19009@hiauly1.hia.nrc.ca>; from dave@hiauly1.hia.nrc.ca on Fri, May 04, 2001 at 05:51:59PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, May 04, 2001 at 05:51:59PM -0400, John David Anglin wrote:
> > On Fri, May 04, 2001 at 05:31:30PM -0400, John David Anglin wrote:
> > > Doesn't look like _setjmp comes back at all.  Put a break on ea18
> > > and start stepping.  It might help to do a static link.
> > 
> > this code is in the dynamic linker :-))
> 
> Can you set a break on main, run to main, set the break in the
> dynamic linker, then continue?

No, though this is probably due more to my lack of skill with gdb than
anything else.

I set a breakpoint on _dl_signal_error ok.
Then inspecting the jmpbuf indicates that it's returning to 4101434f

/proc/<pid>/maps indicates:
0000000041000000-000000004101a000 r-xp 0000000000000000 08:03 1754026    /home/willy/cvs/glibc-build/elf/ld.so

objdump --disassemble shows:

000143e0 <index>:
...
   143f4:       6b d3 3f c1     stw r19,-20(sr0,sp)

which is the middle of nowhere.  Actually, it's right _after_ __longjmp.
clearly it should be returning to 4100ea4c

Going back and setting a breakpoint on _dl_catch_error indicates that the
value being put at ((unsigned long *)c.env)[20] is 0x4101434F, so the jmpbuf
isn't being corrupted...

-- 
Revolutions do not require corporate support.
