Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA31840
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Dec 1999 18:31:02 -0700
Message-Id: <199912040131.UAA01288@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] a pretty big change
To: bame@debian.fc.hp.com (Paul Bame)
Date: Fri, 3 Dec 1999 20:31:45 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <199912040020.RAA29273@debian.fc.hp.com> from "Paul Bame" at Dec 3, 99 05:20:10 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

I read ee.html this evening.  Having already tracked down one problem
where the real-mode code went off into never-never land when I tried to
print out a string, I agree that separate comilation, linking and conversion
is a good idea.  The size of real-mode code is limited with our current
scheme.  Thus, we may reach the point where it is impossible to link
all real-mode code.

Regarding your example, the problem is that a function address is a PLABEL.
PLABELs are stored in the text space.  I think the problem can be avoided
if the function address is put into a structure which is stored in the
data space.

> I just committed the changes to embed real-mode code in a separate
> executable inside vmlinux.  It should cause no functional changes
> in theory.  Read all about it in arch/parisc/real/README and
> ee.html.  If you have terrible new problems,
> I've attached a list of CVS commands to check out the files before I
> started hacking on them.  I haven't seen a shell prompt from this
> set of hacks so beware...
> 
> 	-Paul Bame
> 
> prumpf- I moved kernel_thread and friends from
> 	real/<something> to kernel/head.S  I also re-enabled BTLB in
> 	real/setup.c so I could get further in the boot.  Left some
> 	debugging printks in the handle_real_interrupt handler too.
> 
> cvs update -r1.25 arch/parisc/Makefile
> 	cvs update -A arch/parisc/Makefile
> cvs update -r1.28 arch/parisc/kernel/Makefile
> 	cvs update -A arch/parisc/kernel/Makefile
> cvs update -r1.35 arch/parisc/kernel/head.S
> 	cvs update -A arch/parisc/kernel/head.S
> cvs update -r1.39 arch/parisc/kernel/irq.c
> 	cvs update -A arch/parisc/kernel/irq.c
> cvs update -r1.14 arch/parisc/kernel/pdc.c
> 	cvs update -A arch/parisc/kernel/pdc.c
> cvs update -r1.25 arch/parisc/kernel/pdc_cons.c
> 	cvs update -A arch/parisc/kernel/pdc_cons.c
> cvs update -r1.73 arch/parisc/kernel/setup.c
> 	cvs update -A arch/parisc/kernel/setup.c
> cvs update -r1.11 arch/parisc/kernel/traps.c
> 	cvs update -A arch/parisc/kernel/traps.c
> cvs update -r1.2 arch/parisc/real/Makefile
> 	cvs update -A arch/parisc/real/Makefile
> cvs update -r1.2 arch/parisc/real/head.S
> 	cvs update -A arch/parisc/real/head.S
> cvs update -r1.2 arch/parisc/real/interruption.S
> 	cvs update -A arch/parisc/real/interruption.S
> cvs update -r1.2 arch/parisc/real/lib.c
> 	cvs update -A arch/parisc/real/lib.c
> cvs update -r1.2 arch/parisc/real/pdc.c
> 	cvs update -A arch/parisc/real/pdc.c
> cvs update -r1.2 arch/parisc/real/real.h
> 	cvs update -A arch/parisc/real/real.h
> cvs update -r1.2 arch/parisc/real/real_s.S
> 	cvs update -A arch/parisc/real/real_s.S
> cvs update -r1.2 arch/parisc/real/setup.c
> 	cvs update -A arch/parisc/real/setup.c
> cvs update -r1.1 arch/parisc/real/traps.c
> 	cvs update -A arch/parisc/real/traps.c
> cvs update -r1.1 include/asm-parisc/real.h
> 	cvs update -A include/asm-parisc/real.h
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 


-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
