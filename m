Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spoolm1.tiscalinet.be (spoolm1.tiscalinet.be [212.35.2.50])
	by dsl2.external.hp.com (Postfix) with ESMTP id 481404830
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Oct 2001 13:12:34 -0600 (MDT)
Sender: jso@dsl2.external.hp.com
Message-ID: <3BC89393.E53EA571@freebel.net>
Date: Sat, 13 Oct 2001 19:18:43 +0000
From: Soete Joel <joel.soete@freebel.net>
MIME-Version: 1.0
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
References: <200110121846.MAA08138@puffin.external.hp.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: Kernel panic with -pa48
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> 
> joel.soete@freebel.net wrote:
> > Hi Grant,
> >
> > I met following problem with pa48 (on a 712/80):
> 
> You might try -pa49.
> 712/80 doesn't have eisa either.
> But I don't expect any devices on 712 to care which HBA they live under
> since they are all "GSC" (mostly under LASI) devices.
> 
> grant

Grant,

Thanks a lot.
May be have you also read my email:
http://lists.parisc-linux.org/pipermail/parisc-linux/2001-October/014108.html

and the strange results I encountered with this -pa49

Thanks again,
	Joel
