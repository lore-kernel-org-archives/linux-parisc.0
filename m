Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA14490
	for <parisc-linux@puffin.external.hp.com>; Sun, 5 Dec 1999 13:42:12 -0700
Date: Sun, 5 Dec 1999 20:47:17 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Still trying to get to sash on 735
Message-Id: <19991205204717.A22241@mathe.stud.uni-erlangen.de>
References: <199912050045.TAA01366@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199912050045.TAA01366@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>

>         __put_user((unsigned long) envp,++sp);
> 
> The values of envp and sp are 0x20000000 and 0x2000001c, respectively.
> 
> Any ideas?

This is completely expected (our real-mode TLB insertion handler doesn't
handle anything but the 0xc000 0000 - 0xffff ffff range correctly) and will
be fixed soon.

	Philipp Rumpf
