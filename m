Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id D4244482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 12 Jul 2001 09:29:58 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 6.03.0009/NU8172.00.4d3e3a24) with ESMTP id ionpgaaa for parisc-linux@lists.parisc-linux.org; Thu, 12 Jul 2001 08:26:28 -0700
Date: Thu, 12 Jul 2001 08:29:09 -0700
From: Randolph Chung <randolph@tausq.org>
To: rpengelly <rpengelly@ati.stlawrencec.on.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] problems with checksums
Message-ID: <20010712082908.K531@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <001201c10ad2$3beb97b0$0f809b8e@ati.stlawrencec.on.ca> <20010712140756.C18375@linuxcare.com> <001e01c10ad6$588cb4e0$0f809b8e@ati.stlawrencec.on.ca> <20010712145615.E18375@linuxcare.com> <000701c10ae4$186cf6a0$0f809b8e@ati.stlawrencec.on.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000701c10ae4$186cf6a0$0f809b8e@ati.stlawrencec.on.ca>
List-ID: <linux-parisc.vger.kernel.org>

In reference to a message from rpengelly, dated Jul 12:
> I downloaded the 0.92 full iso and its checksum did not match any of the
> one's given. I'm wondering if it may be because I first have to download it
> form esiee to a windows machine then transfer it via ftp to a linux box.
> 
> It still seems strange that the file downloads in .gz format but will not
> unzip.
> 
> Would you be willing to help me out by sending the files by ftp to my linux
> box? I don't know if you have a high speed connection or not?
> Thanks again

Be careful, Debian uses BSD md5sum instead of GNU md5, some other Linux
systems use GNU md5sum. They produce different output for the same
input!

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
