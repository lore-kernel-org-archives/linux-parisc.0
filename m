Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 567954A19
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Feb 2001 18:00:43 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA04501
	for <parisc-linux@puffin.external.hp.com>; Tue, 6 Feb 2001 17:56:26 -0700
Message-Id: <200102070103.RAA04588@milano.cup.hp.com>
To: Karsten Merker <karsten@excalibur.cologne.de>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Type declaration missing 
In-reply-to: Your message of "Sat, 03 Feb 2001 14:06:17 PST."
             <20010203140617.A11455@excalibur.cologne.de>
Date: Tue, 06 Feb 2001 17:02:50 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Karsten Merker wrote:
> In fact __kernel_old_uid_t is not declared for the hppa-architecture. The
> declaration should be in include/asm-parisc/posix_types.h, I am just
> unsure what the correct declaration looks like. Has hppa-linux always been
> using 32Bit UIDs? If yes, __kernel_old_uid_t should be defined to be the
> same as __kernel_uid_t, or am I missing something here?

Missing something it seems. Me too though.  I would have defined
__kernel_old_uid_t the same as __kernel_uid_t.

Matthew Wilcox thinks both include/linux/smb_fs.h and include/linux/ncp_fs.h
should be audited and ifdef out it's compatibility code. He volunteered to
put it on his TODO list. I'm sure he'll take patches though. :^)

thanks,
grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
