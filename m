Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA17274
	for <parisc-linux@puffin.external.hp.com>; Wed, 6 Dec 2000 11:25:05 -0700
Message-Id: <200012061828.KAA06072@milano.cup.hp.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Alan Modra <alan@linuxcare.com.au>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] hppa64 gcc sizeof() bug? 
In-reply-to: Your message of "Wed, 06 Dec 2000 12:18:55 PST."
             <20001206121855.S7166@linuxcare.com>
Date: Wed, 06 Dec 2000 10:28:12 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Richard Hirst wrote:

> > int sys32_get_kernel_syms(struct kernel_sym32 *table)
...
> Just changed it to 'table += 64' and it still generates code that
> adds 4096, so sizeof is not relevant.

Right. sizeof() works fine.
table points to something that is 4096/64 (64 bytes) in size.
table+=1 results in adding 4096/64 to table.
The code should read "((char *) table) += 64" or "table++".

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
