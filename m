From: Dieter Ries <clip2@gmx.de>
Subject: [parisc-linux] [Resend] Again Problems with the k460
Date: Wed, 12 Sep 2007 20:17:39 +0200
Message-ID: <46E82D43.9070702__16948.9098400392$1416624441$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="------------030003050401090109000400"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

This is a multi-part message in MIME format.
--------------030003050401090109000400
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

I just posted this mail to parisc-linux@lists.parisc-linux.org, because
I thought I was on the list because of a crosspost on debian-hppa...
Sorry if that caused any inconvenience.


###############
Hi,

I have asked some questions about linux on a hp9000/889/k460 in march
2006, when I wasn't able to boot neither debian nor gentoo on it. Now I
have some time again, and I am again trying to get the machine working,
together with a friend.

We were now able to boot the latest gentoo liveCD, but we can not
install any system, because our harddisk/s is/are not recognized. there
seems to be some scsi problem. I am not too used to scsi, so maybe those
questions sound stupid to you.

The problem is the following: sometime when we were first able to boot,
we disconnected the internal 2GB scsi disk, I forgot about the exact
reason. When plugging it in again, we apparently broke the plug, so we
can not use that disk anymore. we have to scsi disks, 4 and 9GB, but I
guess, the original disk was wide scsi, and the new ones are ultra wide
or something. the plug matches, but they are definitely more modern.

We have figured out, that the disks don't even spin up if we do not
enable term power with a jumper. But whatever else we enable/disable,
there are the following messages in dmesg:

ncr53c720-3: FATAL ERROR: CHECK SCSI BUS - CABLES, TERMINATION, DEVICE
POWER etc.!

I have attached the related part of dmesg.

Could someone tell me, where our problem is, how we can get those disks
to work, or any other way to finally get something installed on that
machine?

We have two hp disk towers attached to the machine, but they are not
recognized, and we have a BA350, but they are all not connected to the
main unit, but to extension cards, so I don't think we'll be able to use
them as boot media.

And how is it possible, that such an old machine loads modules for USB
storage at boot up? I haven't found any USB ports...  ;-)

cu
Dieter

--------------030003050401090109000400
Content-Type: text/plain;
 name="hp1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="hp1"

zalon_probe: Zalon version 1, IRQ 66
ncr53c720-0: rev 0xf irq 66
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
scsi0 : ncr53c8xx-3.4.3g
zalon_probe: Zalon version 1, IRQ 67
ncr53c720-1: rev 0xf irq 67
ncr53c720-1: ID 7, Fast-10, Parity Checking, Differential
scsi1 : ncr53c8xx-3.4.3g
zalon_probe: Zalon version 1, IRQ 68
ncr53c720-2: rev 0xf irq 68
ncr53c720-2: ID 7, Fast-10, Parity Checking, Differential
scsi2 : ncr53c8xx-3.4.3g
zalon_probe: Zalon version 1, IRQ 69
ncr53c720-3: rev 0xf irq 69
ncr53c720-3: ID 7, Fast-10, Parity Checking, Differential
ncr53c720-3: suspicious SCSI data while resetting the BUS.
ncr53c720-3: dp1,d15-8,dp0,d7-0,rst,req,ack,bsy,sel,atn,msg,c/d,i/o = 0x20120, expecting 0x100
ncr53c720-3: FATAL ERROR: CHECK SCSI BUS - CABLES, TERMINATION, DEVICE POWER etc.!
ncr53c720-3: detaching...
zalon_probe: Zalon version 1, IRQ 69
ncr53c720-3: rev 0xf irq 69
ncr53c720-3: ID 7, Fast-10, Parity Checking, Differential
scsi4 : ncr53c8xx-3.4.3g
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi5: 53c710 rev 2
scsi5 : LASI SCSI 53c700
scsi 5:0:2:0: CD-ROM            TOSHIBA  CD-ROM XM-4101TA 1084 PQ: 0 ANSI: 2
 target5:0:2: Beginning Domain Validation
 target5:0:2: asynchronous
 target5:0:2: FAST-5 SCSI 4.2 MB/s ST (236 ns, offset 8)
 target5:0:2: Domain Validation skipping write tests
 target5:0:2: Ending Domain Validation

--------------030003050401090109000400
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--------------030003050401090109000400--
