Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id JAA18238
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 09:38:40 -0700
Received: from upchuck.cygnus.com (taarna.cygnus.com [205.180.230.102])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id IAA29672
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 08:42:15 -0800 (PST)
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
cc: alan@linuxcare.com.au (Alan Modra), gcc-patches@gcc.gnu.org,
        parisc-linux@puffin.external.hp.com
Subject: Re: Oust HPPA PIC_OFFSET_TABLE_REGNUM_SAVED 
Reply-To: law@redhat.com
In-reply-to: Your message of Mon, 15 Jan 2001 11:24:22 EST.
             <200101151624.LAA26183@hiauly1.hia.nrc.ca>
From: Jeffrey A Law <law@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 15 Jan 2001 09:38:32 -0700
Message-ID: <8375.979576712@upchuck.cygnus.com>
Sender: law@cygnus.com
List-ID: <linux-parisc.vger.kernel.org>


  In message <200101151624.LAA26183@hiauly1.hia.nrc.ca>you write:
  > > This patch rids us of PIC_OFFSET_TABLE_REGNUM_SAVED, and the problems tha
  > t
  > > go with it.  Additionally, I reload the pic offset table register before
  > > calls to guard against asm trashing r27/r19.  Hasn't bootstrapped yet, bu
  > t
  > > looks promising.  One possible fly in the ointment is whether any ABI
  > > requires that r4 always be used to save the pic offset table reg.
  > 
  > At first glance, this looks like a good solution.  I don't see any
  > requirementthat r4 be used to save the pic offset table reg in either ABI.
It is not an ABI requirement.  It was done because GCC was unable 
reasonably cope with a PIC register that was call-clobbered.

  > However, why is it necessary to guard against asms trashing r27/r19?  If
  > this happens, data access using gp won't work as well.  Shouldn't asms
  > ensure that they restore r27/r19 if they trash it?  If in fact r27/r19
  > needs to be restored prior to calls, it looks like it also needs to be
  > restored prior to each procedure return (see below).  This would prevent
  > the trivial return from ever being generated whenever pic code is used.
  > Thus, it seems necessary to ensure that r27/r19 is preserved from entry
  > to exit.
If an ASM trashes a fixed register, then the ASM is responsible for restoring
it.

jeff
