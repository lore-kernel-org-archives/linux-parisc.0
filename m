Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA03788
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Sep 2000 22:21:03 -0600
Message-Id: <200009060424.VAA24432@milano.cup.hp.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] entry.S Invalid operands 
In-reply-to: Your message of "Wed, 06 Sep 2000 11:46:40 PDT."
             <Pine.LNX.4.21.0009061137540.22521-100000@front.linuxcare.com.au>
Date: Tue, 05 Sep 2000 21:24:42 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra wrote:
> My guess is that you need to update your assembler.  The lines in question
> use register aliases instead of %r<num>:
>         depd            pte,8,7,prot
> 
> pehc CVS before 2000-08-23 won't accept register aliases on all
> instructions.

Good guess...I sent the previous reply too quickly.
Setting CROSS_COMPILE didn't help. So I went to binutils-2.10
and ran cvs update manually. To my surprise a bunch of files
were updated.

Something's fishy with the "-u" option of recipe.linux.

thanks,
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
