Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1CE9A4A19
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Feb 2001 15:21:33 -0700 (MST)
Message-Id: <200102052223.OAA02854@milano.cup.hp.com>
To: buusbaek@os.dk
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 712/60 console "gone" 
In-reply-to: Your message of "Mon, 05 Feb 2001 23:04:25 PST."
             <000001c08fbf$9a1ea900$6e55d7c3@torben1>
Date: Mon, 05 Feb 2001 14:23:47 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Karen og Torben" wrote:
> After booting the palo..0.5 cd image, i went into the
> "switching from PDC console".
> 
> I then followed the recipe on switching the 712 to the
> serial console, with "conspath 2/0/4.643" at the ISL prompt.
> After restarting (boot sounds ok.) my monitor is black, though the indicator
> changes to green (with a slight noise). I have tried to reach
> the 712 from several term programs with several serial pinout.
> I can´t reach it.

Try a standard *HP* 9-pin to 9-pin serial cable.
Others might work but Alex DeVries was burned by this once.
Minicom should work fine. 9600 8N1 settings.

> Is it dead or can it still live?

Even if it's "dead" (console not accessible), it could be
resurrected with a special card ("dagger") that blasts new firmware
images. No clue who in (or near) .dk might have one though.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
