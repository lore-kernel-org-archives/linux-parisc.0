Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA20051
	for <parisc-linux@puffin.external.hp.com>; Sun, 3 Sep 2000 11:00:23 -0600
Received: from bame.riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via in.smtpd with esmtp (ident bame using rfc1413)
	id <m13Vd4p-001Vp7C@chalet> (Debian Smail3.2.0.102)
	for <parisc-linux@thepuffingroup.com>; Sun, 3 Sep 2000 10:57:03 -0600 (MDT)
Message-Id: <m13Vd4p-001Vp7C@chalet>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Boot error on C200+
In-reply-to: Your message of "02 Sep 2000 21:00:33 EDT."
             <87em32l26m.fsf@linuxcare.com>
Date: Sun, 03 Sep 2000 10:57:03 -0600
Sender: bame@bame.riverrock.org
List-ID: <linux-parisc.vger.kernel.org>

= 
= >  IIR : 43ffff40 ISR : 00000000 IOR : 00000000
= 
= That IIR doesn't look like any instruction on the syscall page that I
= know of.

I've seen this IIR consistently (so far) on pa2.0 processors when they
try to fetch an instruction from an unmapped page.

	-P
