Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id D17B1482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 14 Sep 2001 16:23:26 -0600 (MDT)
Message-Id: <200109142220.QAA00437@puffin.external.hp.com>
To: "DANDEBOYINA,NAGARAJ (Non-HP-Cupertino,     ex1)" <nagaraj_dandeboyina@non.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: Message from "DANDEBOYINA,NAGARAJ (Non-HP-Cupertino,ex1)" <nagaraj_dandeboyina@non.hp.com>
   of "Fri, 14 Sep 2001 16:34:32 EDT." <580F4ACFCD8F4E439B06B815110418C788509A@xcup03.cup.hp.com>
Date: Fri, 14 Sep 2001 16:20:59 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
Subject: [parisc-linux] Re: How to create a Install CD
List-ID: <linux-parisc.vger.kernel.org>

"DANDEBOYINA,NAGARAJ (Non-HP-Cupertino,ex1)" wrote:
> Hi There,
>    I downloaded 0.9.2 CD Install ISO file from
> http://parisc-linux.org/release-0.9/index.html and I wrote a CD,but I failed
> to run installer on my A500 system.Is there any trick to create the CD.

Not that I'm aware of. Typical problems include MS OS's corrupting
the download - check the md5sum output.

> If it
> is there can you send me the proper procedure and software links which are
> helpful to write a cd.

The mail archive on http://lists.parisc-linux.org is worth searching.

>    How about getting LILO equilent for PA-RISC system when we are writing
> bootable CD?

Look for PALO - it is the LILO equivalent for parisc.
See  http://puffin.external.hp.com/cgi-bin/cvsview/palo/

grant
