Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id CF1F9482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Aug 2001 05:44:13 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 44E90B00C; Tue, 28 Aug 2001 12:45:47 +0100 (BST)
Date: Tue, 28 Aug 2001 12:45:47 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Jaime Ash <jaimeash@home.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: FW: [parisc-linux] Creating the installation CD
Message-ID: <20010828124547.M7064@linuxcare.com>
References: <NEBBJAILOLAHGDBEOCIOKEGOCFAA.jaimeash@home.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <NEBBJAILOLAHGDBEOCIOKEGOCFAA.jaimeash@home.com>; from jaimeash@home.com on Fri, Aug 17, 2001 at 06:28:27PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Aug 17, 2001 at 06:28:27PM -0700, Jaime Ash wrote:
> I finally succeeded in recording a CD using MSWindows and Easy CD Creator,
> but I am
> having a lot of problems trying to install version 0.9.2 on my HP 715 W/S.
> The problems
> I have encountered so far are:
> 
> 1. The first step in the installation menus (Configure the Keyboard) doesn't
> seem to work:
> after I followed its first 2 or 3 instructions (choosing US QWERTY keyboard)
> the keyboard arrows
> and the Return key stop functioning normally (or sometimes don't work at
> all).

Is this an HIL keyboard?  If so, as noted in the README, you should
not select a keymap.

> 2. If I skip the first step and go on to and complete Partition a Hard Disk
> (selecting my
> /dev/sdb drive, since my sda boots HPUX) I am able to complete successfully
> the following
> five steps:
> 	Initialize and Activate a Swap Partition
> 	Initialize a Linux Partition (I did this to /dev/sdb3 and /dev/sdb4)
> 	Install Operating System Kernel and Modules
> 	Configure Device Driver Modules (I did kernel/fs/fat, kernel/fs/msdos and
> kernel/fat/nfsd)
> 	Configure the Network
> 
> But, I am having trouble with the step "Install the Base System":  When I
> try to follow this step,
> choose CD-ROM drive and press Continue I get the message "The CD-ROM was not
> mounted successfully".
> If I press again Continue and attempt again to do "Install the Base System",
> I then get to a point
> where I am asked to choose a directory.  If I click OK (without choosing
> anything; i.e. with the
> choice field all blue) it asks me to "Select an Archive path" and shows a
> default of /insmnt. If I
> press Return, I get an "Important Note" telling me to install the 'testing'
> distribution (woody)
> rather than sid.  If I then hit continue, I am presented with 2 choices:
> 	testing: 'woody' - Debian Testing - Not Released
> and 	unstable: 'sid' - Debian Unstable - Not Released
> 
> If I choose 'woody', I get an Error message: Failed getting release file
> 	file: /instmnt/dists/woody/Release
> If I try the second ('sid') I am given a Warning that this is an unstable
> distribution, has Major
> bugs and the default is do not install.
> 
> I have then tried many times to repeat "Install the Base System", searching
> for the correct
> directory within the installation CD that has the Release version of the
> 0.9.2 PALINUX without
> success: no matter where I look within the CD I am always presented with the
> same 2 choices:
> 	testing: 'woody' - Debian Testing - Not Released
> and 	unstable: 'sid' - Debian Unstable - Not Released
> 
> I finally decided to ignore the Warning and I succeeded at installing the
> unstable 'sid' version,

Yes, the README tells you to install 'sid'.  I don't know why you got the
'cd not mounted successfully' message.

> except that at some point in the installation process I got the Warning:
> "Creating empty exim.conf
> so exim installs okay".  At a later point in the installation process I am

Yes, that dialog is expected, and harmless.

> given the default choice
> of Make the System Bootable, and if I choose that, I then get the choices:
> 	Next	   : Make a boot Floppy
> and	Alternate: Reboot the System
> 
> If I choose the first, I get a message that there is a Problem and asked to
> check if the floppy is
> write-protected (which it is not) or that I put it in the first (?) (Do you
> mean to check if the
> floppy is in the drive, before clicking the first choice "Make a boot
> Floppy"?)  That's what I did,
> but it didn't work.

As the README on the CD says, creating a boot floppy doesn't work atm.

> I then chose the second: "Reboot the System" and I was able to boot OK to
> the Debian System Configuration
> screen (except that I randomly get the following messages:
> 	ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN
> 	skb: pf=2 (unowned) dev=lo len=328
> 	PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16

Known problem with dhcp-client.  To get round this, remove the links
under /etc/rc?.d/ which start dhcp-client.

> I was then able to successfully go through most of the Debian System
> Configuration screens until I got
> to the Apt Configuration, where I got the message "Cannot access security
> updates" on security.debian.org.

There are no secutiry updates for this s/w yet - it is unstable and
not an official debian release.

> After choosing Continue, I was able to complete the installation and I am
> able to log in as root.
> But, I still get the same random messages:
> 	ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN
> 	skb: pf=2 (unowned) dev=lo len=328
> 	PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16
> 
> One other thing I noticed is that, even though I had assigned the address
> 192.168.1.205 to my workstation
> (and I chose not to use DHCP), I found out that the machine'd address was
> instead 192.168.1.102, and I think
> that it is using DHCP.  (How can I verify this?)

dhpc-client should not be run from the startup scripts, but should only
be run when requested, via ifup/ifdown scripts.  As noted above, remove
the relevant /et/rc?.d entries.

> So my question is how do I install the Release version of the 0.9.2 PALINUX?

Sounds like you have already done that, most of your problems were
documented in the top level README on the CD.

Richard
