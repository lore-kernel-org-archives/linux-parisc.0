Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from crux.tip.CSIRO.AU (crux.tip.CSIRO.AU [130.155.194.32])
	by dsl2.external.hp.com (Postfix) with ESMTP id 76DF44829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Sep 2002 19:02:46 -0600 (MDT)
Received: (from daemon@localhost)
	by crux.tip.CSIRO.AU (8.9.3/8.9.3/TIPAT-1.2a) id LAA20475
	for <parisc-linux@lists.parisc-linux.org>; Wed, 4 Sep 2002 11:02:44 +1000 (EST)
From: Steve.Grady@csiro.au
Message-ID: <49AA3A3C863E5B4C911320AEF99E5DA3010CCCCC@wing-ep.tip.csiro.au>
To: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] IPL Boot Parameters [Originally SCSI Disks on a K5
	80 Help Required]
Date: Wed, 4 Sep 2002 11:02:34 +1000 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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


I have been trying to load debian 3.0 onto my K580 and going around in
circles.

My problem is that I only have disks available that will work on the Single
ended SCSI bus.
The Ultra Wide bus, as has been pointed out previously, is HVD not LVD and I
do not have HVD drives
and they are not easily obtainable at a reasonable price here in Australia.

The PDC will not recognise HD's on the SE bus it will scan them but IMHO the
firmware is set to only
recognise  and use the CD and the DDS-3 tape drive. The kernel, booted from
the CD, will recognise the HD
on the SE bus and will load Linux onto the drive but at reboot time I cannot
find the drive.

It was previously suggested that I boot from the tape which I can do using
the following Lif image
lifimage-2.4.18-pa59-PDC-20020728 but this brings me back to the debian
startup screen for HD initialisation
not the script to setup the system (password and extra packages etc).

I have been going around in circles playing with the IPL boot parameters (
like specifying root=/dev/sds3 deleting initrd etc) trying to get it to
continue setup but unsuccessfully.

Does anyone know, using the above LIF image, what IPL boot parameters to
specify to get it to continue an installation on /dev/sda3 root file system.
Or else what do I load on the tape drive ?

Any help would be appreciated or else I will have to get a HVD SCSI drive.

Thanks,


Steve Grady



