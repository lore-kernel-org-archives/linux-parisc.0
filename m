From: Guy Martin <gmsoft@gentoo.org>
Subject: [parisc-linux] statfs() problem with glibc-2.5
Date: Mon, 12 Feb 2007 10:28:44 +0100
Message-ID: <20070212102844.f045d760.gmsoft__33436.6176663481$1416624286$gmane$org@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


Hi all,


While running and testing glibc-2.5, I've encountered the following problem :

hope bin # ./df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/sda3             276Y  276Y  539Z 100% /
sysfs                18641256972210Y 18634655137640Y 70815813734120Y  21% /sys
udev                 18641256972210Y 18634655137640Y 70815813734120Y  21% /dev
devpts               18641256972210Y 18634655137640Y 70815813734120Y  21% /dev/pts
shm                  18641256972210Y 18634655137640Y 70815813734120Y  21% /dev/shm
usbfs                18641256972210Y 18634655137640Y 70815813734120Y  21% /proc/bus/usb
playa:/usr/portage/distfiles
                     18641256972210Y 18634655137640Y 70815813734120Y  21% /usr/portage/distfiles
/dev/sdb4            18641256972210Y 18634655137640Y 70815813734120Y  21% /mnt/gentoo
/dev/sdb2            18641256972210Y 18634655137640Y 70815813734120Y  21% /mnt/gentoo/boot


Despite the fact that I whish I had that capacity, there is definately an issue.

This is using glibc-2.5, 2.6.20-pa0 and corresponding headers.


Let me know if you need more info.

Cheers,
  Guy



-- 
Guy Martin
Gentoo Linux - HPPA port lead

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
