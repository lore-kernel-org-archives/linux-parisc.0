Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA01839
	for <parisc-linux@puffin.external.hp.com>; Mon, 30 Oct 2000 15:36:29 -0700
Received: (from pdbeal@localhost)
	by Ci271622-a.lusvil1.ky.home.com (8.9.3/8.9.3) id RAA23786
	for parisc-linux@thepuffingroup.com; Mon, 30 Oct 2000 17:40:31 -0500 (EST)
	(envelope-from pdbeal)
Date: Mon, 30 Oct 2000 17:40:31 -0500
From: Phillip Beal <pdbeal@bealz.net>
To: parisc-linux@thepuffingroup.com
Message-ID: <20001030174030.A23768@Ci271622-a.lusvil1.ky.home.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Boot Problems with 755
List-ID: <linux-parisc.vger.kernel.org>

Hey,

I've been reading and building the PARISC port for a couple of months
now, and I've hit a problem.  I have a 755 that I can work with that I
have been able to get to boot.  However, once the system boots the
latest kernel stuff, it fails on loading the nfsroot system.  The
machine never was able to successfully boot a kernel untill today, but
the system dies before it tries to load the nfsroot disk.  Here's my
problem:

The system boots fine from a SuSE 7.0 Professional System running
tftp, bootp, nfs, and rboot (rboot is what is actually booting from
since the system is too old to be able to bootp from, or at least that's
what Ive found from reading and from talking to some people.)  However,
the Kernel reports all the devices in the system (all 16), but returns
this error:

IP-Config: No network devices available

I know this was a problem on some people with a different system, but
the same fix doesn't work with the 755 since it has no PCI bus.  The
kernel returns this for the LAN adapter, but I don't know what to
compile to enable this device:

Coral II Core LAN (802.3) (10) at 0xf0826000, versions 0xa, 0x0, 0x72,
0x0, 0x0

What do I need to do to be able to use this LAN adapter, if its even
supported right now.  Alternatively, can the HP 755 machine boot through
the serial connection or something other than the LAN adapter?

Thanks,
--
Phillip Beal
S+LUG Vice-President - http://www.slug.louisville.edu/
 
