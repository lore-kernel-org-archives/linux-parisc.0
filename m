Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA05243
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Nov 2000 16:07:35 -0700
Message-Id: <5.0.0.25.0.20001114142101.00a69910@mail.webcash.com>
Date: Tue, 14 Nov 2000 14:58:55 -0800
To: Paul Bame <bame@noam.fc.hp.com>
From: Kailashnath V Rampure <kailasr@webcash.com>
Subject: Re: [parisc-linux] Boot command 
Cc: Grant Grundler <grundler@cup.hp.com>,
        Matt Taggart <taggart@carmen.fc.hp.com>,
        parisc-linux@thepuffingroup.com
In-Reply-To: <E13rnTc-0007jH-00@noam.fc.hp.com>
References: <Your message of "Fri, 03 Nov 2000 11:46:39 PST." <5.0.0.25.0.20001103114401.00a46150@mail.webcash.com>
 <Your message of "Fri, 03 Nov 2000 11:03:23 PST." <5.0.0.25.0.20001102174648.02a4fb20@mail.webcash.com>
 <5.0.0.25.0.20001103114401.00a46150@mail.webcash.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
List-ID: <linux-parisc.vger.kernel.org>

I have booted HP A class server through network. On that I have repartioned 
the system and followed the steps on http://www.parisc-linux.org/install.html.
I have used the following command to initialize the hard disk. The kernel I 
have downloaded is vmlinux-20001018. and cpied it to /mnt/boot/vmlinux 
after mounting /dev/sda3. I have used the following command to initialize 
the HDD.

palo -I -k /boot/vmlinux -b /boot/iplboot \ -c '3/boot/vmlinux TERM=linux 
HOME=/ root=/dev/sda3' \ /dev/sda
--------------------------------
I get the following error:
--------------------------------
SOFT Boot.
palo ipl bame@noam Tue oct 31 14:18:02 MST 2000
0/vmlinux 2138614 bytes@ 0x1f78c000
0/palo-cmdline '3/boot/vmlinux TERM=linux HOME=/ root=/dev/sda3'
/dev/ida1	82	62		1030688
/dev/ida2	f0	1030750	24738
/dev/ida3	83	1055488	1030750
Kernel:partition 3 file /boot/vmlinux
ext2 block size 1024
ext2_mount(partition 3) returns 0
ext2_open(/boot/vmlinux) = -1
open /boot/vmlinux failed
-------------------------------------
Please suggest.
