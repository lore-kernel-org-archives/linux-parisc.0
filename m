Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 02C79482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Jan 2002 18:24:01 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id yzcjkaaa for parisc-linux@lists.parisc-linux.org; Tue, 15 Jan 2002 18:24:06 -0700
Date: Tue, 15 Jan 2002 17:23:43 -0800
From: Randolph Chung <randolph@tausq.org>
To: Daniel Engstrom <5116@telia.com>
Cc: Jochen Friedrich <jochen@scram.de>, linux-tr@linuxtr.net,
	HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] IBM TR patch
Message-ID: <20020116012343.GV3247@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <Pine.LNX.4.43.0201142041450.7418-200000@alpha.bocc.de> <20020115231052.A4018@zaphod.halden.lillfab.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020115231052.A4018@zaphod.halden.lillfab.se>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> I think the driver was correct. The i/o layer should not try to byteswap
> the io requests, because it can not second-guess what the driver is doing.

For reference, you may wish to read
http://lists.parisc-linux.org/pipermail/parisc-linux/2001-November/014606.html

Originally the parisc {read,write}[wl] macros did not swap, but this
breaks many PCI drivers. For example, we used to have hppa specific code in the
sym53c8xx driver that did the swapping....

> And in the case of the tr driver it now does two swaps for each word it tranfers on
> big endian platforms instad of zero.


I agree this is not optimal, altho, as Alan Cox pointed out in
http://lists.parisc-linux.org/pipermail/parisc-linux/2001-November/014527.html
double swaps may be optimized out by the compiler.
> 
> The ne2000 driver had the same problem, but I removed the swaps from the parisc i/o code 
> instad of touching the driver.

for parisc we follow the ppc convention of defining __raw_{read,write}[wl]
that are host-endian. perhaps the drivers can use this instead?

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
