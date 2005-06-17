From: "J. L. Lee" <jllee@singnet.com.sg>
Subject: Kernel panic while mounting a CD-ROM drive
Date: Fri, 17 Jun 2005 23:23:33 +0800
Message-ID: <5.1.1.6.1.20050617230817.02aae7d0__13211.7358888083$1416623804$gmane$org@pop.singnet.com.sg>
Mime-Version: 1.0
Content-Type: multipart/alternative;
  boundary="=====================_17015517==.ALT"
To: <debian-hppa@lists.debian.org>,
 <parisc-linux@lists.parisc-linux.org>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
Resent-Message-ID: <bY5xuB.A.KhC.xuusCB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

--=====================_17015517==.ALT
Content-Type: text/plain; charset="us-ascii"; format=flowed

Hi,

I set up my B2000 (with PCI Matrox Millennum II card) to run on kernel 
2.6.11-rc6-pa1 a few days ago and was able to mount the CD-ROM drive and 
used it on several occassions. However it kept on causing kernel panic and 
froze the B2000 whenever I tried to mount the CD-ROM drive since today.

The difference then and now (since I last used the CD-ROM drive) is that I 
have installed successfully a X Windows package. Could this be the reason? 
I have tried both init level 2 & 3 but this did not make a difference. Any 
idea what went wrong?

(Please read pps below for the kernel panic messages.)

Rgds,
Lee

ps. Last few lines of the start-up messages before login prompt showing 
what components of X Windows is running:

Initializing random number generator...done.
Setting up X server socket directory /tmp/.X11-unix...done.
Setting up ICE socket directory /tmp/.ICE-unix...done.
INIT: Entering runlevel: 3
Starting system log daemon: syslogd.
Starting kernel log daemon: klogd.
Starting portmap daemon: portmap.
Starting internet superserver: inetd.
Setting up X font server socket directory /tmp/.font-unix...done.
Starting X font server: xfs.
Starting X-TT font server: xfs-xtt.
Starting Xprint servers: Xprt.
Starting file alteration monitor: FAM.
Starting periodic command scheduler: cron.
Not starting WINGs display manager (wdm); it is not the default display 
manager.
Not starting X display manager (xdm); it is not the default display manager.

Debian GNU/Linux 3.1 DebianHPPA.example.com ttyS0

DebianHPPA.example.com login:


pps. Kernel panic messages immediately after I issued "mount" command:

mount /dev/hda /media/cdrom0
Backtrace:

  [<10158408>] __blk_queue_bounce+0x1fc/0x294

  [<10278774>] __make_request+0x74/0x4e8

  [<10279050>] generic_make_request+0x1a8/0x26c

  [<10279184>] submit_bio+0x70/0x120

  [<10171a10>] submit_bh+0x148/0x1ac

  [<101705e8>] block_read_full_page+0x220/0x338

  [<1015125c>] read_pages+0x16c/0x1d8

  [<101513d4>] __do_page_cache_readahead+0x10c/0x190

  [<1015160c>] blockable_page_cache_readahead+0x68/0xe0

  [<101518c4>] page_cache_readahead+0x18c/0x1ac

  [<1014a050>] do_generic_mapping_read+0x6c0/0x6c8

  [<1014a374>] __generic_file_aio_read+0x1b0/0x1c8

  [<1014a494>] generic_file_read+0x90/0xb8

  [<1016c210>] vfs_read+0xe0/0x158

  [<1016c52c>] sys_read+0x58/0xa8

  [<1010d12c>] syscall_exit+0x0/0x14



Kernel Fault: Code=26 regs=1ba94a40 (Addr=0000000c)


      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI

PSW: 00000000000001101110111100001111 Not tainted

r00-03  00000000 103a7010 10158408 00011210

r04-07  00011200 00000000 00000000 1f44d140

r08-11  1ba94898 00000000 1f76c370 1049f010

r12-15  00000000 10000000 1049f010 10000000

r16-19  1049f010 10175040 1fff2420 1013ed60

r20-23  1ba949d4 ffffffaf 1ba949d4 00000000

r24-27  00000000 00000010 00011200 1038d010

r28-31  1f44d140 00052045 1ba94a40 1014d1ac

sr0-3   00000000 00000000 00000000 00000028

sr4-7   00000000 00000000 00000000 00000000


IASQ: 00000000 00000000 IAOQ: 1014d19c 1014d1a0

  IIR: 0cb81099    ISR: 00000000  IOR: 0000000c

  CPU:        0   CR30: 1ba94000 CR31: 10428000

  ORIG_R28: ea3dad4f

  IAOQ[0]: mempool_alloc+0x9c/0x144

  IAOQ[1]: mempool_alloc+0xa0/0x144

  RP(r2): __blk_queue_bounce+0x1fc/0x294

Kernel panic - not syncing: Kernel Fault




--=====================_17015517==.ALT
Content-Type: text/html; charset="us-ascii"

