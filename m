From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] BUG 2.6.12-rc3-pa1 PCI mmap panic
Date: Sun, 1 May 2005 18:08:33 -0600
Message-ID: <20050502000833.GE17998@colo.lackof.org>
References: <20050501074901.GA13801@colo.lackof.org>
	<1114975460.4788.27.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1114975460.4788.27.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, May 01, 2005 at 02:24:20PM -0500, James Bottomley wrote:
> pfnnid_map is a map per 1gb (currently what PFNNID_SHIFT defines) of our
> memory range showing which discontig chunk this maps to.  0xff means the
> range maps nowhere.

ok

> Without better debugging, it's hard to say, but I guess that this flash
> tool is actually trying to mmap a region of memory on the PCI card and
> it's tripping over this section of code.

Yes. A copy of the openib_gen2 tree is parked on gsyprf11:/usr/src/ as well.

>   My second order guess would be
> that we don't update the pfnnid_map when we actually declare a card I/O
> range, so the kernel thinks it can map the region OK but we erroneously
> trip this bug.

*nod*. Where should we be telling the VM about MMIO ranges?
We clearly need to be advertising them.

> I'm with Joel on this one:
> Can you reproduce the problem without CONFIG_DISCONTIGMEM?

Yes. I rebuilt the kernel with CONFIG_DISCONTIGMEM=n.
I'm having doubts though that I rebooted the right kernel.
I believe so but post again later if not.

ion:/usr/src/openib_gen2/src/userspace/tvflash# src/tvflash -i
open_hca(0)
kernel BUG at include/asm/mmzone.h:85!
Backtrace:
 [<0000000010113060>] dump_stack+0x18/0x28
 [<00000000101813fc>] remap_pfn_range+0x37c/0x4b8
 [<0000000010241934>] mmap_mem+0x2c/0x40
 [<0000000010187288>] do_mmap_pgoff+0x478/0x858
 [<0000000010114f84>] do_mmap2+0xa4/0x108
 [<0000000010115030>] sys_mmap+0x28/0x38
 [<0000000010107f80>] syscall_exit+0x0/0x14

Kernel panic - not syncing: BUG!
 <0>Rebooting in 5 seconds..


thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
