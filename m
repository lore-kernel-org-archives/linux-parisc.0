Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id A2A294840
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 Oct 2003 09:49:05 -0700 (MST)
Message-ID: <3F9BFB00.5090008@tiscali.be>
Date: Sun, 26 Oct 2003 16:49:04 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] C110 builtin nic slow?
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

Hi all,

Here are the devices found on my c110 box:
Found devices:
1. U2-IOA BC Runway Port (12) at 0xfff88000 [8], versions 0x580, 0x7, 0xb
2. SkyHawk 100/120 FW-SCSI (4) at 0xf3f8c000 [8/12], versions 0x1f, 0x0, 
0x89
3. Raven T' Core BA (11) at 0xffd00000 [8/16], versions 0x32, 0x0, 0x81, 
  additional addresses: 0xffd0c000 0xffc00000
4. Raven T' Core Centronics (10) at 0xffd02000 [8/16/0], versions 0x32, 
0x0, 0x74,  additional addresses: 0xffd01000 0xffd03000
5. Raven T' Audio (10) at 0xffd04000 [8/16/1], versions 0x32, 0x0, 0x7b
6. Raven T' Lasi Core RS-232 (10) at 0xffd05000 [8/16/4], versions 0x32, 
0x0, 0x8c
7. Raven T' Core SCSI (10) at 0xffd06000 [8/16/5], versions 0x32, 0x0, 0x82
8. Raven T' Core LAN (802.3) (10) at 0xffd07000 [8/16/6], versions 0x32, 
0x0, 0x8a
9. Raven T' Core PS/2 Port (10) at 0xffd08000 [8/16/7], versions 0x32, 
0x0, 0x84
10. Raven T' Core PS/2 Port (10) at 0xffd08100 [8/16/8], versions 0x32, 
0x0, 0x84
11. Raven T' Core PC Floppy (10) at 0xffd0a000 [8/16/10], versions 0x32, 
0x0, 0x83
12. Raven T' Wax BA (11) at 0xffe00000 [8/20], versions 0x1e, 0x0, 0x8e, 
  additional addresses: 0xffe03000 0xffe06000
13. Raven T' Wax HIL (10) at 0xffe01000 [8/20/1], versions 0x1e, 0x0, 0x73
14. Raven T' Wax RS-232 (10) at 0xffe02000 [8/20/2], versions 0x1e, 0x0, 
0x8c
15. Raven T' Wax EISA BA (11) at 0xfc000000 [8/20/5], versions 0x1e, 
0x0, 0x90,  additional addresses: 0xffc88400 0xf4000000
16. U2-IOA BC GSC+ Port (7) at 0xf3fbf000 [8/63], versions 0x501, 0x1, 
0xc,  additional addresses: 0xf3f80000
17. U2-IOA BC Runway Port (12) at 0xfff8a000 [10], versions 0x580, 0x7, 0xb
18. Raven T' GSC Core Graphics (10) at 0xf4000000 [10/16], versions 
0x32, 0x0, 0x85,  additional addresses: 0xf0069000
19. U2-IOA BC GSC+ Port (7) at 0xf3fff000 [10/63], versions 0x501, 0x1, 0xc
20. Raven 120 T' (0) at 0xfffa0000 [32], versions 0x58e, 0x0, 0x4
21. Memory (1) at 0xfffb1000 [49], versions 0x49, 0x0, 0x9
CPU(s): 1 x PA7200 (PCX-T') at 120.000000 MHz

And, at the office, I use to obtain around nice 1Mb/s when I do such 
rsync or ftp between my b180 connected via a hub.

But here at home, I connect the builtin nic of my c110 with a 
cross-cable to my pc (proxy) and I just obtain 50kb/s (whatever the 
kernel I boot 2.4 or 2.6) (ie 20 time less then with a another pc 
connected in place of the c110). Is it possible to improve the 
performance of this builtin nic?

Thanks in advance,
	Joel
