Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA01269
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 12:52:37 -0700
Received: from whitetower.tamu.edu (dyna-0003.vpn.tamu.edu [172.16.32.3])
	by mail.tamu.edu (8.9.3/8.9.3) with ESMTP id NAA11473
	for <parisc-linux@thepuffingroup.com>; Wed, 15 Nov 2000 13:54:06 -0600 (CST)
Message-Id: <4.3.0.20001115132700.00cc91b0@clavin.cs.tamu.edu>
Date: Wed, 15 Nov 2000 13:53:03 -0600
To: parisc-linux@thepuffingroup.com
From: Jack Perdue <j-perdue@tamu.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: [parisc-linux] nfsroot - 712/60 - RPC - help
List-ID: <linux-parisc.vger.kernel.org>


Howdy Puffins and others,

I have a 712/60 here that I bought for the purpose of playing
with PARISC linux.  It came w/HP-UX 9.0 which I don't want to
wax just yet (e.g. for ioscan and other HP-UX utils).  I don't
have a CD for it, so I've been trying to get NFSROOT to work.

The 712/60 is known as pancho.  The bootp server is named blacktower.
I've unzipped nfsroot-20000804.tgz as /tftpboot/pancho and exported 
it to the local net.  I can mount it from an i386 RH6.2 box, but
I think I'm having problems accessing it from PA-RISC linux.

Below are some of my config files, the output from bootp
and two attempts at booting the 712/60... one with 
debugging turned on in net/sunrpc/sysctl.c.

I'm kinda stumped.  Can anyone see where I've gone wrong?

Some notes:

a) I've tried NFSROOT=192.168.1.11  and NFSROOT=192.168.1.11/tftpboot/vmlinux
    in palo/Makefile and the results are the same (both suggestions were
    made to this list at some point)

b) I tried the APRICOT drivers, but the kernel would never see the net interface
    so I've switched to the LASI_82596 driver (doing both resulted in dupe symbols).
    The LASI driver seems to get much further.

c) my sources were updated today from the puffin's CVS tree.  The kernel
    booting below was built on those sources.

d) with debugging on, I get:
      Root-NFS: Unable to get nfsd port number from server, using default
      Root-NFS: Portmapper on server returned 2049 as nfsd port
    however, with the debugging off, I only get:
      Root-NFS: Unable to get nfsd port number from server, using default
    portmap and rpc.mountd are running on blacktower.  Why the
    conflicting report when debug is on?

e) the final message in /var/log/messages is always 
    "tftpd: read: Connection refused".  My hosts.allow and hosts.deny
    files are empty so they shouldn't be the problem.  And,
    as mentioned I can NFS mount the directory.  Is this
    the problem and if so, what is the solution???

Any help on how I can resolve this problem is appreciated.

TIA,

jack
j-perdue@tamu.edu

========== blacktower:/etc/exports ==========

/tftpboot/pancho 192.168.1.0/255.255.255.0(rw,no_root_squash)

========== blacktower:/etc/bootptab ==========
pancho:\
         :hd=/tftpboot:\
         :bf=vmlinux:\
         :ht=ether:\
         :ha=08000993DA02:\
         :sm=255.255.255.0:\
         :hn:\
         :ip=192.168.1.13:\
         :vm=rfc1048:

========== bootpd output ==========

[root@blacktower rc.d]# /usr/sbin/bootpd -d 20
bootpd: info(6):   bootptab mtime: Wed Nov 15 13:02:44 2000
bootpd: info(6):   reading "/etc/bootptab"
bootpd: info(6):   read 1 entries (1 hosts) from "/etc/bootptab"
bootpd: info(6):   recvd pkt from IP addr 0.0.0.0
bootpd: info(6):   bootptab mtime: Wed Nov 15 13:02:44 2000
bootpd: info(6):   request from Ethernet address 08:00:09:93:DA:02
bootpd: info(6):   found 192.168.1.13 (pancho)
bootpd: info(6):   bootfile="/tftpboot/vmlinux"
bootpd: info(6):   vendor magic field is 99.130.83.99
bootpd: info(6):   sending reply (with RFC1048 options)
bootpd: info(6):   setarp 192.168.1.13 - 08:00:09:93:DA:02
bootpd: info(6):   recvd pkt from IP addr 0.0.0.0
bootpd: info(6):   bootptab mtime: Wed Nov 15 13:02:44 2000
bootpd: info(6):   request from Ethernet address 08:00:09:93:DA:02
bootpd: info(6):   found 192.168.1.13 (pancho)
bootpd: info(6):   bootfile="/tftpboot/vmlinux"
bootpd: info(6):   vendor magic field is 99.130.83.99
bootpd: info(6):   request message length=364
bootpd: info(6):   extended reply, length=364, options=128
bootpd: info(6):   sending reply (with RFC1048 options)
bootpd: info(6):   setarp 192.168.1.13 - 08:00:09:93:DA:02

