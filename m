From: Max Grabert <parisc@gmail.com>
Subject: Re: [parisc-linux] a b180 panic with 2.6.11-rc3-pa3
Date: Mon, 14 Feb 2005 22:13:59 +0000
Message-ID: <e6eae029050214141362a7d859@mail.gmail.com>
References: <42075CE800002E4E@mail-6-bnl.tiscali.it>
Reply-To: Max Grabert <parisc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: List Parisc <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42075CE800002E4E@mail-6-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, 14 Feb 2005 11:30:43 +0000, Joel Soete <soete.joel@tiscali.be> wrote:
> Hi all,
> 
> Don't know if somebody else also emcountered such panic:
> Backtrace:

> [<101bb588>] journal_add_journal_head+0xdc/0x13c
> [<101b4dd8>] journal_dirty_data+0x64/0x1b0
> [<101a6be4>] ext3_journal_dirty_data+0x1c/0x60
> [<101a69a8>] walk_page_buffers+0xe0/0xf0
> [<101a72b8>] ext3_ordered_writepage+0x168/0x1fc
> [<1018d770>] mpage_writepages+0x28c/0x3a0
> [<1018bae4>] __sync_single_inode+0x5c/0x278
> [<1018bd68>] __writeback_single_inode+0x68/0x168
> [<1018c034>] sync_sb_inodes+0x1cc/0x310
> [<1018c1e8>] writeback_inodes+0x70/0xd4
> [<10149088>] background_writeout+0xb4/0x10c
> [<10149e40>] __pdflush+0x138/0x204
> [<10149f2c>] pdflush+0x20/0x2c
> [<1013c564>] kthread+0xdc/0xe4
> [<1010ac5c>] ret_from_kernel_thread+0x1c/0x24
>
> [...]
> 
> IASQ: 00000000 00000000 IAOQ: 10201f1c 10201f20
> IIR: 0ed91222    ISR: 00000000  IOR: 20702352
> CPU:        0   CR30: 17c84000 CR31: 103d0000
> ORIG_R28: 17c84980
> IAOQ[0]: memset+0x24/0xa8
> IAOQ[1]: memset+0x28/0xa8
> RP(r2): journal_add_journal_head+0xdc/0x13c
> Kernel panic - not syncing: Kernel Fault
> 
> Here on a b180 running 2.6.11-rc3-pa3 (while the system should be idle)

Long time ago I have seen a couple of those. I can't remember what
exact kernel version(s) it was, but it happened with the earlier 2.6
kernels.
Pretty much the same output (I think I once posted it on the mailing
list), but I only got this when I tried out some graphics card (ATI,
Voodoo2 or Matrox?) and shortly after xdm started (and not every
time). I think 64bit kernels triggered it more easily.

But I haven't gotten one of those lately (at least not with 2.6.10-rc1
and later, with Matrox graphics card).

> Any idea about known ext3 pb?

Good question. I have a different problem than the one above: In very
rare occations, when transferring very big files onto a USB-hdd
(ext3), the files are being silently corrupted (no kernel log
messages). But I don't know whether that problem is related to ext3 or
usb-storage or a faulty h/w.

Back to your problem: I don't know/think that there are any severe
problems with ext3, at least I was using it on PA for a long time and
it worked quite well. But there is always the possibility that there
are some hidden bugs that are triggered in rare situations however ...


Greetings,
  Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
