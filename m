Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id EF99A4830
	for <parisc-linux@lists.parisc-linux.org>; Sat,  6 Oct 2001 01:59:20 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: "Neulinger, Nathan" <nneul@umr.edu>,
	"'John Marvin'" <jsm@udlkern.fc.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP-UX binary compatibility
Date: Sat, 6 Oct 2001 09:58:51 +0200
Cc: "Uetrecht, Daniel J." <uetrecht@umr.edu>
References: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D869@umr-mail03.cc.umr.edu>
In-Reply-To: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D869@umr-mail03.cc.umr.edu>
MIME-Version: 1.0
Message-Id: <20011006075920.EF99A4830@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Hi Nathan,

I just verified and the /proc/cpuinfo entry was removed in the meantime.
But with the following code-fragment you will get the right number:

#include <asm/processor.h>
printk("ID: %ld\n", boot_cpu_data.pdc.model.sw_id);

This value is initialized during boot-up in setup.c and comes from the 
PDC_MODEL [pdc_model_info()] syscall.

Greetings,
Helge

On Friday 05 October 2001 17:14, Neulinger, Nathan wrote:
> Hmm... Doesn't appear to be in there. At the moment, I actually could care
> less about the real host id, but if the proc entry was overwritable, that
> would solve my needs perfectly. At the moment, in my local kernel source, I
> just wired the appropriate return values in the system call wrapper.
>
> -- Nathan
>
> > -----Original Message-----
> > From: Helge Deller [mailto:helge.deller@sap.com]
> > Sent: Friday, October 05, 2001 3:18 AM
> > To: Neulinger, Nathan; 'John Marvin';
> > parisc-linux@lists.parisc-linux.org
> > Cc: Uetrecht, Daniel J.
> > Subject: Re: [parisc-linux] HP-UX binary compatibility
> >
> >
> > Hi Nathan,
> >
> > On Thursday 04 October 2001 17:07, Neulinger, Nathan wrote:
> > > troot-halley(11)> uname -a
> > > HP-UX halley B.10.20 A 9000/735 2002000004 two-user license
> > > troot-halley(12)> uname -i
> > > 2002000004
> > >
> > > It's that 2002000004 that I need.
> >
> > I currently don't have access to a parisc-linux machine, but out of
> > my head I think you may get that number from the /proc/cpuinfo file
> > (maybe it is displayed there in hex) and may use it from the variable
> > behind this output for your syscall wrapper.
> >
> > Greetings,
> > Helge
