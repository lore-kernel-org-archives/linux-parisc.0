Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA26278
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 07:18:54 -0700
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 390EF1FAD3
	for <parisc-linux@thepuffingroup.com>; Wed, 22 Nov 2000 15:21:02 +0100 (MET)
Received: from admin.france.hp.com (ssdpc48.france.hp.com [15.129.234.2]) by hpfrcu03.france.hp.com with ESMTP (8.7.6/8.7.3 SMKit7.02) id PAA17830 for <parisc-linux@thepuffingroup.com>; Wed, 22 Nov 2000 15:18:15 +0100 (MET)
Sender: vidal@hpfrcu03.france.hp.com
Message-ID: <3A1BD4BA.B771D3BE@admin.france.hp.com>
Date: Wed, 22 Nov 2000 15:14:18 +0100
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Crash dump module
List-ID: <linux-parisc.vger.kernel.org>

	Hi
Good news, I've finished to recompile the entire chain on hpux 11.00 64bits.
I've recompile my own kernel and booted a small 712/60. It work pretty well.
Now I'm going to start the work about crash dump. So, In my mind, I'll start
from the linux/kernel/panic.c function and I'll add a function dumpsys.c
in the linux/arch/paric directory -> is it okay for you ?
It will depend on the CONFIG_PARISC var (or do you prefer adding a CONFIG_DUMPSYS var ?)

	thanks.

-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
