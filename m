Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailc.telia.com (mailc.telia.com [194.22.190.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 411AD482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 20 Jan 2002 06:11:01 -0700 (MST)
Received: from d1o999.telia.com (d1o999.telia.com [195.67.201.241])
	by mailc.telia.com (8.11.6/8.11.6) with ESMTP id g0KDAuU20527
	for <parisc-linux@lists.parisc-linux.org>; Sun, 20 Jan 2002 14:10:56 +0100 (CET)
Received: from finkel (h186n1fls20o999.telia.com [213.64.112.186])
	by d1o999.telia.com (8.10.2/8.10.1) with SMTP id g0KDAur27947
	for <parisc-linux@lists.parisc-linux.org>; Sun, 20 Jan 2002 14:10:56 +0100 (CET)
From: =?iso-8859-1?Q?Bj=F6rn_Bylander?= <bjorn.bylander@telia.com>
To: <parisc-linux@lists.parisc-linux.org>
Date: Sun, 20 Jan 2002 14:10:55 +0100
Message-ID: <DLEJJFGDAJICFFBHFNCDAEAPCEAA.bjorn.bylander@telia.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Booting to ISL with Linux installed
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

Hello,

I recently acquired a HP 712/80 system. I've installed PA-RISC Linux =
0.9.3 on it and it runs fine.
I've got one problem though. I don't know how to get to ISL after I =
installed Linux.
The reason I want to use ISL is that I want to (try) to make the machine =
use a serial console.
Before I installed Linux the machine booted into ISL automatically as =
the HD was wiped (or at least not bootable) but if I try to boot to ISL =
now with 'boot pri isl' (from BOOT_ADMIN) I only get to the =
'configuration mode' of PALO where you can enter the kernel and other =
boot stuff.

All in all, how can I get to the ISL> prompt so that I can use 'conspath =
2/0/4.0x283'?

Thanks in advance,
Bj=F6rn Bylander
