Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12507.mail.yahoo.com (web12507.mail.yahoo.com [216.136.173.199])
	by dsl2.external.hp.com (Postfix) with SMTP id B05854829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 26 Aug 2002 14:50:42 -0600 (MDT)
Message-ID: <20020826205041.96985.qmail@web12507.mail.yahoo.com>
Date: Mon, 26 Aug 2002 13:50:41 -0700 (PDT)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: RE: [parisc-linux] SCSI Disks on a K580 Help Required
To: Steve.Grady@csiro.au, a_eisner@eisner.com
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <49AA3A3C863E5B4C911320AEF99E5DA3010CCCC4@wing-ep.tip.csiro.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

I have the proper intenal cable for a K-Class in my spare parts case in
my van.  I think I have a couple of them in there for emergencies.  I
could spare one, but I guess you would have to be willing to pay for
shipping to the land of the Aussies.... ;)  Having worked on litterally
thousands of K-Class servers, I have never seen a drive smoke as a
result of the wrong termination or wrong type of bus.  I have however
seen it smoke the interface it was plugged into.  Usually it blows the
fuse on the board for the scsi bus.  Sometimes that fuse is replaceable
sometimes not.  The fuse for the K-Class internal disks is located on
the Core I/O board.  It's got a clear top/black bottom and just pulls
out of it's socket.  It has 2 legs that you should be carefull not to
break.  You can Ohm it with an Ohm meter to see if it's opened up or
not.  I would check with the Maxtor site and reference the model number
of the drive to find out whether or not it's LVD or HVD.  HVD is what
you need.  If the bus speed is 40MB/s than it's HVD.  If it's 80MB/s or
higher it's LVD and not useable unless you connect it to the single
ended bus.  HP does not support 3rd party boot disks as a general rule
and most drives will not boot HP-UX without HP firmware in them.  That
HP firmware is usually on Seagate or IBM disks.  HP has used Quantums
and others in it's workstations and even in that case it is a different
firmware level than in the servers.  Don't know if the drive not having
HP firmware could be an issue too.  If the fuse is blown I could drop
one of those in the box too.....have a bag of those laying around and
we don't replace fuses anymore.  Board swaps only even if it's just the
fuse that is blown.

derek

--- Steve.Grady@csiro.au wrote:
> 
> 
> > -----Original Message-----
> > From: Averell Eisner [mailto:a_eisner@eisner.com]
> > Sent: Monday, 26 August 2002 8:27 AM
> > To: Steve.Grady@csiro.au
> > Cc: parisc-linux@lists.parisc-linux.org
> > Subject: Re: [parisc-linux] SCSI Disks on a K580 Help Required
> > 
> > 
> > Possible issues:
> > 
> > "First try." The internal disk drives in the K580 are fast wide 
> > differential. The differential is high voltage differential, not
> low 
> > voltage differential. Could be that the Maxtor 4.5GB UW is 
> > the wrong type.
> 
> 
> Well I hope I have not damaged the drive
> 
> 
> > 
> > "Second try." The normal cable in the K580 that goes to the 
> > tape and CD 
> > only has two open scsi connections plus the terminator. One 
> > connection 
> > for tape, another for the CD. Did you substitute another cable with
> a 
> > third open scsi connection?
> 
> 
> Yes I substituted another cable (It did not come with any cables,
> they were
> removed with the drive)
> It was properly terminated by an external terminator. As I said after
> boot
> from the CD a drive on the
> single ended bus was detected ( and the CD and Tape) by the kernel
> but was
> not detected by boot.
> 
> It has been suggested by someone else (they did not reply to list)
> that I
> boot from CD which seems to me
> the easiest work-around.
> 
> Thank for the assistance,
> 
> 
> Steve Grady
> 
> > 
> > Just guessing.
> > 
> > Averell
> > Steve.Grady@csiro.au wrote:
> > 
> > > Hi,
> > > 
> > > I got my hands on a K580 Quad processors, 4G Ram, CD, DDS3 
> > Tape drive,
> > > 2 Fibre Channels on HSC, Dual 100BaseT network connectors on HSC,
> > > FW SCSI on HSC and 2 SCSI interface on HPPB (OK I know the 
> > HPPB is not
> > > supported)
> > > but no hard disks.
> > > 
> > > Previously I have installed PA-Linux on a 735/125.
> > > 
> > > I am trying to install 
> > palinux-2.4.18-pa59-ppc-20020728-netinstall image on
> > > the K580
> > > I am using a variety of SCSI disks I am trying to install 
> > to but I am having
> > > problems.
> > > 
> > > The disks are being installed internally on the K580. I 
> > have downloaded the
> > > users guide
> > > from docs.hp.com.
> > > 
> > > First Try
> > > 
> > > I installed Tape and CD to Single ended bus of the Disk 
> > cage and install a
> > > Maxtor Altas II
> > > 4.5G UW to ultra wide bus of Disk Cage and yes the cable 
> > was terminated.
> > > 
> > > The boot process found the CD, DDS3 but not the disk. I 
> > could boot from CD
> > > but the installer 
> > > complained about on disk.
> > > 
> > > Second Try
> > > 
> > > I installed Tape and CD to Single ended bus of the Disk 
> > cage and install a
> > > Seagate
> > > 2.1G SE to SE bus of Disk Cage in parallel with the CD and Tape.
> > > 
> > > The boot process found the CD, DDS3 but not the disk. I 
> > could boot from CD
> > > but the installer 
> > > found the disk CD and Tape. I installed to disk and at 
> > reboot boot could not
> > > find the disk
> > > only the tape and the CD.
> > > 
> > > All other trys
> > > 
> > > I have tried various combinations but have not succeed in 
> > get the boot to
> > > recognised the
> > > hard disk. I cannot get Pa-linux to recognised the Ultra 
> > Wide bus which
> > > leaves me to question
> > > whether it is supported or do I have a hardware problem.
> > > 
> > > The Boot reports through its Search for Boot devices 
> > function that it finds
> > > 
> > > The 2 FC devices
> > > the Lan (which I assume is the 10BaseT on the Core IO not 
> > the 100BaseT)
> > > a sequential device (Tape Drive)
> > > a random device (CD)
> > > 
> > > The primary boot device at present seems to me to be set up 
> > for the Fibre
> > > Channel
> > > (I think the I am not used to the addressing).
> > > 
> > > I have thought of Rboot or tftboot the K580 from the 
> > 735 and then the
> > > kernel will
> > > recognise the disk. But this is not useful in the long 
> > term as I may get
> > > rid of the 735
> > > and my Intel box which is my main server as I want to make 
> > the K580 my main
> > > server.
> > > 
> > > Any help or suggestions would be appreciated,
> > > 
> > > 
> > > Steve Grady
> > > 
> > > BTW Thanks for a great port my little 735 just sits there 
> > and works (mostly
> > > running SETI)
> > > _______________________________________________
> > > parisc-linux mailing list
> > > parisc-linux@lists.parisc-linux.org
> > > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> > > 
> > > 
> > 
> > 
> > -- 
> > Averell
> > 
> > Eisner Associates, Inc.			Phone: 908-233-6585
> > 516 North Ave. East			FAX:   908-233-0710
> > P.O. Box 2489
> > Westfield, NJ 07090
> > 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


__________________________________________________
Do You Yahoo!?
Yahoo! Finance - Get real-time stock quotes
http://finance.yahoo.com
