From: Erik Heckers <erik.heckers@web.de>
Subject: [parisc-linux] Re: Kernel panic while mounting a CD-ROM drive
Date: Fri, 17 Jun 2005 18:05:38 +0200
Message-ID: <1464443473__42670.0441436425$1416623805$gmane$org@web.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
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


Hello!

The same happens on my C3000 using the prebuild kernels from parisc-linux.org and
a IDE cdrom drive.
[but there is some progress as my USB keyboard works again so I can use the local monitor for login].
I think the last kernel I tested was version 2.6.12-rc5-pa3

What 'worries' me is that I can see a message like 'module ide_cd missing' when booting.
So far I don't know if that message indicates some error in the kernel (build) or if my configuration tells
the kernel to load it 'dynamically' afterwards (found nothing in /etc/...)

BTW: When I use a serial cable and connect it a PC running minicom I get normal console output, but
suddenly (during hardware detection if I remember right) it starts to beep a lot  and I get only
garbage on the screen. After that 'dataquake' is over it works again ...

When I have some time this weekend to test the newest kernel I will try to log the boot message and kernel
panic again - the last time it was somehow missing from my minicom logfile ...)

Erik.

"J. L. Lee" <jllee@singnet.com.sg> schrieb am 17.06.05 17:27:08:
>  Hi,
> 
>  I set up my B2000 (with PCI Matrox Millennum II card) to run on kernel 2.6.11-rc6-pa1 a few days ago and was able to mount the CD-ROM drive and used it on several occassions. However it kept on causing kernel panic and froze the B2000 whenever I tried to mount the CD-ROM drive since today. 
> 
>  The difference then and now (since I last used the CD-ROM drive) is that I have installed successfully a X Windows package. Could this be the reason? I have tried both init level 2 & 3 but this did not make a difference. Any idea what went wrong?
> 
>  (Please read pps below for the kernel panic messages.)
> 
>  Rgds,
>  Lee
> 
>  ps. Last few lines of the start-up messages before login prompt showing what components of X Windows is running:
> 
> Initializing random number generator...done.
>  Setting up X server socket directory /tmp/.X11-unix...done.
>  Setting up ICE socket directory /tmp/.ICE-unix...done.
>  INIT: Entering runlevel: 3
>  Starting system log daemon: syslogd.
>  Starting kernel log daemon: klogd.
>  Starting portmap daemon: portmap.
>  Starting internet superserver: inetd.
>  Setting up X font server socket directory /tmp/.font-unix...done.
>  Starting X font server: xfs.
>  Starting X-TT font server: xfs-xtt.
>  Starting Xprint servers: Xprt.
>  Starting file alteration monitor: FAM.
>  Starting periodic command scheduler: cron.
>  Not starting WINGs display manager (wdm); it is not the default display manager.
>  Not starting X display manager (xdm); it is not the default display manager.
> 
>  Debian GNU/Linux 3.1 DebianHPPA.example.com ttyS0
> 
>  DebianHPPA.example.com login:
> 
>  
>  pps. Kernel panic messages immediately after I issued "mount" command:
> 
>  mount /dev/hda /media/cdrom0
>  Backtrace:
> 
>   [<10158408>] __blk_queue_bounce+0x1fc/0x294
> 
>   [<10278774>] __make_request+0x74/0x4e8
> 
>   [<10279050>] generic_make_request+0x1a8/0x26c
> 
>   [<10279184>] submit_bio+0x70/0x120
> 
>   [<10171a10>] submit_bh+0x148/0x1ac
> 
>   [<101705e8>] block_read_full_page+0x220/0x338
> 
>   [<1015125c>] read_pages+0x16c/0x1d8
> 
>   [<101513d4>] __do_page_cache_readahead+0x10c/0x190
> 
>   [<1015160c>] blockable_page_cache_readahead+0x68/0xe0
> 
>   [<101518c4>] page_cache_readahead+0x18c/0x1ac
> 
>   [<1014a050>] do_generic_mapping_read+0x6c0/0x6c8
> 
>   [<1014a374>] __generic_file_aio_read+0x1b0/0x1c8
> 
>   [<1014a494>] generic_file_read+0x90/0xb8
> 
>   [<1016c210>] vfs_read+0xe0/0x158
> 
>   [<1016c52c>] sys_read+0x58/0xa8
> 
>   [<1010d12c>] syscall_exit+0x0/0x14
> 
>  
> 
>  Kernel Fault: Code=26 regs=1ba94a40 (Addr=0000000c)
> 
>  
>       YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> 
>  PSW: 00000000000001101110111100001111 Not tainted
> 
>  r00-03  00000000 103a7010 10158408 00011210
> 
>  r04-07  00011200 00000000 00000000 1f44d140
> 
>  r08-11  1ba94898 00000000 1f76c370 1049f010
> 
>  r12-15  00000000 10000000 1049f010 10000000
> 
>  r16-19  1049f010 10175040 1fff2420 1013ed60
> 
>  r20-23  1ba949d4 ffffffaf 1ba949d4 00000000
> 
>  r24-27  00000000 00000010 00011200 1038d010
> 
>  r28-31  1f44d140 00052045 1ba94a40 1014d1ac
> 
>  sr0-3   00000000 00000000 00000000 00000028
> 
>  sr4-7   00000000 00000000 00000000 00000000
> 
>  
>  IASQ: 00000000 00000000 IAOQ: 1014d19c 1014d1a0
> 
>   IIR: 0cb81099    ISR: 00000000  IOR: 0000000c
> 
>   CPU:        0   CR30: 1ba94000 CR31: 10428000
> 
>   ORIG_R28: ea3dad4f
> 
>   IAOQ[0]: mempool_alloc+0x9c/0x144
> 
>   IAOQ[1]: mempool_alloc+0xa0/0x144
> 
>   RP(r2): __blk_queue_bounce+0x1fc/0x294
> 
>  Kernel panic - not syncing: Kernel Fault
> 
>   
>  
>  


__________________________________________________________
Mit WEB.DE FreePhone mit hoechster Qualitaet ab 0 Ct./Min.
weltweit telefonieren! http://freephone.web.de/?mc=021201

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
