Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA28142
	for <parisc-linux@puffin.external.hp.com>; Fri, 10 Mar 2000 01:28:03 -0700
Message-Id: <200003100731.XAA09162@milano.cup.hp.com>
To: Nick Cabatoff <ncc@cs.mcgill.ca>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HFS linux implementation 
In-reply-to: Your message of "Fri, 10 Mar 2000 01:09:49 PST."
             <20000310010949.A14656@cs.mcgill.ca>
Date: Thu, 09 Mar 2000 23:30:57 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


getting a bit off track here...

Nick Cabatoff wrote:
> <sigh>  I'm kind of
> mystified why HP would've waited for LVM to allow multiple filesystems
> on a single disk; what's so bad about partition tables?

You have to know about HP's "hard" partition scheme.
It was a pain to support. Every new disk required a new entry
in the kernel's partition table. yes, I said Kernel. It's not
stored on the disk. And that was delivered as a patch. 'nuf said.
That's why LVM is better than "partion tables".

Since LVM was "on the roadmap" anyway, HP decided to depend LVM
to provide "soft" portitioning (ie partition tables stored on the
media) instead of something like the PC's use.

grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
