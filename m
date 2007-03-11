From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Problem with atomicity of TIF for parisc ?
Date: Sun, 11 Mar 2007 18:40:29 -0400 (EDT)
Message-ID: <200703112240.l2BMeVKD014570__19648.3745392927$1416624326$gmane$org@hiauly1.hia.nrc.ca>
References: <200703112125.53971.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: kyle@mcmartin.ca,
 parisc-linux@lists.parisc-linux.org
To: deller@gmx.de (Helge Deller)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200703112125.53971.deller@gmx.de> from "Helge Deller" at Mar 11, 2007 09:25:53 pm
List-ID: <linux-parisc.vger.kernel.org>

> Independend of the fact if irq-disabling is enough on SMP or not.
> The question still remains: May this be one of the reasons we see the hangs ?

Looking at a couple of other archs, it appears the reschedule check is done
with interrupts disabled.  For example,

        /* Either reschedule or signal or syscall exit tracking needed. */
	/* First do a reschedule test. */
	/* edx: work, edi: workmask */
int_careful:
	bt $TIF_NEED_RESCHED,%edx
	jnc  int_very_careful
	TRACE_IRQS_ON
	sti
	pushq %rdi
	CFI_ADJUST_CFA_OFFSET 8
	call schedule
	popq %rdi
	CFI_ADJUST_CFA_OFFSET -8
	cli
	TRACE_IRQS_OFF
	jmp int_with_check

However, since interrupts are enabled after the test, I have to think
that the test is just a first cut at determining whether to reschedule.
So, I suspect there isn't an issue with the code in entry.S.

The x86_64 problem concerned the clearing and setting of TIF flags
in an atomic manner.  I don't see a problem with this in arch/parisc/kernel.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
