Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA13477
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Sep 2000 12:11:03 -0600
Message-Id: <200009221815.LAA14322@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Cc: amodra@linuxcare.com
Subject: Re: [parisc-linux] internal error in tc-hppa.c? 
In-reply-to: Your message of "Fri, 22 Sep 2000 10:29:07 PDT."
             <200009221729.KAA14228@milano.cup.hp.com>
Date: Fri, 22 Sep 2000 11:15:21 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> o slightly older hppa64-linux tool chain can build the same file.

Both 20000915 or 20000921 toolchains die with the same problem.
So I couldn't reproduce what I stated above.

Back too looking at entry.S file and it's include files...<sigh>

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
