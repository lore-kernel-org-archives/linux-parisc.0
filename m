Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 66989482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 12 Oct 2001 12:50:25 -0600 (MDT)
Message-Id: <200110121846.MAA08138@puffin.external.hp.com>
To: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: Message from joel.soete@freebel.net
   of "Fri, 12 Oct 2001 17:03:36 +0200." <1002899016.3bc70648db602@webmail.tiscalinet.be>
Date: Fri, 12 Oct 2001 12:46:39 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
Subject: [parisc-linux] Re: Kernel panic with -pa48
List-ID: <linux-parisc.vger.kernel.org>

joel.soete@freebel.net wrote:
> Hi Grant,
> 
> I met following problem with pa48 (on a 712/80):

You might try -pa49.
712/80 doesn't have eisa either.
But I don't expect any devices on 712 to care which HBA they live under
since they are all "GSC" (mostly under LASI) devices.

grant