========== from /var/log/messages ==========

Nov 15 13:02:20 blacktower bootpd[1320]: version 2.4.3
Nov 15 13:02:20 blacktower bootpd[1320]: bootptab mtime: Wed Oct 12 00:41:28 1994
Nov 15 13:02:20 blacktower bootpd[1320]: reading "/etc/bootptab"
Nov 15 13:02:20 blacktower bootpd[1320]: read 1 entries (1 hosts) from "/etc/bootptab"
Nov 15 13:02:47 blacktower bootpd[1323]: version 2.4.3
Nov 15 13:02:47 blacktower bootpd[1323]: bootptab mtime: Wed Nov 15 13:02:44 2000
Nov 15 13:02:47 blacktower bootpd[1323]: reading "/etc/bootptab"
Nov 15 13:02:47 blacktower bootpd[1323]: read 1 entries (1 hosts) from "/etc/bootptab"
Nov 15 13:04:34 blacktower bootpd[1323]: recvd pkt from IP addr 0.0.0.0
Nov 15 13:04:34 blacktower bootpd[1323]: bootptab mtime: Wed Nov 15 13:02:44 2000
Nov 15 13:04:34 blacktower bootpd[1323]: request from Ethernet address 08:00:09:93:DA:02
Nov 15 13:04:34 blacktower bootpd[1323]: found 192.168.1.13 (pancho)
Nov 15 13:04:34 blacktower bootpd[1323]: bootfile="/tftpboot/vmlinux"
Nov 15 13:04:34 blacktower bootpd[1323]: vendor magic field is 99.130.83.99
Nov 15 13:04:34 blacktower bootpd[1323]: sending reply (with RFC1048 options)
Nov 15 13:04:34 blacktower bootpd[1323]: setarp 192.168.1.13 - 08:00:09:93:DA:02
Nov 15 13:04:35 blacktower tftpd[1325]: tftpd: trying to get file: /tftpboot/vmlinux
Nov 15 13:04:36 blacktower tftpd[1327]: tftpd: trying to get file: /tftpboot/vmlinux
Nov 15 13:04:47 blacktower bootpd[1323]: recvd pkt from IP addr 0.0.0.0
Nov 15 13:04:47 blacktower bootpd[1323]: bootptab mtime: Wed Nov 15 13:02:44 2000
Nov 15 13:04:47 blacktower bootpd[1323]: request from Ethernet address 08:00:09:93:DA:02
Nov 15 13:04:47 blacktower bootpd[1323]: found 192.168.1.13 (pancho)
Nov 15 13:04:47 blacktower bootpd[1323]: bootfile="/tftpboot/vmlinux"
Nov 15 13:04:47 blacktower bootpd[1323]: vendor magic field is 99.130.83.99
Nov 15 13:04:47 blacktower bootpd[1323]: request message length=364
Nov 15 13:04:47 blacktower bootpd[1323]: extended reply, length=364, options=128
Nov 15 13:04:47 blacktower bootpd[1323]: sending reply (with RFC1048 options)
Nov 15 13:04:47 blacktower bootpd[1323]: setarp 192.168.1.13 - 08:00:09:93:DA:02
Nov 15 13:04:53 blacktower tftpd[1327]: tftpd: read: Connection refused

========== console output (no RPC debug) ==========



----------------------------------------------------------------------------
BootRom Version    1.5
Memory Size:  32 MB
----------------------------------------------------------------------------




(c) Copyright 1990-1993, Hewlett-Packard Company.
All rights reserved

Press <ESCAPE> to stop boot sequence.
Selecting a system to boot.

Booting
palo ipl jkp2866@redtower Wed Nov 15 12:44:21 CST 2000
0/vmlinux 1606438 bytes @ 0x6800
0/palo-cmdline '0/vmlinux HOME=/ TERM=LINUX root=/dev/nfs nfsroot=192.68.1.11:/tftpboot/pancho '
Kernel: partition 0 file /vmlinux
ELF32 executable

