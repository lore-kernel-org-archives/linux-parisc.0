Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beloit.edu (beloit.edu [144.89.40.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 27F30482B
	for <parisc-linux@parisc-linux.org>; Mon, 29 Oct 2001 07:15:18 -0700 (MST)
Received: from localhost ([144.89.185.182])
	by beloit.edu (AIX4.3/8.9.3/8.9.0) with ESMTP id IAA33504
	for <parisc-linux@parisc-linux.org>; Mon, 29 Oct 2001 08:10:02 -0600
Date: Mon, 29 Oct 2001 08:15:15 -0600
Mime-Version: 1.0 (Apple Message framework v472)
Content-Type: text/plain; charset=US-ASCII; format=flowed
From: Daniel Williams <dan@bigw.org>
To: parisc-linux@parisc-linux.org
Message-Id: <5FBBACF2-CC77-11D5-A7EF-0030657D1C94@bigw.org>
Subject: [parisc-linux] Creating boot CD with MacOS X
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

OK...  I've done a quick and dirty port of palo to MacOS X/Darwin.  
Here's my output:

[localhost:~/Desktop] dan% ./palo -f ./iso.conf
palo version 0.95 dan@localhost Sun Oct 28 23:53:13 CST 2001
ELF32 executable
ipl: addr 192512 size 26624 entry 0x0
  ko 0x0 ksz 0 k64o 0x0 k64sz 0 rdo 0 rdsz 0
<>
ipl: addr 192512 size 26624 entry 0x0
  ko 0x6ad6800 ksz 2853588 k64o 0x0 k64sz 0 rdo 118468608 rdsz 1991209
<0/vmlinux root=/dev/ram initrd=0/ramdisk>

And the iso.conf file contains:
-c0/vmlinux root=/dev/ram initrd=0/ramdisk
-k/Volumes/palinux-0.9.1/debian/dists/sid/main/disks-
hppa/current/32/vmlinux
-b/Volumes/palinux-0.9.1/iplboot
-r/Volumes/palinux-0.9.1/debian/dists/sid/main/disks-
hppa/current/root.bin
-C./palinux-0.9.2.iso

/Volumes/palinux-0.9.1 is a mounted image of the palinux-0.9.2 ISO 
file.  It's not the same file that I'm trying to modify with palo.  
Anyway, does this look like it would work to boot from if I copied the 
modified ISO to a Win2k machine to burn directly to CD with EasyCD 
Creator?

Thanks,
Dan
