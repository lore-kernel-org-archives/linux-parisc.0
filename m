Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.umr.edu (mrelay.cc.umr.edu [131.151.1.89])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6A10B482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Oct 2001 14:57:42 -0600 (MDT)
Message-ID: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D864@umr-mail03.cc.umr.edu>
From: "Neulinger, Nathan" <nneul@umr.edu>
To: "'Matthew Wilcox'" <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] HP-UX binary compatibility
Date: Thu, 4 Oct 2001 15:56:41 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Hey, thanks. That's exactly what I needed... Got it working now. 

I've added a bunch more direct syscall calls (for the most part, call
behavior looked close enough or same in man pages) and some stub wrappers.
statfs seems semi-functional as moment, but not quite correct since a few
fields are returned as garbage (just calling real one at moment and ignoring
extra hp fields).

I'll send a patch tomorrow maybe to add some of these. i'm sure some leaves
a lot to be desired, but it's at least a bit more functional for some stuff
I've tested. 

-- Nathan

> -----Original Message-----
> From: Matthew Wilcox [mailto:willy@debian.org]
> Sent: Thursday, October 04, 2001 3:10 PM
> To: Neulinger, Nathan
> Cc: parisc-linux@lists.parisc-linux.org
> Subject: Re: [parisc-linux] HP-UX binary compatibility
> 
> 
> On Thu, Oct 04, 2001 at 12:58:18PM -0500, Neulinger, Nathan wrote:
> > int hpux_sysfs(int opcode, unsigned long arg1, unsigned long arg2)
> > {
> > /*Unimplemented HP-UX syscall emulation. Syscall #334 (sysfs)
> >   Args: 1 80057bf4 0 400179f0 0 0 0 */
> > 
> >         if ( opcode == 1 ) { /* GETFSIND */
> >                 printk(KERN_DEBUG "hpux_sysfs called with 
> '%s'", (char
> > *)arg1);
> >         }
> > 
> >         printk(KERN_DEBUG "hpux_sysfs called with opcode = 
> %d\n", opcode);
> > }
> 
> You can't do that.  `arg1' points to a user address, not a kernel
> address.  You need to use things like strlen_user and 
> copy_from_user --
> see include/asm-parisc/uaccess.h.
> 
> -- 
> Revolutions do not require corporate support.
> 
