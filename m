Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA30673
	for <parisc-linux@puffin.external.hp.com>; Mon, 13 Sep 1999 12:18:01 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id OAA28681
	for <parisc-linux@thepuffingroup.com>; Mon, 13 Sep 1999 14:19:26 -0400 (EDT)
Message-Id: <199909131818.LAA17779@milano.cup.hp.com>
To: Philipp Rumpf <prumpf@suse.de>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] $global$ undefined? 
In-reply-to: Your message of "Mon, 13 Sep 1999 20:06:26 PDT."
             <19990913200626.C1391@suse.de>
Date: Mon, 13 Sep 1999 11:18:02 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> > Different problem now.
> 
> please file the object files to see whether they are ELF or SOM (they should
> be all SOM).

grundler <407>file arch/parisc/kernel/head.o
arch/parisc/kernel/head.o:      ELF-32 relocatable object file - PA-RISC


Sigh...I thought the object files were supposed to be SOM until I saw the
following in the binutils/gas/configure:
      parisc-*-linux*)         fmt=elf em=linux ;;

Should I change this to "som"?

thanks again philipp,
grant

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
