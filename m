Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA30529
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Oct 2000 13:48:55 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id 3C597117D
	for <parisc-linux@thepuffingroup.com>; Thu, 26 Oct 2000 12:49:59 -0700 (PDT)
Date: Thu, 26 Oct 2000 12:54:43 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200010261954.MAA22459@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Cc: Drepper@milano.cup.hp.com, Ulrich@milano.cup.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] __FUNCTION__ revisited
List-ID: <linux-parisc.vger.kernel.org>

Hi Ulrich,

After RTFMing for a bit, I still think __FUNCTION__ is b0rken.
Maybe I'm doing something else stupid that's obvious to you.

In linux/arch/parisc/kernel/sba_ccio.c I have some debug
output which can be enabled like this:
	#define DEBUG_SBA_RUN_SG

I use that for:

	#ifdef DEBUG_SBA_RUN_SG
	#define DBG_RUN_SG(x...)       printk(x)
	#else
	#define DBG_RUN_SG(x...)
	#endif

and use DBG_RUN_SG() like this:

	DBG_RUN_SG("%s() DONE %d mappings\n", __FUNCTION__, n_mappings);

The output I get looks like "() DONE 16 mappings".
No complaints from compiler or linker.


And despite the official change of __FUNCTION__'s data type almost 2 years
ago in the developement branch, __FUNCTION__ was still being treated as
a literal by our tool chain as late as August 3, 2000.
I still have the c110 console output to prove it:
-rw-rw----   1 grundler users       12384 Aug  3 19:35 c110.out1

thanks,
grant
