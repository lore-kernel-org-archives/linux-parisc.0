Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from easy.in-chemnitz.de (www.in-chemnitz.de [213.187.65.136])
	by dsl2.external.hp.com (Postfix) with ESMTP id 882DE482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Sep 2001 10:09:09 -0600 (MDT)
From: =?iso-8859-1?Q?Andreas_H=E4rtel?= <andreas@malcolm.in-chemnitz.de>
To: "'Matthew Wilcox'" <willy@debian.org>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: AW: [parisc-linux] HP712/60 Hang when booting over the network
Date: Sun, 2 Sep 2001 18:07:59 +0200
Message-ID: <000001c133c9$7032e030$0350a8c0@genesis>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
In-Reply-To: <20010901162725.L5126@parcelfarce.linux.theplanet.co.uk>
List-ID: <linux-parisc.vger.kernel.org>

Hallp Matthew,

> Kernel: partition 0 file /vmlinux
> Ramdisk: partition 0 file /ramdisk
> Warning: kernel name doesn't end with 32 or 64... Guessing Annoyance:
> Firmware
> does not support PDV_MODEL_CAPABILITIES cell
> 32
>
> ERROR: Read from boot device failed (status = -3).
> byteio_read: seekread() returned -1 expected 2048
>
> ERROR: Read from boot device failed (status = -3).
> byteio_read: seekread() returned -1 expected 2048
> Couldn't grok your kernel executable format
> failed to load kernel
>
> ---snip---

That's very strange.  Can you tcpdump to see what packets are going
across the wire?  It almost looks as if your tftpd died halfway through
the transfer.

I've tried tcpdump, but I can not see any error or the reason for the
problem. Which
filter option must be set on tcpdump? Unfortunately, I have only few
practice with this.

./usr/local/sbin/tcpdump -vv -x -l -i eth0 ip host woody | tee
/home/andreas/dat


Here is the start and end of protocol:

17:50:52.165918 malcolm.bootps > woody.bootpc: xid:0x4137a2a6 Y:woody
S:malcolm [|bootp] (ttl 64, id 36751)
                         4500 0148 8f8f 0000 4011 c8bd c0a8 5001
                         c0a8 5006 0043 0044 0134 5fdb 0201 0600
                         4137 a2a6 0000 0000 0000 0000 c0a8 5006
                         c0a8 5001 0000
17:50:52.505918 woody.8252 > malcolm.tftp: 516 RRQ "/mnt/lifimage" [tos
0x10] (ttl 32, id 16702)
                         4510 0220 413e 0000 2011 3627 c0a8 5006
                         c0a8 5001 203c 0045 020c 1fff 0001 2f6d
                         6e74 2f6c 6966 696d 6167 6500 6f63 7465
                         7400 0000 0000
17:50:52.785918 malcolm.1105 > woody.8252: udp 516 (ttl 64, id 36758)
                         4500 0220 8f96 0000 4011 c7de c0a8 5001
                         c0a8 5006 0451 203c 020c ba1f 0003 0001
                         8000 5041 4c4f 0003 0154 c000 002b 8ad4
                         01b7 0800 001e
17:50:52.785918 woody.8252 > malcolm.1105: udp 4 [tos 0x10] (ttl 32, id
26570)
                         4510 0020 67ca 0000 2011 119b c0a8 5006
                         c0a8 5001 203c 0451 000c b9eb 0004 0001
                         c0a8 5006 202d 4120 2455 5543 505f
17:50:52.815918 malcolm.1105 > woody.8252: udp 516 (ttl 64, id 36760)
                         4500 0220 8f98 0000 4011 c7dc c0a8 5001

.....
.....

17:53:41.625918 woody.47989 > malcolm.1106: udp 4 [tos 0x10] (ttl 32, id
13135)
                         4510 0020 334f 0000 2011 4616 c0a8 5006
                         c0a8 5001 bb75 0452 000c 9eb1 0004 8000
                         c0a8 5006 6053 3f98 2922 b783 d859
17:53:46.625918 malcolm.1106 > woody.47989: udp 516 (ttl 64, id 14281)
                         4500 0220 37c9 0000 4011 1fac c0a8 5001
                         c0a8 5006 0452 bb75 020c 9157 0003 8000
                         01d2 1587 f93e 1ad8 e34a 5b08 abb1 dc02
                         5008 25a4 236a
17:53:46.625918 woody.47989 > malcolm.1106: udp 4 [tos 0x10] (ttl 32, id
1184)
                         4510 0020 04a0 0000 2011 74c5 c0a8 5006
                         c0a8 5001 bb75 0452 000c 9eb1 0004 8000
                         c0a8 5006 6053 3f98 2922 b783 d859
17:53:51.625918 malcolm.1106 > woody.47989: udp 516 (ttl 64, id 14285)
                         4500 0220 37cd 0000 4011 1fa8 c0a8 5001
                         c0a8 5006 0452 bb75 020c 9157 0003 8000
                         01d2 1587 f93e 1ad8 e34a 5b08 abb1 dc02
                         5008 25a4 236a
17:53:51.625918 woody.47989 > malcolm.1106: udp 4 [tos 0x10] (ttl 32, id
52956)
                         4510 0020 cedc 0000 2011 aa88 c0a8 5006
                         c0a8 5001 bb75 0452 000c 9eb1 0004 8000
                         c0a8 5006 6053 3f98 2922 b783 d859

Andreas
