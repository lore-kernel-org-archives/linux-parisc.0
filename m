Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from crux.tip.CSIRO.AU (crux.tip.CSIRO.AU [130.155.194.32])
	by dsl2.external.hp.com (Postfix) with ESMTP id CF909482B
	for <parisc-linux@lists.parisc-linux.org>; Sun, 25 Aug 2002 15:33:49 -0600 (MDT)
Received: (from daemon@localhost)
	by crux.tip.CSIRO.AU (8.9.3/8.9.3/TIPAT-1.2a) id HAA01639
	for <parisc-linux@lists.parisc-linux.org>; Mon, 26 Aug 2002 07:33:48 +1000 (EST)
From: Steve.Grady@csiro.au
Message-ID: <49AA3A3C863E5B4C911320AEF99E5DA3010CCCC3@wing-ep.tip.csiro.au>
To: parisc-linux@lists.parisc-linux.org
Date: Mon, 26 Aug 2002 07:33:37 +1000
MIME-Version: 1.0
Content-Type: text/plain
Subject: [parisc-linux] SCSI Disks on a K580 Help Required
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

I got my hands on a K580 Quad processors, 4G Ram, CD, DDS3 Tape drive,
2 Fibre Channels on HSC, Dual 100BaseT network connectors on HSC,
FW SCSI on HSC and 2 SCSI interface on HPPB (OK I know the HPPB is not
supported)
but no hard disks.

Previously I have installed PA-Linux on a 735/125.

I am trying to install palinux-2.4.18-pa59-ppc-20020728-netinstall image on
the K580
I am using a variety of SCSI disks I am trying to install to but I am having
problems.

The disks are being installed internally on the K580. I have downloaded the
users guide
from docs.hp.com.

First Try

I installed Tape and CD to Single ended bus of the Disk cage and install a
Maxtor Altas II
4.5G UW to ultra wide bus of Disk Cage and yes the cable was terminated.

The boot process found the CD, DDS3 but not the disk. I could boot from CD
but the installer 
complained about on disk.

Second Try

I installed Tape and CD to Single ended bus of the Disk cage and install a
Seagate
2.1G SE to SE bus of Disk Cage in parallel with the CD and Tape.

The boot process found the CD, DDS3 but not the disk. I could boot from CD
but the installer 
found the disk CD and Tape. I installed to disk and at reboot boot could not
find the disk
only the tape and the CD.

All other trys

I have tried various combinations but have not susceed in get the boot to
recognised the
hard disk. I cannot get Pa-linux to recognised the Ultra Wide bus which
leaves me to question
whether it is supported or do I have a hardware problem.

The Boot reports through its Search for Boot devices function that it finds

The 2 FC devices
the Lan (which I assume is the 10BaseT on the Core IO not the 100BaseT)
a sequential device (Tape Drive)
a random device (CD)

The primary boot device at present seems to me to be set up for the Fibre
Channel
(I think the I am not used to the addressing).

I have thought of Rboot or tftboot the K580 from the the 735 and then the
kernel will
recognise the disk. But this is not usefull in the long term as I may get
rid of the 735
and my Intel box which is my main server as I want to make the K580 my main
server.

Any help or suggestions would be appreciated,


Steve Grady

BTW Thanks for a great port my little 735 just sits there and works (mostly
running SETI)
