Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bloody (bloody.mindless.co.uk [195.224.53.249])
	by dsl2.external.hp.com (Postfix) with ESMTP id 706E74829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 31 May 2003 07:54:39 -0600 (MDT)
Received: from mindless.co.uk (bloody [127.0.0.1])
	by bloody (Postfix) with SMTP id 1379B6A0F8
	for <parisc-linux@lists.parisc-linux.org>; Sat, 31 May 2003 14:54:36 +0100 (BST)
Message-ID: <56739.194.131.108.2.1054389276.squirrel@ssl.mindless.co.uk>
Date: Sat, 31 May 2003 14:54:36 +0100 (BST)
From: "Siraj 'Sid' Rakhada" <sid@mindless.co.uk>
To: <parisc-linux@lists.parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] Installation on a K370 with Debian 3.0r1 + RAID1 boot.
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

A few notes on a successful installation on a HP K370 box, using Debian
3.0r1 and a netinstall CD (for PDC console support). Also the boot disk is
on a RAID1.

Written in the hopes it might help someone, possibly...

This was all done via a console.

Boot with the 2.4.20-pa32 netinstall CD. When it prompts you to interact
with IPL choose yes.
At the following prompt, which sould be PALO, change console=ttyS0 to
console=ttyB0

You should then have the kernel bootup and after a few moments the debian
installer menu should appear

Proceed with the install by following the prompts, taking care to read the
instructions about the partition types.

When you get to the stage where the system wants to reboot do *not* reboot
(yet).

Instead go to a shell

find the /dev directory in /mnt/target somewhere (I have forgotten the
exact location, you can find it with just a 'mount' command and read the
output)

delete the *target* /dev/ttyB0 if it does not look like this:

# ls -l ttyB0
crw-------    1	root	root	11,   0	May 27 07:48 ttyB0

then do

# mknod ttyB0 c 11 0
# CTRL-D (to logout)

You should now be able to reboot safely.

If you skip this step, Debian will boot, but you will be unable to use the
console.
Note I have not actually done the above when I was installing - I cheated
and installed sshd via a chroot setup - because I did not realise the
ttyB0 major number was incorrect on the install CD. I'm expecting that
modifying the device as above should work. If I had more time I would have
tried the above method.

I believe the major number has changed from 30 to 60, and now to 11, which
is it's final resting place (can someone confirm that)?

Once the machine reboots you should be greeted with the Debian second
stage installer - carry on with whatever options you want to pick and you
should then be dropped at a root prompt.

Debian should now be installed on your box (I hope) and that's it. Read
below if you want to have a RAID1 boot drive...

As I had 4 x 9GB disks (all identical) I decided to follow Martin
Petersen's RAID1 boot howto
http://lists.parisc-linux.org/pipermail/parisc-linux/2003-January/018892.html

General packages required: mdadm, palo (>=1.2), and associated debian
build packages.

Most of the steps make perfect sense, though I had a few issues as I
wanted to stick to debian/stable as much as I could - therefore I could
not install the palo 1.2 binary package - which is required if you wish to
boot from a RAID partition.

So what you should do is get hold of the palo 1.2 debian source, and then
you should be able to build the package yourself:

# dpkg-source palo_1.2.dsc
# cd palo-1.2
# dpkg-buildpackage -r fakeroot -b
# dpkg -i ../palo_1.2_hppa.deb

If you are able to upgrade to testing, then this is not a big deal - you
should be able to simply upgrade your palo binary (along with libc etc),
and skip the above steps. Though make sure you have version 1.2 of Palo by
running '/sbin/palo | grep version' - do this as a normal user if you are
worried of breaking things.

I also had an issue as I had multiple partitions for /, /home, /var,
/boot, and /usr so I had to use multiple 'tar' commands (I'm not an expert
on tar, so I'm sure there are better ways than how I did it). I am also
uncertain how Martin's command worked for /boot in his setup too...

Anyway, it was as simple as this: (read in addition to step 5 on the Howto)

Mount new partitions in place. I mounted the RAID / onto /mnt, and then
mounted the RAID /usr onto /mnt/usr etc.

These steps should be done in single user mode - 'init 1' should get you
there (do this via console).

mount /dev/md2 /mnt
mount /dev/md0 /mnt/boot
mount /dev/md3 /mnt/usr
mount /dev/md4 /mnt/home
mount /dev/md5 /mnt/var

cd /mnt
tar -C / -clspf - . | tar -xlspvf -
cd /mnt/usr
tar -C /usr -clspf - . | tar -xlspvf -
cd /mnt/boot
tar -C /boot -clspf - . | tar -xlspvf -
cd /mnt/home
tar -C /home -clspf - . | tar -xlspvf -
cd /mnt/var
tar -C /var -clspf - . | tar -xlspvf -

You should be able to carry right on at step 6 now.

Suggested reading...

Boot Howto: http://tldp.org/HOWTO/PA-RISC-Linux-Boot-HOWTO/index.html
FAQ: http://www.parisc-linux.org/faq/index.html
Also uses the RAID1 Boot Howto:
http://www.parisc-linux.org/faq/raidboot-howto.html

I hope this helps someone! The documentation out there was very useful -
though the ttyB0 change of the major number really got me for a while (I
only found out that this had changed through searching the mailing
list)...

This is also the first time I've ever really used a HP box, and they are
... interesting :) e.g. is it normal that the machine will take about 10+
minutes to boot up? (just to get to the boot ROM, nothing to do with linux
- self tests are enabled, though disabilng them does not make too much of
a difference).

Also, anyone aware if SMP will work on this box? I have two CPU's, but I'm
only using one, as I believe the netinstall CD only comes with a SMP
disabled kernel, and I have not got the 2.4.20 kernel source available at
the moment (The HP box is not connected to the Internet).

Anyway, great project. I'm glad it all works now :)

Best regards,

Sid
