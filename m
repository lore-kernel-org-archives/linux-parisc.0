Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rbadb1.RBACPXCLU.BAS.ROCHE.COM (mail-external-basel.roche.com [196.3.50.190])
	by dsl2.external.hp.com (Postfix) with ESMTP id 15F1A48EF
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Oct 2001 03:28:40 -0600 (MDT)
Received: from CONVERSION-DAEMON.Roche.COM by Roche.COM (PMDF V6.0-025 #47170)
 id <01K8ZH0Z4K5C8ZQ9PL@Roche.COM> for parisc-linux@lists.parisc-linux.org;
 Mon, 01 Oct 2001 11:25:24 +0200
Received: from rbamsemcn1.bas.roche.com
 (rbamsemcn1.bas.roche.com [145.245.211.139])
 by Roche.COM (PMDF V6.0-025 #47170)
 with ESMTP id <01K8ZH0TYXFW90UOB9@Roche.COM> for
 parisc-linux@lists.parisc-linux.org; Mon, 01 Oct 2001 11:24:50 +0200
Date: Mon, 01 Oct 2001 11:25:37 +0200
From: "Del-Grande, Diego {T-HA~Rotkreuz}" <DIEGO.DEL-GRANDE@Roche.COM>
To: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Message-id: <301D223D6FE8D211B5AB0008C7337705018567E1@tromsem1.rok.roche.com>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] CD-ROM BOOT FAILED ON 712/60
List-ID: <linux-parisc.vger.kernel.org>

i'm a member of a hp 712 / 60 ...i want to install hppa-linux 0.9.2. i've burned a hppa-linux cd (0.9.2)...
because my mashine didn't built in a cdrom-drive I attached one external.
if i'm booting the cd i retrived the follow message...

Warning: kernel name doesn't end with 32 or 64... Guessing Annoyance: Firmaware does not support PDC_MODEL_CAPABILITIES call
32
Couldn't grok your kernel executable format
failed to load kernel

my firmware is 2.3 ... the newest!

for solving this problem i tried to boot witch e.g. boot scsi.2.0 IPL... I edited the Parameter 0/vmlinux in 0/vmlinux32... now i'm only get the message

Couldn't grok your kernel executable format
failed to load kernel

what is wrong? can you help me? for further informations about how to solve this problem ... thank you!

thanx for your answer...

best regards

del-grande diego
