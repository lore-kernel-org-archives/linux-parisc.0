From: "Harry Cochran" <h.cochran@comcast.net>
Subject: Can't mount F0 partition as /BOOT
Date: Thu, 24 Feb 2005 17:36:19 -0500
Message-ID: <FHEGKPBPFFGIFBGOANOKGENNEPAA.h.cochran__20954.466777812$1416623678$gmane$org@comcast.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: <parisc-linux@lists.parisc-linux.org>,
 <debian-hppa@lists.debian.org>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
Resent-Message-ID: <Zj_r1.A.QfE.dhlHCB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

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
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
