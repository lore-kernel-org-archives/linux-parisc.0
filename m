Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id JAA24146
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Jan 2001 09:03:25 -0700
Received: from upchuck.cygnus.com (taarna.cygnus.com [205.180.230.102])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id IAA10996
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Jan 2001 08:07:07 -0800 (PST)
To: Alan Modra <alan@linuxcare.com.au>
cc: Richard Henderson <rth@redhat.com>,
        John David Anglin <dave@hiauly1.hia.nrc.ca>, gcc-patches@gcc.gnu.org,
        parisc-linux@puffin.external.hp.com
Subject: Re: Oust HPPA PIC_OFFSET_TABLE_REGNUM_SAVED 
Reply-To: law@redhat.com
In-reply-to: Your message of Wed, 17 Jan 2001 18:24:49 +1100.
             <Pine.LNX.4.21.0101171802240.9957-100000@front.linuxcare.com.au>
From: Jeffrey A Law <law@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 17 Jan 2001 09:09:11 -0700
Message-ID: <23954.979747751@upchuck.cygnus.com>
Sender: law@cygnus.com
List-ID: <linux-parisc.vger.kernel.org>



  In message <Pine.LNX.4.21.0101171802240.9957-100000@front.linuxcare.com.au>yo
u write:
  > What I was trying to do here is test whether the pseudo has been allocated
  > a register, or the case where register pressure causes it to spill to a
  > stack slot.
But the code in question is executed during insn expansion time -- long long
before we know anything about whether or not a particular pseudo register
will be allocated to a hard register or stack slot.

  > There seemed to be three cases:
  >   - register isn't used so appears as a pseudo
  >   - register is allocated a hard reg
  >   - register is allocated a stack slot
But I can't see how the final two cases could happen at that stage in
compilation.  If you actually saw these under the debugger, I'd like you to
investigate them further since I don't believe they can/should happen.
[ Note that I'm not convinced the old check to avoid the restore was
  correct either. ]

  > > I think we should just emit the insn unconditionally unless you're aware
  > > of some reason we can't shouldn't.
  > 
  > That causes an error when no dlt save register is needed - prologue
  > instruction would be deleted.
If we emit a call, then we must reload the PIC register.  There's no iffs
ands or butts about it.  If that's causing aborts/warnings, then we've likely
got a bug _elsewhere_.  It's entirely possible that getting the use on the
return insn will fix that problem.

  > > We're probably also going to need to emit a use of the %r19 and maybe %r2
  > 7
  > > on the return insns to ensure the pic register is restored after the
  > > final call in any given function.
  > 
  > I've a "use" in the epilogue in my tree.  Hadn't posted that patch as I
  > wasn't sure it's correct in the face of tail calls.
We can't perform tail calls when we're generating PIC code right now
(right now PIC == code suitable for shared library on the PA).  Consider
linkage issues.

What makes this interesting is that we don't need/want the use on the trivial
return, but we do want it on the return_internal pattern.  Furthermore, the
register we want to use varies depending on PA32 vs PA64 ABIs.

I've got a patch which handles that stuff in my local tree that I'm testing
right now.
jeff
