Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.umr.edu (mrelay.cc.umr.edu [131.151.1.89])
	by dsl2.external.hp.com (Postfix) with ESMTP id A75284978
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Oct 2001 15:17:49 -0600 (MDT)
Message-ID: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D865@umr-mail03.cc.umr.edu>
From: "Neulinger, Nathan" <nneul@umr.edu>
To: 
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] HP-UX binary compatibility
Date: Thu, 4 Oct 2001 16:16:52 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Got a question of how best to do something - flexlm does the lanscan style
open of /dev/lan, /dev/lan0...15 to try and figure out the local hardware
address of the machine:

24240: open("/dev/lan", O_RDONLY) = -1 ENOENT (No such file or directory)
24240: open("/dev/lan", O_RDONLY) = -1 ENOENT (No such file or directory)
24240: open("/dev/lan0", O_RDONLY) = 9
24240: ioctl(9 [/dev/lan0], NETSTAT, 0x7b03bc28) = 0
24240: sigprocmask(2, 0x7b038a80, 0x7b03cf28) = 0
24240: sigprocmask(2, 0x7b03cf28, 0) = 0
24240: close(9 [/dev/lan0]) = 0
24240: time(0) = 0x3bbcd084
24240: write(1 [fluent.log], 0x7b028000, 66) = 66

What do y'all think is the best way of dealing with this? I could add the
wrapper that traps the open system call, and then special case handle an
open of /dev/lan*, and somehow keep track of that file descriptor in a
global var of some sort, and then test for that fd in a wrapped ioctl
handler? 

Or would there be some nicer way of dealing with this?

Then again, I suppose I could also just return legit info on any NETSTAT
ioctl on any open fd and just have the open of /dev/lan really open
/dev/null. That might be the simplest way to get it working. 

Of course, at the moment, flexlm isn't working for the uname case either -
interestingly, lmstat and lmdiag say it's working fine, but the actual app
that tries to check out a license gets a "internal license error", so I'm
missing something somewhere still, just got to find it. Sure would be nice
if strace worked on hpux executables or the ptrace call worked. 

-- Nathan

> -----Original Message-----
> From: Neulinger, Nathan 
> Sent: Thursday, October 04, 2001 3:57 PM
> To: 'Matthew Wilcox'
> Cc: parisc-linux@lists.parisc-linux.org
> Subject: RE: [parisc-linux] HP-UX binary compatibility
> 
> 
> Hey, thanks. That's exactly what I needed... Got it working now. 
> 
> I've added a bunch more direct syscall calls (for the most 
> part, call behavior looked close enough or same in man pages) 
> and some stub wrappers. statfs seems semi-functional as 
> moment, but not quite correct since a few fields are returned 
> as garbage (just calling real one at moment and ignoring 
> extra hp fields).
> 
> I'll send a patch tomorrow maybe to add some of these. i'm 
> sure some leaves a lot to be desired, but it's at least a bit 
> more functional for some stuff I've tested. 
> 
> -- Nathan
> 
> > -----Original Message-----
> > From: Matthew Wilcox [mailto:willy@debian.org]
> > Sent: Thursday, October 04, 2001 3:10 PM
> > To: Neulinger, Nathan
> > Cc: parisc-linux@lists.parisc-linux.org
> > Subject: Re: [parisc-linux] HP-UX binary compatibility
> > 
> > 
> > On Thu, Oct 04, 2001 at 12:58:18PM -0500, Neulinger, Nathan wrote:
> > > int hpux_sysfs(int opcode, unsigned long arg1, unsigned long arg2)
> > > {
> > > /*Unimplemented HP-UX syscall emulation. Syscall #334 (sysfs)
> > >   Args: 1 80057bf4 0 400179f0 0 0 0 */
> > > 
> > >         if ( opcode == 1 ) { /* GETFSIND */
> > >                 printk(KERN_DEBUG "hpux_sysfs called with 
> > '%s'", (char
> > > *)arg1);
> > >         }
> > > 
> > >         printk(KERN_DEBUG "hpux_sysfs called with opcode = 
> > %d\n", opcode);
> > > }
> > 
> > You can't do that.  `arg1' points to a user address, not a kernel
> > address.  You need to use things like strlen_user and 
> > copy_from_user --
> > see include/asm-parisc/uaccess.h.
> > 
> > -- 
> > Revolutions do not require corporate support.
> > 
> 
