Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from femail6.sdc1.sfba.home.com (femail6.sdc1.sfba.home.com [24.0.95.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id 51465482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 17 Aug 2001 19:28:03 -0600 (MDT)
From: "Jaime Ash" <jaimeash@home.com>
To: <parisc-linux@lists.parisc-linux.org>
Cc: "Jaime Ash" <jaimeash@home.com>
Subject: FW: [parisc-linux] Creating the installation CD 
Date: Fri, 17 Aug 2001 18:28:27 -0700
Message-ID: <NEBBJAILOLAHGDBEOCIOKEGOCFAA.jaimeash@home.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

I finally succeeded in recording a CD using MSWindows and Easy CD Creator,
but I am
having a lot of problems trying to install version 0.9.2 on my HP 715 W/S.
The problems
I have encountered so far are:

1. The first step in the installation menus (Configure the Keyboard) doesn't
seem to work:
after I followed its first 2 or 3 instructions (choosing US QWERTY keyboard)
the keyboard arrows
and the Return key stop functioning normally (or sometimes don't work at
all).

2. If I skip the first step and go on to and complete Partition a Hard Disk
(selecting my
/dev/sdb drive, since my sda boots HPUX) I am able to complete successfully
the following
five steps:
	Initialize and Activate a Swap Partition
	Initialize a Linux Partition (I did this to /dev/sdb3 and /dev/sdb4)
	Install Operating System Kernel and Modules
	Configure Device Driver Modules (I did kernel/fs/fat, kernel/fs/msdos and
kernel/fat/nfsd)
	Configure the Network

But, I am having trouble with the step "Install the Base System":  When I
try to follow this step,
choose CD-ROM drive and press Continue I get the message "The CD-ROM was not
mounted successfully".
If I press again Continue and attempt again to do "Install the Base System",
I then get to a point
where I am asked to choose a directory.  If I click OK (without choosing
anything; i.e. with the
choice field all blue) it asks me to "Select an Archive path" and shows a
default of /insmnt. If I
press Return, I get an "Important Note" telling me to install the 'testing'
distribution (woody)
rather than sid.  If I then hit continue, I am presented with 2 choices:
	testing: 'woody' - Debian Testing - Not Released
and 	unstable: 'sid' - Debian Unstable - Not Released

If I choose 'woody', I get an Error message: Failed getting release file
	file: /instmnt/dists/woody/Release
If I try the second ('sid') I am given a Warning that this is an unstable
distribution, has Major
bugs and the default is do not install.

I have then tried many times to repeat "Install the Base System", searching
for the correct
directory within the installation CD that has the Release version of the
0.9.2 PALINUX without
success: no matter where I look within the CD I am always presented with the
same 2 choices:
	testing: 'woody' - Debian Testing - Not Released
and 	unstable: 'sid' - Debian Unstable - Not Released

I finally decided to ignore the Warning and I succeeded at installing the
unstable 'sid' version,
except that at some point in the installation process I got the Warning:
"Creating empty exim.conf
so exim installs okay".  At a later point in the installation process I am
given the default choice
of Make the System Bootable, and if I choose that, I then get the choices:
	Next	   : Make a boot Floppy
and	Alternate: Reboot the System

If I choose the first, I get a message that there is a Problem and asked to
check if the floppy is
write-protected (which it is not) or that I put it in the first (?) (Do you
mean to check if the
floppy is in the drive, before clicking the first choice "Make a boot
Floppy"?)  That's what I did,
but it didn't work.

I then chose the second: "Reboot the System" and I was able to boot OK to
the Debian System Configuration
screen (except that I randomly get the following messages:
	ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN
	skb: pf=2 (unowned) dev=lo len=328
	PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16

I was then able to successfully go through most of the Debian System
Configuration screens until I got
to the Apt Configuration, where I got the message "Cannot access security
updates" on security.debian.org.

After choosing Continue, I was able to complete the installation and I am
able to log in as root.
But, I still get the same random messages:
	ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN
	skb: pf=2 (unowned) dev=lo len=328
	PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16

One other thing I noticed is that, even though I had assigned the address
192.168.1.205 to my workstation
(and I chose not to use DHCP), I found out that the machine'd address was
instead 192.168.1.102, and I think
that it is using DHCP.  (How can I verify this?)

So my question is how do I install the Release version of the 0.9.2 PALINUX?


-----Original Message-----
From: Matt Taggart [mailto:taggart@carmen.fc.hp.com]
Sent: Tuesday, August 14, 2001 5:17 PM
To: Jaime Ash
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Creating the installation CD



"Jaime Ash" writes...

> So my question to you is, what is the process for going from the *.iso
file
> to create the CD.

The file you grabbed is gzipped so you'll need to gunzip it first. Then use
your favorite CD burning software to burn it as is. I use X-CD-Roast but you
can even use MSWindows based programs (or so I've heard).

If you have problems booting, send the errors to the list.

--
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation



-----Original Message-----
From: jaimeash@home.com
To: parisc-linux@lists.parisc-linux.org
Subject: Creating the installation CD


I am in the process of trying to upgrade my PA-Linux machine (model HP 715)
from version 0.6 to version 0.9.2, and also trying to install version 0.9.2
on an HP 735.

I have already extracted the file named "palinux-0.9.2.iso" from the
downloaded file, but I do not know how to proceed from there to create the
installation CD.  (Note that for version 0.6 I had used an installation CD
that I got from Grant Grundler, so I never learned how he created the CD,
and now he is on LOA).

So my question to you is, what is the process for going from the *.iso file
to create the CD.

Sincerely,

Jaime Ash
email: jaimeash@home.com
