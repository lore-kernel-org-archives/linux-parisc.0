Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id F16E14829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Nov 2002 13:42:37 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by transport.cksoft.de (Postfix) with ESMTP id C0C001FFEC1
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Nov 2002 21:42:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mail.int.zabbadoz.net (Postfix) with ESMTP id 0BA6822E1A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Nov 2002 20:42:29 +0000 (UTC)
Date: Tue, 12 Nov 2002 20:42:28 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.BSF.4.44.0211122031220.32930-100000@e0-0.zab2.int.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] [2.5] My System ate a SPARC! *haha* 8-(
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

Hi,

felt really lucky to have reached INIT for less than a second ;-)

hit it. looped for(;;);

had to remove power  cause neither sysreq nor the power button could
reboot the machine...

rcS should be the same as everywhere from the .dep .



Linux version 2.5.47-pa1 (bz@apollo) (gcc version 3.2) #5 Tue Nov 12 19:14:45 UTC 2002
...
Kernel command line: root=/dev/sda3 HOME=/ TERM=linux console=ttyS0 palo_kernel=3/boot/vmlinux-2.5.47-pa1
...
Attached scsi disk sdb at scsi0, channel 0, id 6, lun 0
NET4: Linux TCP/IP 1.0 for NET4.0
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 8192 bind 16384)
Linux IP multicast router 0.06 plus PIM-SM
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory: 372k freed
INIT: version 2.84 booting
      _______________________________
     < Your System ate a SPARC! Gah! >
      -------------------------------
             \   ^__^
              \  (xx)\_______
                 (__)\       )\/\
                  U  ||----w |
                     ||     ||
rcS(11): Breakpoint
      _______________________________
     < Your System ate a SPARC! Gah! >
      -------------------------------
             \   ^__^
              \  (xx)\_______
                 (__)\       )\/\
                  U  ||----w |
                     ||     ||
rcS(11): Breakpoint


-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