> 
> --- Steve.Grady@csiro.au wrote:
> > 
> > 
> > > -----Original Message-----
> > > From: Averell Eisner [mailto:a_eisner@eisner.com]
> > > Sent: Monday, 26 August 2002 8:27 AM
> > > To: Steve.Grady@csiro.au
> > > Cc: parisc-linux@lists.parisc-linux.org
> > > Subject: Re: [parisc-linux] SCSI Disks on a K580 Help Required
> > > 
> > > 
> > > Possible issues:
> > > 
> > > "First try." The internal disk drives in the K580 are fast wide 
> > > differential. The differential is high voltage differential, not
> > low 
> > > voltage differential. Could be that the Maxtor 4.5GB UW is 
> > > the wrong type.
> > 
> > 
> > Well I hope I have not damaged the drive
> > 
> > 
> > > 
> > > "Second try." The normal cable in the K580 that goes to the 
> > > tape and CD 
> > > only has two open scsi connections plus the terminator. One 
> > > connection 
> > > for tape, another for the CD. Did you substitute another 
> cable with
> > a 
> > > third open scsi connection?
> > 
> > 
> > Yes I substituted another cable (It did not come with any cables,
> > they were
> > removed with the drive)
> > It was properly terminated by an external terminator. As I 
> said after
> > boot
> > from the CD a drive on the
> > single ended bus was detected ( and the CD and Tape) by the kernel
> > but was
> > not detected by boot.
> > 
> > It has been suggested by someone else (they did not reply to list)
> > that I
> > boot from CD which seems to me
> > the easiest work-around.
> > 
> > Thank for the assistance,
> > 
> > 
> > Steve Grady
> > 
> > > 
> > > Just guessing.
> > > 
> > > Averell
> > > Steve.Grady@csiro.au wrote:
> > > 
> > > > Hi,
> > > > 
> > > > I got my hands on a K580 Quad processors, 4G Ram, CD, DDS3 
> > > Tape drive,
> > > > 2 Fibre Channels on HSC, Dual 100BaseT network 
> connectors on HSC,
> > > > FW SCSI on HSC and 2 SCSI interface on HPPB (OK I know the 
> > > HPPB is not
> > > > supported)
> > > > but no hard disks.
> > > > 
> > > > Previously I have installed PA-Linux on a 735/125.
> > > > 
> > > > I am trying to install 
> > > palinux-2.4.18-pa59-ppc-20020728-netinstall image on
> > > > the K580
> > > > I am using a variety of SCSI disks I am trying to install 
> > > to but I am having
> > > > problems.
> > > > 
> > > > The disks are being installed internally on the K580. I 
> > > have downloaded the
> > > > users guide
> > > > from docs.hp.com.
> > > > 
> > > > First Try
> > > > 
> > > > I installed Tape and CD to Single ended bus of the Disk 
> > > cage and install a
> > > > Maxtor Altas II
> > > > 4.5G UW to ultra wide bus of Disk Cage and yes the cable 
> > > was terminated.
> > > > 
> > > > The boot process found the CD, DDS3 but not the disk. I 
> > > could boot from CD
> > > > but the installer 
> > > > complained about on disk.
> > > > 
> > > > Second Try
> > > > 
> > > > I installed Tape and CD to Single ended bus of the Disk 
> > > cage and install a
> > > > Seagate
> > > > 2.1G SE to SE bus of Disk Cage in parallel with the CD and Tape.
> > > > 
> > > > The boot process found the CD, DDS3 but not the disk. I 
> > > could boot from CD
> > > > but the installer 
> > > > found the disk CD and Tape. I installed to disk and at 
> > > reboot boot could not
> > > > find the disk
> > > > only the tape and the CD.
> > > > 
> > > > All other trys
> > > > 
> > > > I have tried various combinations but have not succeed in 
> > > get the boot to
> > > > recognised the
> > > > hard disk. I cannot get Pa-linux to recognised the Ultra 
> > > Wide bus which
> > > > leaves me to question
> > > > whether it is supported or do I have a hardware problem.
> > > > 
> > > > The Boot reports through its Search for Boot devices 
> > > function that it finds
> > > > 
> > > > The 2 FC devices
> > > > the Lan (which I assume is the 10BaseT on the Core IO not 
> > > the 100BaseT)
> > > > a sequential device (Tape Drive)
> > > > a random device (CD)
> > > > 
> > > > The primary boot device at present seems to me to be set up 
> > > for the Fibre
> > > > Channel
> > > > (I think the I am not used to the addressing).
> > > > 
> > > > I have thought of Rboot or tftboot the K580 from the 
> > > 735 and then the
> > > > kernel will
> > > > recognise the disk. But this is not useful in the long 
> > > term as I may get
> > > > rid of the 735
> > > > and my Intel box which is my main server as I want to make 
> > > the K580 my main
> > > > server.
> > > > 
> > > > Any help or suggestions would be appreciated,
> > > > 
> > > > 
> > > > Steve Grady
> > > > 
> > > > BTW Thanks for a great port my little 735 just sits there 
> > > and works (mostly
> > > > running SETI)
> > > > _______________________________________________
> > > > parisc-linux mailing list
> > > > parisc-linux@lists.parisc-linux.org
> > > > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> > > > 
> > > > 
> > > 
> > > 
> > > -- 
> > > Averell
> > > 
> > > Eisner Associates, Inc.			Phone: 908-233-6585
> > > 516 North Ave. East			FAX:   908-233-0710
> > > P.O. Box 2489
> > > Westfield, NJ 07090
> > > 
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
> __________________________________________________
> Do You Yahoo!?
> Yahoo! Finance - Get real-time stock quotes
> http://finance.yahoo.com
> 
