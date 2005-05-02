From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] BUG 2.6.12-rc3-pa1 PCI mmap panic
Date: Sun, 01 May 2005 19:31:37 -0500
Message-ID: <1114993898.4788.47.camel@mulgrave>
References: <20050501074901.GA13801@colo.lackof.org>
	<1114975460.4788.27.camel@mulgrave>
	<20050502000833.GE17998@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050502000833.GE17998@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2005-05-01 at 18:08 -0600, Grant Grundler wrote:
> On Sun, May 01, 2005 at 02:24:20PM -0500, James Bottomley wrote:
> >   My second order guess would be
> > that we don't update the pfnnid_map when we actually declare a card I/O
> > range, so the kernel thinks it can map the region OK but we erroneously
> > trip this bug.
> 
> *nod*. Where should we be telling the VM about MMIO ranges?
> We clearly need to be advertising them.

Is this a 64 bit mmio region?  Our pfn_is_io heuristics are a bit simple
(i.e. top F only set).

> > I'm with Joel on this one:
> > Can you reproduce the problem without CONFIG_DISCONTIGMEM?
> 
> Yes. I rebuilt the kernel with CONFIG_DISCONTIGMEM=n.
> I'm having doubts though that I rebooted the right kernel.
> I believe so but post again later if not.
> 
> ion:/usr/src/openib_gen2/src/userspace/tvflash# src/tvflash -i
> open_hca(0)
> kernel BUG at include/asm/mmzone.h:85!
> Backtrace:
>  [<0000000010113060>] dump_stack+0x18/0x28
>  [<00000000101813fc>] remap_pfn_range+0x37c/0x4b8
>  [<0000000010241934>] mmap_mem+0x2c/0x40
>  [<0000000010187288>] do_mmap_pgoff+0x478/0x858
>  [<0000000010114f84>] do_mmap2+0xa4/0x108
>  [<0000000010115030>] sys_mmap+0x28/0x38
>  [<0000000010107f80>] syscall_exit+0x0/0x14

Yes, wrong kernel.  That bug physically cannot occur with
CONFIG_DISCONTIGMEM=n.  What I'm interested in there is if the tool
actually works.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
