From: "Harry Cochran" <h.cochran@comcast.net>
Subject: FW: Can't mount F0 partition as /BOOT
Date: Thu, 24 Feb 2005 23:02:27 -0500
Message-ID: <FHEGKPBPFFGIFBGOANOKMENPEPAA.h.cochran__3380.21649881757$1416623677$gmane$org@comcast.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: <parisc-linux@lists.parisc-linux.org>,
 <debian-hppa@lists.debian.org>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
Resent-Message-ID: <v4KR5D.A.kAH.MTqHCB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

Looks like things have changed since I first put Debian-hppa on my J6000. I
finally got 2.4.17-32 loaded and running after realizing that someone
changed things so that you no longer mount /boot at install, you just greate
a bootable f0 partition and the rest happens by magic, except, of course,
you have to change palo.conf to (in my case) point to 1/vmlinux instead of
1/boot/vmlinux. Next I made the mistake of loading 2.4.26-32-smp and, when I
finally got that to load (you have to point the recoverykernel to the
2.4.26-32-smp image too or otherwise it just keeps loading 2.4.17-32), I got
... "Searching for devices" again. Enough for one day!

-----Original Message-----
From: Harry Cochran [mailto:h.cochran@comcast.net]
Sent: Thursday, February 24, 2005 5:36 PM
To: parisc-linux@lists.parisc-linux.org; debian-hppa@lists.debian.org
Subject: Can't mount F0 partition as /BOOT


Hi,

	I am rebuilding my J6000. I boot from the official Debian hppa install cd,
partition the disks, making a nice 64MB F0 partition that I mark as
bootable, a swap partition and several Linux partitions, initialize the
swap, and then...

	I hit the button to initialze a disk and low and behold the boot partition
I set up is not among the partitions that pop up to be initialized. If I do
"View Paritions", there is sda1 and it's marked --Not Available--.

	I'm sure it's something simple, but I can't see what I'm doing wrong. Your
help will be appreciated.

Thanks,

Harry


--
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact
listmaster@lists.debian.org


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