Entry 00100000 first 00100000 n 4
Segment 0 load 00100000 size 1097900 mediaptr 0x1000
Segment 1 load 0020e000 size 150520 mediaptr 0x10e000
Segment 2 load 00234000 size 55900 mediaptr 0x133000
Segment 3 load 00244000 size 8192 mediaptr 0x141000
branching to kernel entry point 0x00100000
Set default PSW W bit to 0
PDC Console Initialized
The 32-bit Kernel has started...
Enabled FP coprocessor
Free memory starts at: 0xc026e000
start_parisc(0x504d6c,0x504d6c,0x0,0x0)
PALO command line: 'HOME=/ TERM=LINUX root=/dev/nfs nfsroot=192.68.1.11:/tftpboot/pancho '
PALO initrd 0-0
model   00006000 00000481 00000000 00000000 77564139 00000000 00000004 00000072 00000072
vers    0000000a
CPUID vers 0 rev 0
Searching for devices in PDC firmware... processor hpa 0xfffbe000
  an older box...
Found devices:
1. Gecko GSC Core Graphics (10) at 0xf8000000, versions 0x16, 0x0, 0x85, 0x0, 0x0
2. Gecko Core BA (11) at 0xf0100000, versions 0x16, 0x0, 0x81, 0x0, 0x0
3. Gecko Core SCSI (10) at 0xf0106000, versions 0x16, 0x0, 0x82, 0x0, 0x0
4. Gecko Core Lan (802.3) (10) at 0xf0107000, versions 0x16, 0x0, 0x8a, 0x0, 0x0
5. Gecko Core RS-232 (10) at 0xf0105000, versions 0x16, 0x0, 0x8c, 0x0, 0x0
6. Gecko Core Centronics (10) at 0xf0102000, versions 0x16, 0x0, 0x74, 0x0, 0x0
7. Gecko Audio (10) at 0xf0104000, versions 0x16, 0x0, 0x7b, 0x0, 0x0
8. Gecko Core PC Floppy (10) at 0xf010a000, versions 0x16, 0x0, 0x83, 0x0, 0x0
9. Gecko Core PC Keyboard (10) at 0xf0108000, versions 0x16, 0x0, 0x84, 0x0, 0x0
10. Gecko Core PC Keyboard (10) at 0xf0108100, versions 0x16, 0x0, 0x84, 0x0, 0x0
11. Gecko (712/60) (0) at 0xfffbe000, versions 0x600, 0x0, 0x4, 0x0, 0x81
12. Gecko (1) at 0xfffbf000, versions 0x26, 0x0, 0x9, 0x0, 0x0
That's a total of 12 devices.
CPU(s): 1 x PA7100LC (PCX-L) at 60.000000 MHz
Linux version 2.4.0-test10 (jkp2866@redtower) (gcc version 2.96 20000925 (experimental)) #16 Wed Nov 15 14:01:38 CST 2000
free_bootmem(0x26e400, 0x1d91c00)
pagetable_init
On node 0 totalpages: 8192
zone(0): 4096 pages.
zone(1): 4096 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=LINUX root=/dev/nfs nfsroot=192.68.1.11:/tftpboot/pancho 
trap_init
Calibrating delay loop... 59.80 BogoMIPS
Memory: 29632k available
Dentry-cache hash table entries: 4096 (order: 3, 32768 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 2048 (order: 2, 16384 bytes)
POSIX conformance testing by UNIFIX
Lasi version 0 at 0xf0100000 found.
Found i82596 at 0xf0107000, IRQ 87
early initialization of device eth0 is deferred
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
pty: 256 Unix98 ptys configured
eth0: 82596 at 0xf0107000, 08 00 09 93 DA 02 IRQ 87.
82596.c $Revision: 1.14 $
Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
ttyS00 at iomem 0xf0105800 (irq = 90) is a 16550A
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 2048 bind 2048)
eth0: link ok.
Sending BOOTP requests.... OK
IP-Config: Got BOOTP answer from 192.168.1.11, my address is 192.168.1.13
Switching from PDC console
kmem_create: Forcing size word alignment - nfs_fh
Looking up port of RPC 100003/2 on 192.68.1.11
RPC: sendmsg returned error 229
portmap: RPC call returned error 229
Root-NFS: Unable to get nfsd port number from server, using default
Looking up port of RPC 100005/2 on 192.68.1.11
RPC: sendmsg returned error 229
portmap: RPC call returned error 229
Root-NFS: Unable to get mountd port number from server, using default
RPC: sendmsg returned error 229
mount: RPC call returned error 229
Root-NFS: Server returned error -229 while mounting /tftpboot/pancho
VFS: Unable to mount root fs via NFS, trying floppy.
VFS: Cannot open root device "nfs" or 02:00
Please append a correct "root=" boot option
Kernel panic: VFS: Unable to mount root fs on 02:00