<html>
Hi,<br><br>
I set up my B2000 (with PCI Matrox Millennum II card) to run on kernel
2.6.11-rc6-pa1 a few days ago and was able to mount the CD-ROM drive and
used it on several occassions. However it kept on causing kernel panic
and froze the B2000 whenever I tried to mount the CD-ROM drive since
today. <br><br>
The difference then and now (since I last used the CD-ROM drive) is that
I have installed successfully a X Windows package. Could this be the
reason? I have tried both init level 2 &amp; 3 but this did not make a
difference. Any idea what went wrong?<br><br>
(Please read pps below for the kernel panic messages.)<br><br>
Rgds,<br>
Lee<br><br>
ps. Last few lines of the start-up messages before login prompt showing
what components of X Windows is running:<br><br>
Initializing random number generator...done.<br>
Setting up X server socket directory /tmp/.X11-unix...done.<br>
Setting up ICE socket directory /tmp/.ICE-unix...done.<br>
INIT: Entering runlevel: 3<br>
Starting system log daemon: syslogd.<br>
Starting kernel log daemon: klogd.<br>
Starting portmap daemon: portmap.<br>
Starting internet superserver: inetd.<br>
Setting up X font server socket directory /tmp/.font-unix...done.<br>
Starting X font server: xfs.<br>
Starting X-TT font server: xfs-xtt.<br>
Starting Xprint servers: Xprt.<br>
Starting file alteration monitor: FAM.<br>
Starting periodic command scheduler: cron.<br>
Not starting WINGs display manager (wdm); it is not the default display
manager.<br>
Not starting X display manager (xdm); it is not the default display
manager.<br><br>
Debian GNU/Linux 3.1 DebianHPPA.example.com ttyS0<br><br>
DebianHPPA.example.com login:<br><br>
<br>
pps. Kernel panic messages immediately after I issued &quot;mount&quot;
command:<br><br>
<font face="Courier New, Courier">mount /dev/hda /media/cdrom0<br>
Backtrace:<br><br>
&nbsp;[&lt;10158408&gt;] __blk_queue_bounce+0x1fc/0x294<br><br>
&nbsp;[&lt;10278774&gt;] __make_request+0x74/0x4e8<br><br>
&nbsp;[&lt;10279050&gt;] generic_make_request+0x1a8/0x26c<br><br>
&nbsp;[&lt;10279184&gt;] submit_bio+0x70/0x120<br><br>
&nbsp;[&lt;10171a10&gt;] submit_bh+0x148/0x1ac<br><br>
&nbsp;[&lt;101705e8&gt;] block_read_full_page+0x220/0x338<br><br>
&nbsp;[&lt;1015125c&gt;] read_pages+0x16c/0x1d8<br><br>
&nbsp;[&lt;101513d4&gt;] __do_page_cache_readahead+0x10c/0x190<br><br>
&nbsp;[&lt;1015160c&gt;]
blockable_page_cache_readahead+0x68/0xe0<br><br>
&nbsp;[&lt;101518c4&gt;] page_cache_readahead+0x18c/0x1ac<br><br>
&nbsp;[&lt;1014a050&gt;] do_generic_mapping_read+0x6c0/0x6c8<br><br>
&nbsp;[&lt;1014a374&gt;] __generic_file_aio_read+0x1b0/0x1c8<br><br>
&nbsp;[&lt;1014a494&gt;] generic_file_read+0x90/0xb8<br><br>
&nbsp;[&lt;1016c210&gt;] vfs_read+0xe0/0x158<br><br>
&nbsp;[&lt;1016c52c&gt;] sys_read+0x58/0xa8<br><br>
&nbsp;[&lt;1010d12c&gt;] syscall_exit+0x0/0x14<br><br>
<br><br>
Kernel Fault: Code=26 regs=1ba94a40 (Addr=0000000c)<br><br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI<br><br>
PSW: 00000000000001101110111100001111 Not tainted<br><br>
r00-03&nbsp; 00000000 103a7010 10158408 00011210<br><br>
r04-07&nbsp; 00011200 00000000 00000000 1f44d140<br><br>
r08-11&nbsp; 1ba94898 00000000 1f76c370 1049f010<br><br>
r12-15&nbsp; 00000000 10000000 1049f010 10000000<br><br>
r16-19&nbsp; 1049f010 10175040 1fff2420 1013ed60<br><br>
r20-23&nbsp; 1ba949d4 ffffffaf 1ba949d4 00000000<br><br>
r24-27&nbsp; 00000000 00000010 00011200 1038d010<br><br>
r28-31&nbsp; 1f44d140 00052045 1ba94a40 1014d1ac<br><br>
sr0-3&nbsp;&nbsp; 00000000 00000000 00000000 00000028<br><br>
sr4-7&nbsp;&nbsp; 00000000 00000000 00000000 00000000<br><br>
<br>
IASQ: 00000000 00000000 IAOQ: 1014d19c 1014d1a0<br><br>
&nbsp;IIR: 0cb81099&nbsp;&nbsp;&nbsp; ISR: 00000000&nbsp; IOR:
0000000c<br><br>
&nbsp;CPU:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp; CR30:
1ba94000 CR31: 10428000<br><br>
&nbsp;ORIG_R28: ea3dad4f<br><br>
&nbsp;IAOQ[0]: mempool_alloc+0x9c/0x144<br><br>
&nbsp;IAOQ[1]: mempool_alloc+0xa0/0x144<br><br>
&nbsp;RP(r2): __blk_queue_bounce+0x1fc/0x294<br><br>
Kernel panic - not syncing: Kernel Fault<br><br>
&nbsp;<br>
</font><br>
</html>

--=====================_17015517==.ALT--



-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
