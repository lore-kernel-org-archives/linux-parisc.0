Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA10550
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 Jan 2001 10:51:19 -0700
Received: from bame.riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via in.smtpd with esmtp
	id <m14JJGi-001Vp3C@chalet> (Debian Smail3.2.0.102)
	for <parisc-linux@thepuffingroup.com>; Thu, 18 Jan 2001 10:54:40 -0700 (MST)
Message-Id: <m14JJGi-001Vp3C@chalet>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
To: "Jim Buttafuoco" <jim@tylerdrive.org>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Trouble booting a 710 (bushmaster)
In-reply-to: Your message of "Thu, 18 Jan 2001 10:17:24 EST."
             <200101181517.f0IFHOs08538@openbsd1.buttafuoco.net>
Date: Thu, 18 Jan 2001 10:54:35 -0700
Sender: bame@bame.riverrock.org
List-ID: <linux-parisc.vger.kernel.org>

= Hi,
= 
= I have been trying to get my 2 9000/710's to boot for a couple of months
= now.  Attached is the latest log file from my boot. 
= 
= The 2 problems that I see are the ramdisk is NOT seen and the BOOTP
= fails.  I have used TCPDUMP to look at the packets coming and going from
= the system.  All I see is the RBOOTP stuff.  The ramdisk is valid as far
= as I can tell. (I mounted it via the loop fs).  Should it be compressed
= with ZIP???.
= 
= The kernel/palo source is the latest as of 1/17/01.  

= Loading ramdisk 1544116 bytes @ 0051c000...
= [...]

Looks like you're using a compressed ramdisk.  That should work, but
it's worth trying an uncompressed one.

= RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
= 82596.c: MAC of HP700 LAN blindely read from the prom!
= eth0: Couldn't get consistent shared memory
= eth0: 82596 at 0xf0826000, 08 00 09 25 DD 7B IRQ 87.
= 82596.c $Revision: 1.14 $
= RAMDISK: Couldn't find valid RAM disk image starting at 0.

Yeah, try an uncompressed ramdisk.  EXT2

= [...]
= NET4: Linux TCP/IP 1.0 for NET4.0
= IP Protocols: ICMP, UDP, TCP
= IP: routing cache hash table of 512 buckets, 4Kbytes
= TCP: Hash tables configured (established 2048 bind 2048)
= Sending BOOTP requests............. timed out!
= IP-Config: Auto-configuration of network failed.
= Trying to free nonexistent resource <f0826000-f082600b>
= NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
= kmem_create: Forcing size word alignment - nfs_fh
= Kernel panic: VFS: Unable to mount root fs on 01:00

No clue about your bootp problem...

	-P
