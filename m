From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] fstatat64 and newfstatat syscalls
Date: Sat, 23 Dec 2006 20:40:18 -0700
Message-ID: <20061224034018.GB24131__46644.4992380731$1416624240$gmane$org@colo.lackof.org>
References: <200612230049.41484.deller@gmx.de> <200612230054.34497.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <grundler@lackof.org>
In-Reply-To: <200612230054.34497.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Dec 23, 2006 at 12:54:34AM +0100, Helge Deller wrote:
> On Sat Dec 23 2006, Helge Deller wrote:
> > Hi Grant,
> > 
> > I think we have some wrong assignments with above $TOPIC syscalls.
> > 
> > I found this mail and CVS patch from you:
> > http://lists.parisc-linux.org/pipermail/parisc-linux-cvs/2006-February/036543.html

Yeah - I wasn't that confident in that change.  My main goal was to get the build
working again. I didn't have any way to prove it was correct.

> > http://cvs.parisc-linux.org/linux-2.6/arch/parisc/kernel/syscall_table.S.diff?cvsroot=&r1=1.22&r2=1.23
> > 
> > but currently we have:
> > arch/parisc/kernel/syscall_table.S:		ENTRY_SAME(fstatat64)           /* 280 */
> > while in:
> > include/asm-parisc/unistd.h:			#define __NR_newfstatat         (__NR_Linux + 280)
> 
> I think the right solution is to change current line in unistd.h to this:
> include/asm-parisc/unistd.h:			#define __NR_fstatat64         (__NR_Linux + 280)

Yeah. That looks better to me too.
I suspect I assumed fstatat64 and newfsatat would be equivalent in all contexts.

> The fstatat testcase from LTP passes with then this change as well...

Excellent - thanks for fixing!

grant

> 
> Helge
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
