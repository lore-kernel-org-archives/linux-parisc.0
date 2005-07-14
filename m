From: "Joel Soete" <soete.joel@tiscali.be>
Subject: =?ISO-8859-15?Q?RE=3A=20=5Bparisc=2Dlinux=5D=20Debian=20sarge=20netinstall=20hangs=20after=20first=20boot=20on=09b132l?=
Date: Thu, 14 Jul 2005 19:06:28 +0200
Message-ID: <42BAE85600005DFE@mail-6-bnl.tiscali.it>
References: <42D68DCD.3010403@ieee.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: "Dirk Van Hertem" <dirk.vanhertem@ieee.org>,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42D68DCD.3010403@ieee.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


Hello Dirk,

> 
> Hello,
> 
> I got an hp b132l to play with :) and decided to put debian sarge on it=
,
> 
> downloaded the latest netinstall cd from the web (debian site) and 
> installed using serial console.
> 
Just being curious: didn't you try from sti (i.e. builtin graphical inter=
face)?

> The install went ok, after making the initial ramdisk larger (64k 
> instead of 16), and gave no errors, but after the copying of the files

> and doing the first reboot. My system hung. I wasn't able to do anythin=
g
> 
Good to know

> (even the power button didn't work).
> 
> The last message on my console was the following:
> 
> HP SDC: Spunking the self test register to force PUP on next firmware
> reset. HP SDC MLC: Registering the System Domain Controller's HIL MLC.
> 
Yes there are a lot of report on p-l and debian-hppa ml on this subject :=
_(

> Which is strange because there is no HIL stuff in this machine (this ha=
s
> something to do with the keyboard if I'm correct, but the b132l uses 
> ps/2 interfaces for mouse and keyboard).
> 
Yes but afaik the interface exist on this model (see a hpux ioscan) as we=
ll
as on B160L (but not on B180 or B132L+) and it tried to initialize.

> Another strange thing was that the kernel that was chosen during instal=
l
> was a smp kernel? (2.6.8...smp something, I didn't pay real attention a=
t
> that time)
> 
Yes very strange (but I have no clue about debian installer details :-( )=


> When I posted a message concerning this issue on a belgian linux 
> newsgroup, there was someone who said he had experienced the same thing=
,
> and resolved this by booting from a gentoo cd and installing the latest=


> kernel. Probably I'll attempt the same thing later on but I wanted to 
> ask if there are other options or if I made some mistake?
> 
Apparently no mistake :-)

What you coud do also, as the install-cd works fine, is to reboot from th=
is
cd and look for a sub-menu to enter into a shell script.

Here you can setup your nic (to access the web if possible) and mainly mo=
unt
your boot disk.
(e.g. # mkdir /mnt/MyBoot ; mount /dev/sda5 /mnt/MyBoot ; mount /dev/sda6=

/mnt/MyBoot/var;...
according to your slicing: sda5 would be replace by your own root partiti=
on
sda6 your var if there is one, ...)

Then you can chroot to this mount point (e.g. chroot /mnt/MyBoot )
You would then be able to grab one of prebuild kernel e.g. from:
<http://cvs.parisc-linux.org/download/linux-2.6/> (I would recommended th=
e
one for b180 for your b132l)

following instructions at the top of this page :-)

To be sure umount your boot disk and try to reboot.

That should work.

Hth,
    Joel

PS: Don't hesitate to ask if you need more details


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