========== console output (with RPC debug) ==========


----------------------------------------------------------------------------
BootRom Version    1.5
Memory Size:  32 MB
----------------------------------------------------------------------------




(c) Copyright 1990-1993, Hewlett-Packard Company.
All rights reserved

Press <ESCAPE> to stop boot sequence.
Selecting a system to boot.

Booting
palo ipl jkp2866@redtower Wed Nov 15 12:44:21 CST 2000
0/vmlinux 1606438 bytes @ 0x6800
0/palo-cmdline '0/vmlinux HOME=/ TERM=LINUX root=/dev/nfs nfsroot=192.68.1.11:/tftpboot/pancho '
Kernel: partition 0 file /vmlinux
ELF32 executable

Entry 00100000 first 00100000 n 4
Segment 0 load 00100000 size 1097900 mediaptr 0x1000
Segment 1 load 0020e000 size 150520 mediaptr 0x10e000
Segment 2 load 00234000 size 55900 mediaptr 0x133000
Segment 3 load 00244000 size 8192 mediaptr 0x141000
branching to kernel entry point 0x00100000
Set default PSW W bit to 0
PDC Console Initialized
The 32-bit Kernel has started...
Enabled FP coprocessor
Free memory starts at: 0xc026e000
start_parisc(0x504d6c,0x504d6c,0x0,0x0)
PALO command line: 'HOME=/ TERM=LINUX root=/dev/nfs nfsroot=192.68.1.11:/tftpboot/pancho '
PALO initrd 0-0
model   00006000 00000481 00000000 00000000 77564139 00000000 00000004 00000072 00000072
vers    0000000a
CPUID vers 0 rev 0
Searching for devices in PDC firmware... processor hpa 0xfffbe000
  an older box...
