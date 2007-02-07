From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] Re: glibc nptl failure baseline update.
Date: Wed, 07 Feb 2007 21:44:37 +0100
Message-ID: <eqddnl$rc3$1__1910.90060766346$1416624636$gmane$org@sea.gmane.org>
References: <119aab440702051913m1edfb6ecg535c80d2301c9c11@mail.gmail.com>
	<20070206224246.3000a76c.gmsoft@gentoo.org>
	<119aab440702061358s5c0ee062l65eaff50429ada47@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: debian-glibc@lists.debian.org
To: parisc-linux@parisc-linux.org
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

>> tst-timer4.out :
>> clock_gettime returned timespec = { 1170787417, 996313000 }
>> clock_getres returned timespec = { 0, 4000250 }
> 
> Unknown.

> Linux hake 2.6.19.2 #2 Thu Feb 1 19:58:15 EST 2007 parisc PA8600 (PCX-W+) 

I don't know this test, but it might be fixed with a newer Linux kernel,
which includes those patches:

[GENERIC_TIME patchset for parisc]:
http://git.parisc-linux.org/?p=linux-2.6.git;a=commit;h=b6de83b58b8b07f057deacdef8a95b6c32d1c4e6

[disable cr16 clocksource when multiple CPUs are online]:
http://git.parisc-linux.org/?p=linux-2.6.git;a=commit;h=f70a979c843e4610edfb2a316648fe8ae8718f69

Helge

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
