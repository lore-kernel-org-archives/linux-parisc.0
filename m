Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA12419
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Sep 2000 10:32:17 -0600
Message-Id: <200009011635.JAA20533@milano.cup.hp.com>
To: =?iso-8859-1?Q?SOETE_Jo=EBl?= <JSO@europay.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] FW: hpux 11.00 near success 
In-reply-to: Your message of "Fri, 01 Sep 2000 09:50:45 PDT."
             <A4A5E4C468B5D11190220001FA6835DD04DD86BA@epixch003>
Date: Fri, 01 Sep 2000 09:35:40 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

=?iso-8859-1?Q?SOETE_Jo=EBl?= wrote:
> But as I just read recipe.hpux (and recipe.linux)
> I just note that host is not anymore specified.
> Is it perhaps the mistake? I will advise asap.

Joel,
I committed those scripts to the CVS build-tools repository to make
them available and not becuase I think they are perfectly correct.

> But glibc is not build with recipe.hpux neither recipe.linux also may I
> assume that I have to use same configure options ?

That's why recipe.linux is deprecated in favor of palinux-autobuilder.
The xenv gcc/binutils don't need glibc - only if you want to build
parisc-linux native toolchain or apps.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
