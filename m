Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA31270
	for <parisc-linux@puffin.external.hp.com>; Tue, 10 Oct 2000 09:54:55 -0600
Message-Id: <200010101600.JAA04506@milano.cup.hp.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Unable to compil gcc2.96 on L2000/11.00/64 bits 
In-reply-to: Your message of "Tue, 10 Oct 2000 20:24:52 PDT."
             <Pine.LNX.4.21.0010102014070.20550-100000@front.linuxcare.com.au>
Date: Tue, 10 Oct 2000 09:00:14 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra wrote:
...
> From memory, the steps I followed were:
>   build & install binutils
>   build & install gcc using "make LANGUAGES=c; make LANGUAGES=c install"
>   build & install glibc
>   rebuild gcc

Alan,
Could you update the relevant scripts in CVS build-tools repository?
(They may not need any changes and Bruno just needs to use those)

Last year I pushed for "recipes" and those got stale pretty quickly
because the folks on the bleeding edge weren't using them. Like Bruno,
I had a hard time reproducing the success others claimed they had.
(I still chuckle over puffin's phrase: "I don't believe you")
It shouldn't be that hard to build stuff from the CVS repositories.

I've given up on the recipe's and moved to scripts instead.
Matt Taggart has contributed the build-tools/palinux-autobuilder
and recipe.linux/recipe.hpux are mine. The README file should
explain what each does.

apologies for harping on this again,
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
