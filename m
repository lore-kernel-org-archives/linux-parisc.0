From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Status of 2.6.22-rc3 ?
Date: Sun, 27 May 2007 22:17:33 +0200
Message-ID: <200705272217.33774.deller__27225.2844101333$1416624373$gmane$org@gmx.de>
References: <200705271438.57394.deller@gmx.de>
	<20070527200207.GD28455@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070527200207.GD28455@fattire.cabal.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sunday 27 May 2007, Kyle McMartin wrote:
> On Sun, May 27, 2007 at 02:38:57PM +0200, Helge Deller wrote:
> > Synthesizing the initial hotplug events...done.
> > Waiting for /dev to be fully populated...<2>Backtrace:
> >  [<1011326c>] unwind_frame_regs+0x48/0x220
> >  [<10113578>] unwind_once+0x10/0x48
> >  [<1011284c>] get_wchan+0x2c/0x68
> >  [<101b9308>] do_task_stat+0x24c/0x500
> >  [<101b4f34>] proc_info_read+0x88/0x108
> >  [<10179db0>] vfs_read+0x8c/0x138
> >  [<1017a10c>] sys_read+0x5c/0xa4
> >  [<1010c080>] syscall_exit+0x0/0x28
> > BUG: spinlock recursion on CPU#0, udevd/560
> >  lock: 1056e08c, .magic: dead4ead, .owner: udevd/560, .owner_cpu: 0
> > Backtrace:
> >  [<1026c5d0>] _raw_spin_lock+0x50/0xa4
> >  [<101076cc>] parisc_terminate+0x58/0xe8
> >  [<10107cbc>] handle_interruption+0x560/0x58c
> >  [<1010b080>] intr_check_sig+0x0/0x34
> > BUG: spinlock lockup on CPU#0, udevd/560, 1056e08c
> 
> What compiler version did you use to build?

hppa-linux-gcc (GCC) 3.3.4 (Debian 1:3.3.4-11)
(cross-compiling from i386 -> parisc 32bit)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
