Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA02148
	for <parisc-linux@puffin.external.hp.com>; Fri, 24 Sep 1999 08:42:06 -0600
Received: from security.hp.com (cranston.fc.hp.com [15.6.91.224])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id HAA28056
	for <parisc-linux@thepuffingroup.com>; Fri, 24 Sep 1999 07:44:25 -0700 (PDT)
To: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
Cc: parisc-linux@thepuffingroup.com, LaMont Jones <lamont@security.hp.com>,
        Grant Grundler <grundler@cup.hp.com>, lamont@security.hp.com
Subject: Re: [parisc-linux] Missing directories from CVS 
In-reply-to: Your message of "Fri, 24 Sep 1999 10:13:13 +0200."
             <99092410263805.00271@P100>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Fri, 24 Sep 1999 08:44:20 -0600
From: LaMont Jones <lamont@security.hp.com>
Message-Id: <19990924144420.8E2CC18708@security.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> Yes, I think this would be the best solution. When I wrote the program, I tri
> to include the header-files som.h and elf.h, but then I always got
> different errors from every of the arch-compilers (iA32 or hpux).  So maybe i
> is best to use the structure as above and write the structure-layout directly
> into the source.  
> Does someone want to fill it in and commit it ?

I'm already working with Grant on doing just that, but it'll probably be this
weekend at the earliest...

lamont
