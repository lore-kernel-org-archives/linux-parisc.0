Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA09321
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Oct 1999 00:27:20 -0600
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id CAA20657
	for <parisc-linux@thepuffingroup.com>; Fri, 1 Oct 1999 02:44:45 -0400
Sender: adevries@thepuffingroup.com
Message-ID: <37F4585D.818C796D@thepuffingroup.com>
Date: Fri, 01 Oct 1999 02:44:45 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] registering device drivers
List-ID: <linux-parisc.vger.kernel.org>

So the step after finding modules is to be able to get device drivers to
be loaded when modules are found.

I've got the start of this going, and now I get this as output:
    
Found devices:
0. Phantom PseudoBC GSC+ Port (7) at 0xffc00000, versions 0x504, 0x0,
0x0, 0x0,0
1. Phantom PseudoBC GSC+ Port (7) at 0xffc01000, versions 0x505, 0x0,
0x0, 0x0,0
2. HP HSC-PCI Cards (4) at 0xfff84000, versions 0x4, 0x0, 0x9d, 0x0,
0x80
3. HP HSC-PCI Cards (4) at 0xfff88000, versions 0x4, 0x0, 0x9d, 0x0,
0x80
4. Staccato L2 180 (A Class 180) (0) at 0xfffbe000, versions 0x516, 0x0,
0x4, 01
5. Staccato L2 180 Memory (1) at 0xfffbf000, versions 0x8b, 0x0, 0x9,
0x0, 0x0
6. Staccato 180 Lasi (11) at 0xffd00000, versions 0x5f, 0x0, 0x81, 0x0,
0x0
7. Staccato 180 Core LAN RS-232 (10) at 0xffd05000, versions 0x5f, 0x0,
0x8c, 00
8. Staccato 180 Core SCSI (10) at 0xffd06000, versions 0x5f, 0x0, 0x82,
0x0, 0x0
9. Dino PCI Bridge (13) at 0xfff80000, versions 0x680, 0x3, 0xa, 0x0,
0x0
That's a total of 10 devices.
in register_driver
Dino callback called, should be at 0xfff80000
Dino callback called, should be at 0xfff84000
Dino callback called, should be at 0xfff88000
in register_driver
callback for Lasi at HPA 0xffd00000

Here, you can see it finding all the hardware, then loading the Dino and
Lasi drivers at the appropriate HPAs.  Of course, the dino and lasi
startups are just shells, but the drivers can now be fixed to actually
*do* something (like find more devices on it's own bus, and register
those).

The system should work pretty well: device drivers can be registered at
any time (when registering them, they check to see if any devices need
driving), and devices can be registered at any time (checking to see if
there's any available drivers for them).

I'll commit some of this tomorrow. My changes offer the skeletons of
what needs to be in lasi.c and dino.c, those'll be have to be filled in.

- Alex

-- 
Alex deVries
Vice President of Engineering
The Puffin Group
