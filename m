Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA21791
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Nov 1999 16:10:06 -0700
Received: from xsvr4.cup.hp.com (xsvr4.cup.hp.com [15.0.68.169])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id SAA13297
	for <parisc-linux@thepuffingroup.com>; Mon, 15 Nov 1999 18:10:44 -0500 (EST)
Received: from hp.com (localhost [127.0.0.1]) by xsvr4.cup.hp.com with ESMTP (8.7.6/8.7.3) id PAA07378 for <parisc-linux@thepuffingroup.com>; Mon, 15 Nov 1999 15:11:36 -0800 (PST)
Sender: frowand@cup.hp.com
Message-ID: <38309328.A734C736@hp.com>
Date: Mon, 15 Nov 1999 15:11:36 -0800
From: Frank Rowand <frank_rowand@hp.com>
Reply-To: frowand@cup.hp.com
MIME-Version: 1.0
To: Parisc Linux <parisc-linux@thepuffingroup.com>
References: <382F3C94.BFF3EB9D@uswest.net>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] use of (*PAGE0->mem_pdc)()
List-ID: <linux-parisc.vger.kernel.org>

Ryan Bradetich wrote:

< stuff deleted >

> [Taken from arch/parisc/kernel/realmode_setup.c]
> 
>  /* This whole VM setup stuff may be removed ultimately.  It seems
>    * to me that once the TLB miss handlers are ready, we just switch
>    * to VM and let them handle TLB population -PB
>    */
> 
>   pret = (*PAGE0->mem_pdc)(
>   PDC_BLOCK_TLB,
>   PDC_BTLB_INSERT,


A comment that is totally unrelated to the question Ryan was asking...

I would recommend that we quit using the pointer to PDCE_PROC() that
is in page zero, because the newer machines have a PDC procedure,
PDC_RELOCATE(), that copies PDCE_PROC into real memory, where it
executes much faster.  The page zero pointer to PDCE_PROC() is not
updated by PDC_RELOCATE(), but instead a pointer to the in-memory
PDCE_PROC() is returned.

I recommend using a global variable to hold the pointer to PDCE_PROC(),
which would be the value from page zero initially, then updated to
the value returned by PDC_RELOCATE().

-Frank
