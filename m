Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA12875
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Sep 2000 11:24:43 -0600
Message-Id: <200009221729.KAA14228@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Cc: amodra@linuxcare.com
Subject: Re: [parisc-linux] internal error in tc-hppa.c? 
In-reply-to: Your message of "Fri, 22 Sep 2000 09:52:26 PDT."
             <E13cW3m-0006sn-00@hpisp747.cup.hp.com>
Date: Fri, 22 Sep 2000 10:29:07 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
...
> I was told entry.S is broken but the assembler should handle it
> more gracefully...so I'll be looking at entry.S to see what's broken.
> 
> Line number of entry.S is junk since parisc64 version is just
> an include of the parisc version. line 1560 is the real culprit:
>         b,n .

More data:
o adding a NOP didn't help.
o slightly older hppa64-linux tool chain can build the same file.
o looking at line 4017 of tc-hppa.c suggests hppa_gen_reloc_type() failed.

I'll continue using the older toolchain...

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
