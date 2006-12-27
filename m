From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] fstatat64 and newfstatat syscalls
Date: Wed, 27 Dec 2006 23:28:18 +0100
Message-ID: <200612272328.18484.deller__8825.29209270633$1416624241$gmane$org@gmx.de>
References: <200612230049.41484.deller@gmx.de>
	<200612230054.34497.deller@gmx.de>
	<20061224034018.GB24131@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061224034018.GB24131@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun Dec 24 2006, Grant Grundler wrote:
> On Sat, Dec 23, 2006 at 12:54:34AM +0100, Helge Deller wrote:
> > On Sat Dec 23 2006, Helge Deller wrote:
> > > Hi Grant,
> > > 
> > > I think we have some wrong assignments with above $TOPIC syscalls.
> > > 
> > > I found this mail and CVS patch from you:
> > > http://lists.parisc-linux.org/pipermail/parisc-linux-cvs/2006-February/036543.html
> 
> Yeah - I wasn't that confident in that change.  My main goal was to get the build
> working again. I didn't have any way to prove it was correct.
> 
> > > http://cvs.parisc-linux.org/linux-2.6/arch/parisc/kernel/syscall_table.S.diff?cvsroot=&r1=1.22&r2=1.23
> > > 
> > > but currently we have:
> > > arch/parisc/kernel/syscall_table.S:		ENTRY_SAME(fstatat64)           /* 280 */
> > > while in:
> > > include/asm-parisc/unistd.h:			#define __NR_newfstatat         (__NR_Linux + 280)
> > 
> > I think the right solution is to change current line in unistd.h to this:
> > include/asm-parisc/unistd.h:			#define __NR_fstatat64         (__NR_Linux + 280)
> 
> Yeah. That looks better to me too.
> I suspect I assumed fstatat64 and newfsatat would be equivalent in all contexts.
> 
> > The fstatat testcase from LTP passes with then this change as well...
> 
> Excellent - thanks for fixing!

I just committed this change...

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
