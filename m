Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA24551
	for <parisc-linux@puffin.external.hp.com>; Mon, 6 Dec 1999 14:04:39 -0700
Received: from xsvr4.cup.hp.com (xsvr4.cup.hp.com [15.0.68.169])
	by atlrel1.hp.com (Postfix) with ESMTP id BFCA1170E4
	for <parisc-linux@thepuffingroup.com>; Mon,  6 Dec 1999 13:50:46 -0500 (EST)
Received: from hp.com (localhost [127.0.0.1]) by xsvr4.cup.hp.com with ESMTP (8.7.6/8.7.3) id KAA11982 for <parisc-linux@thepuffingroup.com>; Mon, 6 Dec 1999 10:50:45 -0800 (PST)
Sender: frowand@cup.hp.com
Message-ID: <384C0585.9F444390@hp.com>
Date: Mon, 06 Dec 1999 10:50:45 -0800
From: Frank Rowand <frank_rowand@hp.com>
Reply-To: frowand@cup.hp.com
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] bad news, good news, unkown (Temp CR used as permanent storage)
References: <199912032052.MAA02894@xsvr4.cup.hp.com> <19991204212623.B19280@mathe.stud.uni-erlangen.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:

< stuff deleted >

> > (Of course, the obvious exception is that the Temporary Control
> > Registers are undefined when the kernel's HPMC handler is called.)
> 
> How is that obvious ?  I would have expected the firmware HPMC handler

Ahhh, obvious if one had read the comments at the beginning of the basic
hpmc handler that I submitted.  Or read p. 1-16 of pdce.pdf, "PA-RISC 2.0
Formware Architecture Reference Specification: Processor Dependent Code
(PDC) Procedures (Part 2/2)" at
http://thepuffingroup.com/parisc/documentation.html

OK, so it's not so obvious....

-Frank
