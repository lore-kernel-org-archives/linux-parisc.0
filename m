Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from xo.hp.is (xo.hp.is [194.105.242.199])
	by dsl2.external.hp.com (Postfix) with ESMTP id 36C52482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Oct 2001 10:47:37 -0600 (MDT)
Received: (from ra@localhost)
	by xo.hp.is (8.11.6/RA-8.11.6) id f9BGlZi06973
	for parisc-linux@lists.parisc-linux.org; Thu, 11 Oct 2001 16:47:35 GMT
Date: Thu, 11 Oct 2001 16:47:35 +0000
From: Richard Allen <ra@hp.is>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011011164735.I4861@hp.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] B2000
List-ID: <linux-parisc.vger.kernel.org>

I just got a B2000 in and I decided to test it with Linux.

The B2000 is a strange beast.  It's got USB keyboard and mouse.
It has a IDE cdrom drive.

The 0.92 iso began booting and loaded the kernel.   It's console (B2000
is a workstation with a graphical console) went blank and the screen went
into powersaving mode.

Judging by the front panel LCD, things went very bad ;)   It was cycling
through many HPMC and FLT codes.

FLT CBF4: SYS BD
Bad OS HPMC cksm

FLT CBFC: SYS BD
Os hpmc br err

FLT CBF0: SYS BD
HPMC initiated

FLT 500B: SYS BD
Bus timeout



-- 
Rikki.         --  HP Technical Support, RHCE, RHCX, HP-UX Certified Admin.
               --  Solaris 7 Certified Systems and Network Administrator.
Bell Labs Unix --  Reach out and grep someone.
Those who do not understand Unix are condemned to reinvent it, poorly.
