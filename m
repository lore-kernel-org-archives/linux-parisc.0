Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.alcatel.at (atusks01.alcatel.at [212.183.9.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id CAE7B482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Apr 2001 03:24:44 -0600 (MDT)
Sender: christoph.plattner@alcatel.at
Message-ID: <3AC996AE.21A21135@alcatel.at>
Date: Tue, 03 Apr 2001 11:23:58 +0200
From: Christoph Plattner <christoph.plattner@alcatel.at>
MIME-Version: 1.0
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Christoph Plattner <christoph.plattner@dot.at>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] New kernel on 720 + Pa-Linux-0.5: Breakpoint ?
References: <3AC90274.4687ED7C@dot.at> <20010403001743.G9198@linuxcare.com> <3AC973D3.F1453A4C@alcatel.at> <20010403101251.L9198@linuxcare.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hello,

Richard Hirst wrote:
> 
> On Tue, Apr 03, 2001 at 08:55:15AM +0200, Christoph Plattner wrote:
> > With the file system of ESIEE, I always have the problem, that
> > my machine hangs, before init does any output !
> 
> Have you tried using init=/bin/sash?  You may have to build your
> own sash, from userspace/sash on pehc cvs.

No. I built up my own bash (it was statically linked by
accident). I never used sash.

Cheers
	Christoph P.

> 
> Richard
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

-- 
  +--------V--------+	Christoph.Plattner@alcatel.at
  |  A L C A T E L  |	-----------------------------
  +-----------------+	Phone: +43 1 27722 3706	
         T A S		Fax:   +43 1 27722 3955
