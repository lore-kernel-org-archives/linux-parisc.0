Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id D2B66482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 27 Aug 2001 09:31:49 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 6.03.0009/NU8172.00.4d3e3a24) with ESMTP id ehyihaaa for parisc-linux@lists.parisc-linux.org; Mon, 27 Aug 2001 08:27:34 -0700
Date: Mon, 27 Aug 2001 08:31:40 -0700
From: Randolph Chung <randolph@tausq.org>
To: "Pedot, Wolfgang" <wpedot@harris.com>
Cc: 'Parisc Linux Mailinglist' <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Crashing Kernel 2.4.9 -pa5 on 715/75
Message-ID: <20010827083140.V703@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <8D4C69676E66D511A1CB00508BBBB192162724@ranmx1.ran.harris.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <8D4C69676E66D511A1CB00508BBBB192162724@ranmx1.ran.harris.com>
List-ID: <linux-parisc.vger.kernel.org>

> I?m having big problems with booting a 2.4.9-pa5 kernel on my 715/75. IPL loads
> the segments but after "branching to kernel entry point 0x001000d0" I get a huge
> Stack-dump and thats all. I read that this kernel works on 715/80, can anybody
> send me a working config? I used the default-config comming with the kernel and
> my old working 2.4.7 config without any luck....

Do you have the System.map file that correspond to this kernel? 

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