Found devices:
1. Gecko GSC Core Graphics (10) at 0xf8000000, versions 0x16, 0x0, 0x85, 0x0, 0x0
2. Gecko Core BA (11) at 0xf0100000, versions 0x16, 0x0, 0x81, 0x0, 0x0
3. Gecko Core SCSI (10) at 0xf0106000, versions 0x16, 0x0, 0x82, 0x0, 0x0
4. Gecko Core Lan (802.3) (10) at 0xf0107000, versions 0x16, 0x0, 0x8a, 0x0, 0x0
5. Gecko Core RS-232 (10) at 0xf0105000, versions 0x16, 0x0, 0x8c, 0x0, 0x0
6. Gecko Core Centronics (10) at 0xf0102000, versions 0x16, 0x0, 0x74, 0x0, 0x0
7. Gecko Audio (10) at 0xf0104000, versions 0x16, 0x0, 0x7b, 0x0, 0x0
8. Gecko Core PC Floppy (10) at 0xf010a000, versions 0x16, 0x0, 0x83, 0x0, 0x0
9. Gecko Core PC Keyboard (10) at 0xf0108000, versions 0x16, 0x0, 0x84, 0x0, 0x0
10. Gecko Core PC Keyboard (10) at 0xf0108100, versions 0x16, 0x0, 0x84, 0x0, 0x0
11. Gecko (712/60) (0) at 0xfffbe000, versions 0x600, 0x0, 0x4, 0x0, 0x81
12. Gecko (1) at 0xfffbf000, versions 0x26, 0x0, 0x9, 0x0, 0x0
That's a total of 12 devices.
CPU(s): 1 x PA7100LC (PCX-L) at 60.000000 MHz
Linux version 2.4.0-test10 (jkp2866@redtower) (gcc version 2.96 20000925 (experimental)) #15 Wed Nov 15 13:48:41 CST 2000
free_bootmem(0x26e400, 0x1d91c00)
pagetable_init
On node 0 totalpages: 8192
zone(0): 4096 pages.
zone(1): 4096 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=LINUX root=/dev/nfs nfsroot=192.68.1.11:/tftpboot/pancho 
trap_init
Calibrating delay loop... 59.80 BogoMIPS
Memory: 29632k available
Dentry-cache hash table entries: 4096 (order: 3, 32768 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 2048 (order: 2, 16384 bytes)
POSIX conformance testing by UNIFIX
Lasi version 0 at 0xf0100000 found.
Found i82596 at 0xf0107000, IRQ 87
early initialization of device eth0 is deferred
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
pty: 256 Unix98 ptys configured
eth0: 82596 at 0xf0107000, 08 00 09 93 DA 02 IRQ 87.
82596.c $Revision: 1.14 $
Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
ttyS00 at iomem 0xf0105800 (irq = 90) is a 16550A
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 2048 bind 2048)
eth0: link ok.
Sending BOOTP requests.... OK
IP-Config: Got BOOTP answer from 192.168.1.11, my address is 192.168.1.13
Switching from PDC console
kmem_create: Forcing size word alignment - nfs_fh
RPC: registering /proc/net/rpc
RPC: registering /proc/net/rpc/nfs
Looking up port of RPC 100003/2 on 192.68.1.11
RPC:      rpc_getport_external(192.68.1.11, 100003, 2, 17)
RPC:      xprt_create_proto called
RPC:      xprt_create_socket(udp 17)
RPC:      setting up UDP transport...
RPC:      created transport c1fa4000
RPC: creating portmap client for 192.68.1.11 (xprt c1fa4000)
RPC:      allocated buffer c1faa5a0
RPC: creating NULL authenticator for client c1faa5a0
RPC:      allocated buffer c1fe6460
RPC:    0 new task procpid 1
RPC:    0 looking up NULL cred
RPC:      allocated buffer c1fe5500
RPC:    0 rpc_execute flgs 0
RPC:    0 call_reserve
RPC:    0 xprt_reserve cong = 0 cwnd = 256
RPC:    0 reserved req c1fa4064 xid 11582000
RPC:    0 xprt_reserve returns 0
RPC:    0 call_reserveresult (status 0)
RPC:    0 call_allocate (status 0)
RPC:      allocated buffer c1fb3800
RPC:    0 call_encode (status 0)
RPC:    0 marshaling NULL cred c1fe5500
RPC: xdr_encode_mapping(100003, 2, 17, 0)
RPC:    0 call_transmit (status 0)
RPC:    0 xprt_transmit(11582000)
RPC:    0 xprt_receive
RPC:    0 sleep_on(queue "xprt_pending" time 89)
RPC:    0 added to queue c1fa4048 "xprt_pending"
RPC:      xprt_sendmsg(56) = -229
RPC: sendmsg returned error 229
RPC:    0 __rpc_wake_up_task (now 93 inh 0)
RPC:    0 disabling timer
RPC:    0 removed from queue c1fa4048 "xprt_pending"
RPC:      __rpc_wake_up_task done
RPC:      wake_up_next(c1fa4040 "xprt_sending")
RPC:    0 call_status (status -229)
portmap: RPC call returned error 229
RPC:    0 exit() = -229
RPC:    0 release task
RPC:    0 disabling timer
RPC:    0 release request c1fa4064
RPC:      wake_up_next(c1fa4050 "xprt_backlog")
RPC:    0 releasing NULL cred c1fe5500
RPC:      rpc_release_client(c1faa5a0, 1)
RPC: destroying portmap client for 192.68.1.11
RPC: destroying NULL authenticator c1fe6460
RPC:      destroying transport c1fa4000
RPC:      disconnected transport c1fa4000
Root-NFS: Unable to get nfsd port number from server, using default
Root-NFS: Portmapper on server returned 2049 as nfsd port
Looking up port of RPC 100005/2 on 192.68.1.11
RPC:      rpc_getport_external(192.68.1.11, 100005, 2, 17)
RPC:      xprt_create_proto called
RPC:      xprt_create_socket(udp 17)
RPC:      setting up UDP transport...
RPC:      created transport c1fa4000
RPC: creating portmap client for 192.68.1.11 (xprt c1fa4000)
RPC:      allocated buffer c1faa5a0
RPC: creating NULL authenticator for client c1faa5a0
RPC:      allocated buffer c1fe6460
RPC:    1 new task procpid 1
RPC:    1 looking up NULL cred
RPC:      allocated buffer c1fe5500
RPC:    1 rpc_execute flgs 0
RPC:    1 call_reserve
RPC:    1 xprt_reserve cong = 0 cwnd = 256
RPC:    1 reserved req c1fa4064 xid 11582001
RPC:    1 xprt_reserve returns 0
RPC:    1 call_reserveresult (status 0)
RPC:    1 call_allocate (status 0)
RPC:      allocated buffer c1fb3800
RPC:    1 call_encode (status 0)
RPC:    1 marshaling NULL cred c1fe5500
RPC: xdr_encode_mapping(100005, 2, 17, 0)
RPC:    1 call_transmit (status 0)
RPC:    1 xprt_transmit(11582001)
RPC:    1 xprt_receive
RPC:    1 sleep_on(queue "xprt_pending" time 140)
RPC:    1 added to queue c1fa4048 "xprt_pending"
RPC:      xprt_sendmsg(56) = -229
RPC: sendmsg returned error 229
RPC:    1 __rpc_wake_up_task (now 144 inh 0)
RPC:    1 disabling timer
RPC:    1 removed from queue c1fa4048 "xprt_pending"
RPC:      __rpc_wake_up_task done
RPC:      wake_up_next(c1fa4040 "xprt_sending")
RPC:    1 call_status (status -229)
portmap: RPC call returned error 229
RPC:    1 exit() = -229
RPC:    1 release task
RPC:    1 disabling timer
RPC:    1 release request c1fa4064
RPC:      wake_up_next(c1fa4050 "xprt_backlog")
RPC:    1 releasing NULL cred c1fe5500
RPC:      rpc_release_client(c1faa5a0, 1)
RPC: destroying portmap client for 192.68.1.11
RPC: destroying NULL authenticator c1fe6460
RPC:      destroying transport c1fa4000
RPC:      disconnected transport c1fa4000
Root-NFS: Unable to get mountd port number from server, using default
Root-NFS: mountd port is 627
NFS:      nfs_mount(c044010b:/tftpboot/pancho)
RPC:      xprt_create_proto called
RPC:      xprt_create_socket(udp 17)
RPC:      setting up UDP transport...
RPC:      created transport c1fa4000
RPC: creating mount client for 192.68.1.11 (xprt c1fa4000)
RPC:      allocated buffer c1faa5a0
RPC: creating NULL authenticator for client c1faa5a0
RPC:      allocated buffer c1fe6460
RPC:    2 new task procpid 1
RPC:    2 looking up NULL cred
RPC:      allocated buffer c1fe5500
RPC:    2 rpc_execute flgs 0
RPC:    2 call_reserve
RPC:    2 xprt_reserve cong = 0 cwnd = 256
RPC:    2 reserved req c1fa4064 xid 11582002
RPC:    2 xprt_reserve returns 0
RPC:    2 call_reserveresult (status 0)
RPC:    2 call_allocate (status 0)
RPC:      allocated buffer c1fa3000
RPC:    2 call_encode (status 0)
RPC:    2 marshaling NULL cred c1fe5500
RPC:    2 call_transmit (status 0)
RPC:    2 xprt_transmit(11582002)
RPC:    2 xprt_receive
RPC:    2 sleep_on(queue "xprt_pending" time 189)
RPC:    2 added to queue c1fa4048 "xprt_pending"
RPC:      xprt_sendmsg(60) = -229
RPC: sendmsg returned error 229
RPC:    2 __rpc_wake_up_task (now 193 inh 0)
RPC:    2 disabling timer
RPC:    2 removed from queue c1fa4048 "xprt_pending"
RPC:      __rpc_wake_up_task done
RPC:      wake_up_next(c1fa4040 "xprt_sending")
RPC:    2 call_status (status -229)
mount: RPC call returned error 229
RPC:    2 exit() = -229
RPC:    2 release task
RPC:    2 disabling timer
RPC:    2 release request c1fa4064
RPC:      wake_up_next(c1fa4050 "xprt_backlog")
RPC:    2 releasing NULL cred c1fe5500
RPC:      rpc_release_client(c1faa5a0, 1)
RPC: destroying mount client for 192.68.1.11
RPC: destroying NULL authenticator c1fe6460
RPC:      destroying transport c1fa4000
RPC:      disconnected transport c1fa4000
Root-NFS: Server returned error -229 while mounting /tftpboot/pancho
VFS: Unable to mount root fs via NFS, trying floppy.
VFS: Cannot open root device "nfs" or 02:00
Please append a correct "root=" boot option
Kernel panic: VFS: Unable to mount root fs on 02:00

