Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id A18164840
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  4 May 2004 13:46:50 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i44Jkla07717; Tue, 4 May 2004 15:46:47 -0400
Subject: Re: [parisc-linux] palo-1.4 broken on 32bit ?
From: James Bottomley <James.Bottomley@steeleye.com>
To: Helge Deller <deller@gmx.de>
In-Reply-To: <200405042136.28626.deller@gmx.de>
References: <200405042136.28626.deller@gmx.de>
Content-Type: text/plain
Date: 04 May 2004 14:46:46 -0500
Message-Id: <1083700007.1722.2.camel@mulgrave>
Mime-Version: 1.0
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, 2004-05-04 at 14:36, Helge Deller wrote:
> after apt-get upgrading to palo_1.4_hppa.deb it seems, that palo-1.4 isn't able any longer to boot up a 32bit Linux kernel on a 32bit Machine.
> I've run several tests on a B180L, and only after downgrading to palo-1.3 I was able to boot again.
> 
> Am I the only one seeing this problem ? 
> Anyone maybe has an idea what has been changed ?

Well, it works just fine for me:

redscar:~# palo -v
palo version 1.4 bame@c3k Fri Mar 26 16:18:35 MST 2004
ELF32 executable
Partition Start(MB) End(MB) Id Type
1               1     257   82 swap
2             258     277   f0 Palo
3             278    2045   83 ext2
4            2046    4094   83 ext2
F0 partition start sector 527744 length 41230
do_ra(1, 5, 3, -1, '3/boot/vmlinux initrd=3/boot/initrd.img
root=/dev/sda3 HOME=/ console=ttyS0 console=tty0', 4, -1, 270204928,
21109760)
check_bootloader 213
checksum(0x2f2b0, 36864) = 0x00000000
ipl: addr 270204928 size 36864 entry 0x0
 ko 0x0 ksz 0 k64o 0x0 k64sz 0 rdo 0 rdsz 0
<3/boot/vmlinux initrd=3/boot/initrd.img root=/dev/sda3 HOME=/
console=ttyS0 console=tty0>
check_bootloader 650
checksum(0x262a8, 36864) = 0x00000000
ipl: addr 270204928 size 36864 entry 0x0
 ko 0x101f0000 ksz 3421952 k64o 0x0 k64sz 0 rdo 0 rdsz 0
<3/boot/vmlinux initrd=3/boot/initrd.img root=/dev/sda3 HOME=/
console=ttyS0 console=tty0>
redscar:~# cat /proc/cpuinfo 
processor       : 0
cpu family      : PA-RISC 1.1e
cpu             : PA7300LC (PCX-L2)
cpu MHz         : 180.000000
model           : 9000/778/B180L
model name      : Merlin L2+ 180 (9000/778/B180L)
hversion        : 0x00005040
sversion        : 0x00000481
I-cache         : 64 KB
D-cache         : 64 KB (WB)
ITLB entries    : 96
DTLB entries    : 96 - shared with ITLB
BTLB fixed      : max. 16384 pages, pagesize=4096 (64MB)
BTLB fix-entr.  : 0 instruction, 0 data (8 combined)
BTLB var-entr.  : 0 instruction, 0 data (0 combined)
bogomips        : 119.60
software id     : 2012752031

However, there have been several reports of intermittent failures with
later versions of palo; if you could actually track the issue down, that
would be greatly appreciated.

The current thought is that it's a command line issue (i.e. embedding a
commmand line >128 characters in palo causes failures).

James
