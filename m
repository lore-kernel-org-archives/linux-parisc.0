From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] a b180 panic with 2.6.11-rc3-pa3
Date: Tue, 15 Feb 2005 10:46:50 +0100
Message-ID: <4209EEB900002402@mail-2-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: List Parisc <parisc-linux@lists.parisc-linux.org>
To: "Max Grabert" <parisc@gmail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Max,

>
> On Mon, 14 Feb 2005 11:30:43 +0000, Joel Soete <soete.joel@tiscali.be>
wrote:
> > Hi all,
> >
> > Don't know if somebody else also emcountered such panic:
> > Backtrace:
>
> > [<101bb588>] journal_add_journal_head+0xdc/0x13c
> > [<101b4dd8>] journal_dirty_data+0x64/0x1b0
> > [<101a6be4>] ext3_journal_dirty_data+0x1c/0x60
> > [<101a69a8>] walk_page_buffers+0xe0/0xf0
> > [<101a72b8>] ext3_ordered_writepage+0x168/0x1fc
> > [<1018d770>] mpage_writepages+0x28c/0x3a0
> > [<1018bae4>] __sync_single_inode+0x5c/0x278
> > [<1018bd68>] __writeback_single_inode+0x68/0x168
> > [<1018c034>] sync_sb_inodes+0x1cc/0x310
> > [<1018c1e8>] writeback_inodes+0x70/0xd4
> > [<10149088>] background_writeout+0xb4/0x10c
> > [<10149e40>] __pdflush+0x138/0x204
> > [<10149f2c>] pdflush+0x20/0x2c
> > [<1013c564>] kthread+0xdc/0xe4
> > [<1010ac5c>] ret_from_kernel_thread+0x1c/0x24
> >
> > [...]
> >
> > IASQ: 00000000 00000000 IAOQ: 10201f1c 10201f20
> > IIR: 0ed91222    ISR: 00000000  IOR: 20702352
> > CPU:        0   CR30: 17c84000 CR31: 103d0000
> > ORIG_R28: 17c84980
> > IAOQ[0]: memset+0x24/0xa8
> > IAOQ[1]: memset+0x28/0xa8
> > RP(r2): journal_add_journal_head+0xdc/0x13c
> > Kernel panic - not syncing: Kernel Fault
> >
> > Here on a b180 running 2.6.11-rc3-pa3 (while the system should be idl=
e)
>
mmm today on this same system with rc4-pa1 now:
Backtrace:
 [<101bb644>] journal_add_journal_head+0xdc/0x13c
 [<101b4e94>] journal_dirty_data+0x64/0x1b0
 [<101a6ca0>] ext3_journal_dirty_data+0x1c/0x60
 [<101a6a64>] walk_page_buffers+0xe0/0xf0
 [<101a6ddc>] ext3_ordered_commit_write+0x68/0x144
 [<10144db8>] generic_file_buffered_write+0x23c/0x68c
 [<10145474>] __generic_file_aio_write_nolock+0x26c/0x450
 [<101458c0>] generic_file_aio_write+0x88/0x164
 [<101a3858>] ext3_file_write+0x34/0xd0
 [<101658b4>] do_sync_write+0xb4/0xf4
 [<101659d4>] vfs_write+0xe0/0x158
 [<10165b50>] sys_write+0x5c/0xa8
 [<1010c120>] syscall_exit+0x0/0x14
...
IASQ: 00000000 00000000 IAOQ: 10201fe0 10201fe4
 IIR: 0ed91222    ISR: 00000000  IOR: d2b304d2
 CPU:        0   CR30: 108e8000 CR31: 103d0000
 ORIG_R28: 108e8900
 IAOQ[0]: memset+0x24/0xa4
 IAOQ[1]: memset+0x28/0xa4
 RP(r2): journal_add_journal_head+0xdc/0x13c
Kernel panic - not syncing: Kernel Fault

This time while 'apt-get dist-update' on a chroot disk :-(

I tried to reboot but pdc didn't find any more boot devices:
...
Main Menu: Enter command > sea
...
   Path Number        Device Path              Device Type
   -----------        -----------------        -----------
Error detected on single-ended FWSCSI interface.
No devices found.
...

even after a reset.
I have to cycle power off/on the external disk (a fw scsi disk connected
to the fw ctrlr) to be able to reboot then complete the apt update withou=
t
any pb??

...
> Pretty much the same output (I think I once posted it on the mailing
> list), but I only got this when I tried out some graphics card (ATI,
> Voodoo2 or Matrox?) and shortly after xdm started (and not every
> time). I think 64bit kernels triggered it more easily.
>
Here not additional pci card
...
>
> > Any idea about known ext3 pb?
>
> Good question. I have a different problem than the one above: In very
> rare occations, when transferring very big files onto a USB-hdd
> (ext3), the files are being silently corrupted (no kernel log
> messages).
mmm no such device available here to make test (sorry) (on a b2k obviousl=
y
;-) )

> But I don't know whether that problem is related to ext3 or
> usb-storage or a faulty h/w.
>
Considering the strange status in which was the external disk, it should
be possible to be some h/w failure demonstration occuring from time to ti=
me??

> Back to your problem: I don't know/think that there are any severe
> problems with ext3, at least I was using it on PA for a long time and
> it worked quite well.
The same for me ;-)

> But there is always the possibility that there
> are some hidden bugs that are triggered in rare situations however ...
>
Thanks for feedback,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
