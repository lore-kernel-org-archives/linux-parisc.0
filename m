Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4F00E482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 29 Apr 2001 00:31:20 -0600 (MDT)
Message-Id: <200104290624.AAA21764@puffin.external.hp.com>
To: Xavier Debacker <xavier.debacker@esiee.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Keyboard driver patch proposal 
In-Reply-To: Your message of "Sat, 28 Apr 2001 07:00:30 +0200."
             <3AEA4E6E.A990140B@esiee.net>
Date: Sun, 29 Apr 2001 00:24:49 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Xavier,
It seems Helge Deller has reviewed and committed most of the ESIEE team
work in the past. Any word on if Helge will be able to review/commit
this patch?

Xavier Debacker wrote:
> +	switch (keyval) {
> +		case KBD_BREAK :  
> +			// sets the "release_key" bit
> +			// when a key is released
> +			// HP keyboard send f0 followed by the keycode
> +			// while AT keyboard send the keycode with
> +			// this bit set.
> +			brk = 0x80;
>  			return;

BTW, I'm told the '//' comment style is not ok;  "/* ... */" is expected.
It's not mentioned in Documentation/CodingStyle so I can't explain it.

thanks,
grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
