From: Berthold Gunreben <b.gunreben@web.de>
Subject: [parisc-linux] crash without pim info
Date: Fri, 12 Aug 2005 16:22:50 +0200
Message-ID: <113446137@web.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
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


Hi,

when trying to setup a chroot system for compiling packages, my C3600 just=
 crashes with=20

Kernel panic - not syncing: BUG!

when I try to use the SysRq, I just do not get any output:

SysRq : HELP : loglevel0-8 reBoot tErm Full kIll saK showMem Nice showPc u=
nRa
w Sync showTasks Unmount=20
SysRq : Show State
SysRq : Show Memory
SysRq : Show Regs
SysRq : Resetting

What i do then, is reboot and check the pim info: All fields are just 0.
The problem seems to be related to a newly compiled glibc (glibc from CVS,=
 built with gcc4 (gcc version 4.0.2 20050720)) that I want to use in the c=
hroot system. I already upgraded the kernel to kernel 2.6.13-rc6-pa1 (comp=
iled with gcc version 3.3.5).

Does anyone have a hint, how I possibly could get some more information ab=
out this problem=3F=20


Thanks

Berthold
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
Mit der Gruppen-SMS von WEB.DE FreeMail k=F6nnen Sie eine SMS an alle=20
Freunde gleichzeitig schicken: http://freemail.web.de/features/=3Fmc=3D021179



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
