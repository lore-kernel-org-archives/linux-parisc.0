From: "J. L. Lee" <jllee@singnet.com.sg>
Subject: Matrox Mystique video card on HP Visualize 785/B2000 with
  rebuilt 2.6.11-rc6-pa1 kernel
Date: Wed, 15 Jun 2005 23:36:10 +0800
Message-ID: <5.1.1.6.1.20050615232931.02a53750__31243.3781022721$1416623803$gmane$org@pop.singnet.com.sg>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii";
  format=flowed
To: <debian-hppa@lists.debian.org>,
 <parisc-linux@lists.parisc-linux.org>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
Resent-Message-ID: <mGhKrC.A.MIB.qsEsCB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

Hi,

I have set up successfully a Matrox Millennum II PCI video card on an HPPA 
RISC B2000 workstation. I now able to connect an HP910 to the Matrox 
Millennum video port running as a text console. (Yet to figure out how to 
configure X Windows.)

However when I plugged in a Matrox Mystique video card (also configured as 
a module in the kernel) the kernel fail to bring it up with the following 
error msgs:

matroxfb: Matrox Mystique (PCI) detected
matroxfb: Cannot determine memory size
matroxfb: probe of 000:01:04.0 failed with error -1

and the kernel booted up normally. Any idea what happened?

The basic h/w configuration are as follows:

1) HP Visualize 785/B2000 with 256 MB of memory, 400 MHz processor & 10 GB 
disk;
2) HP 910 monitor connected to a STI fxe video card (in trouble, I switched 
to ttys0 as the console);
3) Additional Matrox Mystique video card with no monitor connected;
4) No HP/UX. Only Debian GNU/Linux;

Software configuration:

5) Sarge distribution from 27 April ISO images were used for the base 
installation;
6) All packages installed updated/upgraded to the latest available 
(regardless bugs or no bugs, 14 June?);
7) No security updates applied as security.debian.org site can't be 
accessed for some reasons;
8) Kernel source from "linux-2.6.12-rc6-pa1.tar.bz2";

Built the kernel using instructions from "PARISC-LINUX: Building The Kernel 
documentation" by following their "The Old, Grotty Way To Build a Kernel" 
and chose to compile the Matrox acceleration, Matrox Millennum II & 
Mystique and Trident supports into the Kernel as modules. I have also 
created the initial RAM disk by "mkinitrd -o 
/usr/src/linux-2.6.12-rc6-pa1/initrd.img-2.6.12-rc6-pa1 2.6.12-rc6-pa1".

Rgds,
Lee




-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
