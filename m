Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA32068
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 12:26:38 -0700
Received: from gate.ixs.bb.bawue.de (p3E9D2999.dip.t-dialin.net [62.157.41.153])
	by bender.bawue.de (Postfix) with ESMTP id D3707817
	for <parisc-linux@thepuffingroup.com>; Wed, 15 Nov 2000 20:28:29 +0100 (CET)
Received: from localhost (ixs@localhost)
	by gate.ixs.bb.bawue.de (8.9.3/8.9.3) with ESMTP id UAA20282
	for <parisc-linux@thepuffingroup.com>; Wed, 15 Nov 2000 20:28:28 +0100
Date: Wed, 15 Nov 2000 20:28:28 +0100 (CET)
From: Andreas Thienemann <ixs@ixs.bb.bawue.de>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 250/1 doesn't boot but dumps stack
In-Reply-To: <3A143389.CA59F143@bawue.de>
Message-ID: <Pine.LNX.4.10.10011152026220.7480-100000@gate.ixs.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi again,

just to clear something up:

On Thu, 16 Nov 2000, Andreas Thienemann wrote:

> the pty interfaces. (I already left out everything unnecessary, such as
> parallel port support)
I just noticed I attached the wrong file. The attached bootlog was from a
kernel that still had support for lp0.
But with another kernel, this time without lp support, this errors were
the same...

bye,
 Andreas