========== linux/.config ==========

#
# Automatically generated make config: don't edit
#
CONFIG_PARISC=y
# CONFIG_UID16 is not set

#
# Code maturity level options
#
CONFIG_EXPERIMENTAL=y

#
# General options
#
# CONFIG_SMP is not set
# CONFIG_KWDB is not set
CONFIG_GSC=y
# CONFIG_IOMMU_CCIO is not set
CONFIG_GSC_LASI=y
CONFIG_PCI=y
CONFIG_GSC_DINO=y
# CONFIG_PCI_LBA is not set

#
# Loadable module support
#
# CONFIG_MODULES is not set

#
# General setup
#
CONFIG_NET=y
CONFIG_SYSVIPC=y
# CONFIG_BSD_PROCESS_ACCT is not set
CONFIG_SYSCTL=y
CONFIG_BINFMT_SOM=y
# CONFIG_BINFMT_ELF is not set
# CONFIG_BINFMT_MISC is not set
# CONFIG_BINFMT_JAVA is not set

#
# Parallel port support
#
# CONFIG_PARPORT is not set

#
# Block devices
#
# CONFIG_BLK_DEV_FD is not set
# CONFIG_BLK_DEV_XD is not set
# CONFIG_PARIDE is not set
# CONFIG_BLK_CPQ_DA is not set
# CONFIG_BLK_CPQ_CISS_DA is not set
# CONFIG_BLK_DEV_DAC960 is not set
# CONFIG_BLK_DEV_LOOP is not set
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_RAM is not set
# CONFIG_BLK_DEV_INITRD is not set

