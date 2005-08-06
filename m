From: Matt Taggart <matt@lackof.org>
Subject: Re: [parisc-linux] paer.debian.org crash in ext3_write_inode()
Date: Sat, 06 Aug 2005 11:38:33 -0700
Message-ID: <20050806183834.0C7681AA7DF@cyrix.home.bogus>
References: <1123204638.3628.132.camel@krebs.dannf>
	<20050805195306.GS9703@systemhalted.org>
	<1123274838.9036.57.camel@krebs.dannf>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Carlos O'Donell <carlos@systemhalted.org>,
 parisc-linux@lists.parisc-linux.org
To: dann frazier <dannf@hp.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <1123274838.9036.57.camel@krebs.dannf> 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


dann frazier writes...

> On Fri, 2005-08-05 at 15:53 -0400, Carlos O'Donell wrote:
> > On Thu, Aug 04, 2005 at 07:17:18PM -0600, dann frazier wrote:
> > > fyi, paer.debian.org was reported down.  The GSP's console log
> > > follows.  
> > > 
> > > dannf@paer:~$ uname -a
> > > Linux paer 2.6.8-2-64 #1 Tue Feb 8 05:54:00 EST 2005 parisc64 GNU/Linux
> > 
> > No register dump? That is the most interesting and usefull piece of
> > information :(
> 
> Yeah; we really should be logging the console while its acting up...
> I'll try to set that up.

I can repeatably cause a kernel panic on paer now. The machine is running the 
Debian kernel-image-2.6.8-2-64 version 2.6.8-6 package. When I tried to run 
apt-get upgrade in an unstable chroot I got the following on the console,

=====================================================================
mm/memory.c:368: bad pmd 10555830.
mm/memory.c:110: bad pmd 000ec7f8.
mm/memory.c:110: bad pmd 000df000.
mm/memory.c:110: bad pmd 00000040.
mm/memory.c:110: bad pmd 00000063.
mm/memory.c:110: bad pmd 00000010.
mm/memory.c:110: bad pmd 00000010.
mm/memory.c:110: bad pmd 00200200.
mm/memory.c:110: bad pmd 00000001.
mm/memory.c:110: bad pmd fde77ea0.
kernel BUG at include/asm/mmzone.h:85!
Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000001017b770>] clear_page_tables+0x2b0/0x380
 [<0000000010184194>] exit_mmap+0xf4/0x278
 [<00000000101420f4>] mmput+0x9c/0xd8
 [<0000000010147994>] do_exit+0x174/0x580
 [<0000000010147e48>] do_group_exit+0x50/0x108
 [<000000001015290c>] get_signal_to_deliver+0x314/0x4f0
 [<000000001011e0d4>] do_signal+0x3c/0x2a8
 [<00000000101072c8>] intr_do_signal+0x2c/0x34

Backtrace:
 [<0000000010184194>] exit_mmap+0xf4/0x278
 [<00000000101420f4>] mmput+0x9c/0xd8
 [<0000000010147994>] do_exit+0x174/0x580
 [<0000000010147e48>] do_group_exit+0x50/0x108
 [<000000001015290c>] get_signal_to_deliver+0x314/0x4f0
 [<000000001011e0d4>] do_signal+0x3c/0x2a8
 [<00000000101072c8>] intr_do_signal+0x2c/0x34


Bad Address (null pointer deref?): Code=15 regs=00000000fde74600 
(Addr=c00000790
256929f)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001011100000001111 Not tainted
r00-03  0000000000000000 0000000010555670 000000001017b770 00000000000000ff
r04-07  00000000104e6800 00000000fde78064 fffffff90256929f 0000000000000019
r08-11  00000000fde7a000 0000000010407df0 0000000010376230 0000000010578f50
r12-15  000000001055a100 00000000fde78000 00000000800 0000000000000002
r16-19  00000000ff14ee98 0000000000000003 0000000000000003 00000000000000e5
r20-23  0000000000000001 000000000800000f 00000000210c4327 000000000800000f
r24-27  ffffffffffffffff 0000000000000001 0000000010493fe8 00000000104e6800
r28-31  0000000000000001 00000000fde74980 00000000fde74600 0000000010573e58
sr0-3   0000000000006800 0000000000000000 0000000000000000 0000000000063000
sr4-7   0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 000000001017b61c 000000001017b620
 IIR: 0cc010d3    ISR: 000000003fffff80  IOR: c00000790256929f
 CPU:        0   CR30: 00000000fde74000 CR31: 00000000104ac000
 ORIG_R28: 0000000010144e5c
 IAOQ[0]: clear_page_tables+0x15c/0x380
 IAOQ[1]: clear_page_tables+0x160/0x380
 RP(r2): clear_page_tables+0x2b0/0x380
Kernel panic: Bad Address (null pointer deref?)
=====================================================================

We're running this kernel based on the recommendation of this list that it's 
the most stable, but I'm willing to try other versions if people have 
recommendations. Eventually we'd like whatever fixes this to be put in the 
Debian stable kernel-image package so we can keep using that version and count 
on security updates.

It might be good if someone can try and repeat on another machine, in case the 
problem is something with paer specifically.

Thanks,

--
Matt Taggart
taggart@debian.org


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
