Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA05058
	for <parisc-linux@puffin.external.hp.com>; Sun, 28 Jan 2001 20:49:58 -0700
Message-Id: <200101290356.TAA25535@milano.cup.hp.com>
To: 5116@telia.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Kernel module loader gived break 
In-reply-to: Your message of "Sat, 27 Jan 2001 17:10:51 PST."
             <200101271610.RAA30546@zaphod.halden.lillfab.se>
Date: Sun, 28 Jan 2001 19:56:08 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

5116@telia.com wrote:
> Modprobe is not in stalled in my system (is it ported yet?).

As Matthew mentioned, Richard Hirst worked on it and I know it works.
I've used it on the A500 to load SCSI and ACENIC modules for 64-bit kernel.
But I got the binaries directly from Richard. I think however before
posting those, I'd like them rebuilt with the matching glibc/toolchain
that Matt Taggart is working on.

For the adventurous, I would expect all richard's work to be commited to
seperate CVS repository on puffin.external.hp.com called "modutils".
But I haven't looked or tried to build it.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
