From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH] [PARISC] Clean up syslog output of
Date: Mon, 23 Jul 2007 16:47:03 -0400 (EDT)
Message-ID: <200707232047.l6NKl4uj001716__20374.3782513358$1416624417$gmane$org@hiauly1.hia.nrc.ca>
References: <200707232221.06720.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 soete.joel@scarlet.be
To: deller@gmx.de (Helge Deller)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200707232221.06720.deller@gmx.de> from "Helge Deller" at Jul 23, 2007 10:21:06 pm
List-ID: <linux-parisc.vger.kernel.org>

> Hi Joel,
> 
> On Sunday 22 July 2007, Joel Soete wrote:
> > Just try your patch against latest 2.6.22-pa1 and it seems that:
> >   		enum bug_trap_type tt;
> > -		tt = report_bug(regs->iaoq[0] & ~3, regs);
> > +		tt = report_bug(instruction_pointer(regs), regs);
> > should be
> > +		tt = report_bug(instruction_pointer(regs));
> 
> Why ?
> In include/linux/bug.h the function report_bug() is defined as:
> 	report_bug(unsigned long bug_addr, struct pt_regs *regs)

In 2.6.22.1, it's defined as:
enum bug_trap_type report_bug(unsigned long bug_addr);

I had to make the same change as Joel.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
