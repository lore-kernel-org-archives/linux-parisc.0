Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnmg1.net.external.hp.com (bbnnmg1.net.external.hp.com [155.208.254.184])
	by dsl2.external.hp.com (Postfix) with ESMTP id C0398482B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Dec 2001 11:37:33 -0700 (MST)
Received: from meuse.BELGIUM.HP.COM (meuse.belgium.hp.com [15.160.6.250])
	by bbnmg1.net.external.hp.com (Postfix) with SMTP id CB5BCF
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Dec 2001 19:36:54 +0100 (MET)
Message-ID: <CDB09D386161D411881900D0B77FBBC106521DA2@ibsen.sweden.hp.com>
From: "JOERGENSEN,RUNAR (HP-Norway,ex1)" <runar_joergensen@hp.com>
To: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Date: Mon, 17 Dec 2001 19:37:23 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Startup problem X
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

Greetings

I'm having X startup problems with a C200 (Raven/U+)
and 20" Color monitor (1280x1024, A4331D). I'm using=20
the framebuffer driver ("fbdev"), but I never get passed the=20
"Shadow framebuffer" part. X crashes complaining
about: FBIOPUT_VSCREENINFO: invalid argument
AddScreen/ScreenInit failed for driver 0

I would have loved to share some logs, but this unit=20
is not on net...yet.=20

I've looked around and tried a couple of different=20
Xf86config files. Does anyone have a sample config=20
file to share with the above setup?=20

XFree86 version: 4.1.0.1
OS: Linux 2.4.9-pa79 parisc64 [ELF]=20

Regards,
Runar J=F8rgensen=20
