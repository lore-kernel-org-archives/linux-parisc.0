From: "J. L. Lee" <jllee@singnet.com.sg>
Subject: Setting up IDE CD-ROM on HPPA B2000
Date: Tue, 05 Jul 2005 15:15:20 +0800
Message-ID: <5.1.1.6.1.20050705144330.02b5c6f0__19492.7591168836$1416623834$gmane$org@pop.singnet.com.sg>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii";
  format=flowed
To: <debian-hppa@lists.debian.org>,
 <parisc-linux@lists.parisc-linux.org>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
Resent-Message-ID: <t-ElP.A.ZZC.mOjyCB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

Hi,

I have seen several postings mentioning about IDE CD-ROM drives crash the 
HPPA boxes while running Linux. I myself also encoutered it repeatedly of 
late after succesfully trying various ways to go round it. Thanks to Max 
Grabert's help, I have now set it up as IDE-SCSI CD-ROM drive and it seems 
to be holding steady so far without me having to try some tricks as before.

If you are interested, followings are what I have done to set up the IDE 
CD-ROM as IDE-SCSI CD-ROM under the patient guidance of Max Grabert:

1) Run 'make menuconfig' (or equivalent), select 'Device drivers -> 
ATA/ATAPI/MFM/RLL support -> SCSI emulation support' to compile as module 
(or into kernel if you prefer);

2) In the same 'make menuconfig' (or equivalent), deselect 'Device drivers 
-> ATA/ATAPI/MFM/RLL support -> Include IDE/ATAPI CDROM support' if it is 
selected;

3) In the same 'make menuconfig' (or equivalent), make sure that required 
CD-ROM file systems are selected under the 'File Systems',

4) Edit palo config file '/etc/palo.conf' to add 'hda=ide-scsi'  at the end 
of the command line entry (the 1st entry);

5) Recompiled the kernel;

6) Run /sbin/palo;

7) If you compile any of the the above drivers as modules, please make sure 
they are also loaded on boot by adding the following lines into /etc/modules:

iso9660
udf
ns87415
ide-scsi
sg
sr_mod

8) Reboot.

Remember from now on your IDE CD-ROM drive will be known as /dev/scdX. 
/dev/scd0 in my case.

Rgds,
Lee

ps. Any downside in setting up IDE CD-ROM as IDE-SCSI CD-ROM?

pps. You might see the following msg but I believe it is harmless:

modprobe -k ide-mod options="hda=ide-scsi"
FATAL: Module ide_mod not found.


pps. You might also see the following msg: (Does 'deprecated for cd 
burning' msg mean that we can burn CDs if we have a CD/RW drive?)

ide-scsi is deprecated for cd burning! Use ide-cd and give dev=/dev/hdX as 
devicescsi1 : SCSI \ host adapter emulation for IDE ATAPI devices Vendor: 
MITSUMI   Model: CD-ROM FX4820T!B  \ Rev: F01M Type: CD-ROM ANSI SCSI 
revision: 02 sg

Attached scsi generic sg0 at scsi0, channel 0, id 6, lun 0,  type 0Attached 
scsi generic sg1 at \ scsi1, channel 0, id 0, lun 0,  type 5sr0: scsi3-mmc 
drive: 48x/48x cd/rw xa/form2 cdda \ trayUniform CD-ROM driver Revision: 
3.20    sr_mod

All modules loaded.




-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