#
# Networking options
#
# CONFIG_PACKET is not set
# CONFIG_NETLINK is not set
# CONFIG_NETFILTER is not set
# CONFIG_FILTER is not set
# CONFIG_UNIX is not set
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=y
CONFIG_IP_PNP_BOOTP=y
# CONFIG_IP_PNP_RARP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE is not set
# CONFIG_INET_ECN is not set
# CONFIG_SYN_COOKIES is not set
# CONFIG_IPV6 is not set
# CONFIG_KHTTPD is not set
# CONFIG_ATM is not set

#
#  
#
# CONFIG_IPX is not set
# CONFIG_ATALK is not set
# CONFIG_DECNET is not set
# CONFIG_BRIDGE is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_LLC is not set
# CONFIG_NET_DIVERT is not set
# CONFIG_ECONET is not set
# CONFIG_WAN_ROUTER is not set
# CONFIG_NET_FASTROUTE is not set
# CONFIG_NET_HW_FLOWCONTROL is not set

#
# QoS and/or fair queueing
#
# CONFIG_NET_SCHED is not set

#
# SCSI support
#
# CONFIG_SCSI is not set

#
# Network device support
#
CONFIG_NETDEVICES=y
CONFIG_LASI_82596=y

#
# ARCnet devices
#
# CONFIG_ARCNET is not set
# CONFIG_DUMMY is not set
# CONFIG_BONDING is not set
# CONFIG_EQUALIZER is not set
# CONFIG_TUN is not set
# CONFIG_NET_SB1000 is not set

#
# Ethernet (10 or 100Mbit)
#
CONFIG_NET_ETHERNET=y
# CONFIG_NET_VENDOR_3COM is not set
# CONFIG_LANCE is not set
# CONFIG_NET_VENDOR_SMC is not set
# CONFIG_NET_VENDOR_RACAL is not set
# CONFIG_AT1700 is not set
# CONFIG_DEPCA is not set
# CONFIG_HP100 is not set
# CONFIG_NET_ISA is not set
CONFIG_NET_PCI=y
# CONFIG_PCNET32 is not set
# CONFIG_ADAPTEC_STARFIRE is not set
# CONFIG_AC3200 is not set
# CONFIG_APRICOT is not set
# CONFIG_CS89x0 is not set
# CONFIG_DE4X5 is not set
# CONFIG_TULIP is not set
# CONFIG_DGRS is not set
# CONFIG_DM9102 is not set
# CONFIG_EEPRO100 is not set
# CONFIG_LNE390 is not set
# CONFIG_NATSEMI is not set
# CONFIG_NE2K_PCI is not set
# CONFIG_NE3210 is not set
# CONFIG_ES3210 is not set
# CONFIG_RTL8129 is not set
# CONFIG_8139TOO is not set
# CONFIG_SIS900 is not set
# CONFIG_EPIC100 is not set
# CONFIG_SUNDANCE is not set
# CONFIG_TLAN is not set
# CONFIG_VIA_RHINE is not set
# CONFIG_WINBOND_840 is not set
# CONFIG_NET_POCKET is not set

#
# Ethernet (1000 Mbit)
#
# CONFIG_ACENIC is not set
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
# CONFIG_SK98LIN is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set

#
# Wireless LAN (non-hamradio)
#
# CONFIG_NET_RADIO is not set

