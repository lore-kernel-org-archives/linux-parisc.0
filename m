Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA13159
	for <parisc-linux@puffin.external.hp.com>; Thu, 19 Oct 2000 15:35:29 -0600
From: Helge Deller <deller@gmx.de>
Date: Thu, 19 Oct 2000 23:36:44 +0200
Content-Type: text/plain;
  charset="us-ascii"
To: James Waterhouse <james.waterhouse@videotron.ca>,
        "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
References: <200010181654.JAA14222@milano.cup.hp.com> <00101820225400.00316@P100> <39EE1294.B447BF1D@videotron.ca>
In-Reply-To: <39EE1294.B447BF1D@videotron.ca>
Subject: Re: [parisc-linux] booting on 712/60
MIME-Version: 1.0
Message-Id: <00101923364400.00717@P100>
List-ID: <linux-parisc.vger.kernel.org>

Am Wednesday 18 October 2000 23:13 schrieb James Waterhouse:
> Hello Helge,
> 
> Helge Deller wrote:
> > 
> > Am Wednesday 18 October 2000 19:04 schrieb David Huggins-Daines:
> > > Grant Grundler <grundler@cup.hp.com> writes:
> > >
> > > > James Waterhouse wrote:
> > > > > Hello,
> > > > >   I just compiled a ramdisk using mondays cvs src for everything. 
I'm
> > > > > using the graphics console ramdisk file off the 
puffin.external.hp.com
> > > > > (ramdisk20000530-sticon.tgz) to make the ramdisk. Now when I got to 
boot
> > > > > it boots up until the point where the kernel says...
> > > >
> > > > iirc, ramdisk20000530-sticon.tgz uses a "kluge" /dev/tty major/minor
> > number.
> > > > I was reading old mail on this and the kluge to use a different
> > > > major/minor confused me. I was told this was no longer needed.
> > > > So you can use a newer/regular ramdisk.
> > >
> > > Ah!  Actually that triggers my memory.  You *must* append
> > > 'console=tty' to the kernel command line in order to use sticon (or
> > > probably fbcon too for that matter), or else it will default to
> > > serial.
> > >
> > > Usually the PALO makefile handles this for you though.
> > 
> > Yeah, that was the problem ! I just found it too !
> > (And you need to enable getty in /etc/inittab).
> 
> So what did you do to get it to work? You gave 'console=tty' to the
> kernel command line? Where is it that you give the command line? Do you
> have to modify a make file or what? Or are you just running palo/palo
> with args as given in the palo doc? Which ramdisk did you have to modify
> inittab in?
> 
> Jame
> 

Hi James,

Here are some hints:

1. I'm using no ramdisk, but the nfsroot-20001009.tgz, which you can get from 
ftp://puffin.external.hp.com/pub/parisc/binaries/nfsroot/
This has the great advantage, that you can modify all configuration files 
without the need to build a new kernel for every change - but you will need 
to setup one of your machines as nfs-server and export that directory.
More than that, the ramdisks on puffin.external.hp.com are mostly outdated !

2. Take a look at the documention in palo/Makefile. 
There I modified the NFSROOT = 10.10.10.2 to
NFSROOT = 192.168.100.100:/tftpboot/nfsroot    with 192.168.100.100 as the 
IP-address of my local nfs-server and the contents of nfsroot-20001009.tgz in 
/tftpboot/nfsroot.

3. Follow the hints from Thomas Marteau (copied from his mail):

>cat /etc/inittab (! just the interesting thing!)
# /sbin/getty invocations for the runlevels.
#
# The "id" field MUST be the same as the last
# characters of the device (after "tty").
#
# Format:
#  <id>:<runlevels>:<action>:<process>
1:2345:respawn:/sbin/getty 38400 tty1
#2:23:respawn:/sbin/getty 38400 tty2
#3:23:respawn:/sbin/getty 38400 tty3
#4:23:respawn:/sbin/getty 38400 tty4
#5:23:respawn:/sbin/getty 38400 tty5
#6:23:respawn:/sbin/getty 38400 tty6

>cat /etc/securetty
# /etc/securetty: list of terminals on which root is allowed to login.
# See securetty(5) and login(1).
ttyS0
tty1


Helge.
	
