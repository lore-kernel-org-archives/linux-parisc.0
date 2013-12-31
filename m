From: Dave Land <xmechanic@landcomp.net>
Subject: Possibility that /dev is not being properly populated by udev?
Date: Mon, 30 Dec 2013 22:08:52 -0700
Message-ID: <52C25164.9060206@landcomp.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: John David Anglin <dave.anglin@bell.net>,
	Helge Deller <deller@gmx.de>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hiya folks,

This is more of request for the collective minds to get together and 
discuss a possible fix, rather than a direct question. I own 2 of the 
machines that represent 3 of the current buildd servers for the hppa 
unstable port. Between Helge Deller, Dave Anglin, and myself, we're 
attempting to repopulate the repos at debian.ports with fresh packages, 
and for the most part it's been going pretty well. You can see our 
progress here: http://unstable.buildd.net/index-hppa.html Helge has 
developed a couple of experimental kernels to alleviate some of the 
buildd issues, etc. but we are still plagued with udev mis-interpreting 
device ID's when populating /dev.

As a result, it becomes a real issue when external drives or other 
devices are attached to the host. After our latest crash with 
rio.landcomp.net last night, (hardware related this time) assisted by a 
possible buildd error, I opened the machine up (RP2470 A500), and 
removed a failing Symbios SCSI card and replaced it with another. In the 
past, I've had several issues with this card detecting the external 
drive array (HP 2110), and usually I had to ID the drives in fdisk by 
LABEL in order for /etc/fstab to mount them in the proper locations.

Also there was the issue of the Symbios card repeatedly resetting the 
SCSI bus at startup to the point where fsck.ext3 would finally die with 
Signal 8, when it couldn't find the drives to check. When the card 
finally got around to detecting the drives, the OS was practically fully 
loaded and I would have to manually mount them. With the number of 
re-boots we have to do with hung kernels, unrecoverable buildd errors, 
etc. this turned in a real pain.

I then hooked the external drive array to the Ultra2 LVD/SE SCSI port on 
the 'rio' machine itself, and lo and behold, the internal SCSI BIOS 
found them immediately. Everything was fine until we determined that the 
drive order as listed in fdisk-l and blkid wasn't even close to being 
correct, even though the machine somehow booted from the correct primary 
partition on what would normally be /dev/sda3 since it was referred to 
by LABEL, as is, the drive with the /home partition, which would 
normally be /dev/sdb1. Instead they show up in fdisk-l and blkid as 
/dev/sde3 and /dev/sdd1. In reality, /dev/sdc,sdd,sde, and sdf are the 
four drives in the external array. I set them up with LABEL ID's also, 
except for the swap partitions which I have ID'd by UUID.

I've currently disconnected the externals on both rio.landcomp.net (the 
A500) and hpviz.landcomp.net (the J6750), as both were exhibiting the 
same behavior, regardless of which kernel we were using (the stock 
vmlinux-3.11-1-parisc64-smp or Helge's custom kernel with the buildd 
patches).

Here's the relevant info for the Visualize J6750 'hpviz' in it's current 
state:
Kernel Ver.: *3.11-2-parisc64-smp*
GCC Ver.: *gcc-4.8.2-10*
No remote management card
Access: SSH, local graphics console --> (thanks to Helge's parisc64-smp 
kernel patches, the FXe graphics card is now stable in STI console mode 
(color even!) on 64 bit SMP with >4GB of RAM)
CPU(s): 2x 875mhz. PA-8700
RAM: 7162 Mb.
PCI Devices: LSI Logic dual Port LVD/SE SCSI, HP FXe graphics card

...and the current relevant info for the RP2470 (A500) 'rio'

Kernel Ver.: *3.11-1-parisc64-smp*
GCC Ver.: *gcc-4.8.2-10*
Remote managemment: GSP built-in service processor
Access: GSP, serial line (ttyS0)
CPU(s): 2x 750 mhz. PA-8700
RAM: 8162 Mb.
PCI devices: LSI Logic single port LVD/SE SCSI

I'll include links to the text files for /var/log/syslog and /var/log/ 
messages for both machines (Beware, these are quite lengthy, especially 
since we were trying to setup postfix and all the related utilities on 
the rio, and there's still some glitches in the setup, but it might give 
you some idea of why udev isn't properly populating /dev and assorted 
other issues.)

You are welcome to email myself, Helge Deller, or Dave Anglin with your 
thoughts, and/or possible solutions! Thanks!

By the way, I'm mainly the grunt labor for keeping the actual machines 
up and running, so Dave A. and Helge Deller would be the likely 
candidates to understand all this and give an educated reply to possible 
solutions, but please do include me in the Cc's. I'm still trying to 
absorb all the info I can. :-)

Dave L.

Owner and maintenance tech at Land Computer Service

Links: http://www.landcomp.net:884/images/hpviz-var-log-syslog.txt
        http://www.landcomp.net:884/images/hpviz-var-log-messages.txt
        http://www.landcomp.net:884/images/rio-var-log-syslog.txt
        http://www.landcomp.net:884/images/rio-var-log-messages.txt

-- 
Dave Land
Land Computer Service  xmechanic@landcomp.net
ICQ: 676030523