#
# Token Ring devices
#
# CONFIG_TR is not set
# CONFIG_NET_FC is not set
# CONFIG_RCPCI is not set
# CONFIG_SHAPER is not set

#
# Wan interfaces
#
# CONFIG_WAN is not set

#
# Character devices
#
# CONFIG_VT is not set
CONFIG_SERIAL=y
CONFIG_SERIAL_CONSOLE=y
CONFIG_SERIAL_GSC=y
CONFIG_SERIAL_EXTENDED=y
# CONFIG_SERIAL_MANY_PORTS is not set
# CONFIG_SERIAL_SHARE_IRQ is not set
# CONFIG_SERIAL_DETECT_IRQ is not set
# CONFIG_SERIAL_MULTIPORT is not set
# CONFIG_HUB6 is not set
# CONFIG_SERIAL_NONSTANDARD is not set
CONFIG_UNIX98_PTYS=y
CONFIG_UNIX98_PTY_COUNT=256

#
# I2C support
#
# CONFIG_I2C is not set

#
# Mice
#
# CONFIG_BUSMOUSE is not set
# CONFIG_MOUSE is not set

#
# Joysticks
#
# CONFIG_JOYSTICK is not set

#
# Input core support is needed for joysticks
#
# CONFIG_QIC02_TAPE is not set

#
# Watchdog Cards
#
# CONFIG_WATCHDOG is not set
# CONFIG_GENRTC is not set
# CONFIG_INTEL_RNG is not set
# CONFIG_NVRAM is not set
# CONFIG_RTC is not set
# CONFIG_DTLK is not set
# CONFIG_R3964 is not set
# CONFIG_APPLICOM is not set

#
# Ftape, the floppy tape device driver
#
# CONFIG_FTAPE is not set
# CONFIG_AGP is not set
# CONFIG_DRM is not set

#
# File systems
#
# CONFIG_QUOTA is not set
# CONFIG_AUTOFS_FS is not set
# CONFIG_AUTOFS4_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_ADFS_FS_RW is not set
# CONFIG_AFFS_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_FAT_FS is not set
# CONFIG_MSDOS_FS is not set
# CONFIG_UMSDOS_FS is not set
# CONFIG_VFAT_FS is not set
# CONFIG_EFS_FS is not set
# CONFIG_JFFS_FS is not set
# CONFIG_CRAMFS is not set
# CONFIG_RAMFS is not set
CONFIG_ISO9660_FS=y
# CONFIG_JOLIET is not set
# CONFIG_MINIX_FS is not set
# CONFIG_NTFS_FS is not set
# CONFIG_NTFS_RW is not set
# CONFIG_HPFS_FS is not set
CONFIG_PROC_FS=y
# CONFIG_DEVFS_FS is not set
# CONFIG_DEVFS_MOUNT is not set
# CONFIG_DEVFS_DEBUG is not set
# CONFIG_DEVPTS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_QNX4FS_RW is not set
# CONFIG_ROMFS_FS is not set
CONFIG_EXT2_FS=y
# CONFIG_SYSV_FS is not set
# CONFIG_SYSV_FS_WRITE is not set
# CONFIG_UDF_FS is not set
# CONFIG_UDF_RW is not set
# CONFIG_UFS_FS is not set
# CONFIG_UFS_FS_WRITE is not set

#
# Network File Systems
#
# CONFIG_CODA_FS is not set
CONFIG_NFS_FS=y
# CONFIG_NFS_V3 is not set
CONFIG_ROOT_NFS=y
# CONFIG_NFSD is not set
# CONFIG_NFSD_V3 is not set
CONFIG_SUNRPC=y
CONFIG_LOCKD=y
# CONFIG_SMB_FS is not set
# CONFIG_NCP_FS is not set
# CONFIG_NCPFS_PACKET_SIGNING is not set
# CONFIG_NCPFS_IOCTL_LOCKING is not set
# CONFIG_NCPFS_STRONG is not set
# CONFIG_NCPFS_NFS_NS is not set
# CONFIG_NCPFS_OS2_NS is not set
# CONFIG_NCPFS_SMALLDOS is not set
# CONFIG_NCPFS_MOUNT_SUBDIR is not set
# CONFIG_NCPFS_NDS_DOMAINS is not set
# CONFIG_NCPFS_NLS is not set
# CONFIG_NCPFS_EXTRAS is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
# CONFIG_NLS is not set

#
# Sound Drivers
#
# CONFIG_SOUND is not set

#
# Kernel hacking
#
# CONFIG_MAGIC_SYSRQ is not set
