Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 451FC4879
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 10 Dec 2003 08:13:09 -0700 (MST)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com
	[172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	hBAFD7a03766; Wed, 10 Dec 2003 10:13:07 -0500
Subject: Re: [parisc-linux] proposed changes to dino.c
From: James Bottomley <James.Bottomley@steeleye.com>
To: Grant Grundler <grundler@parisc-linux.org>
In-Reply-To: <20031210045429.GA18782@colo.lackof.org>
References: <1071031038.1977.1.camel@mulgrave>
	<20031210045429.GA18782@colo.lackof.org>
Content-Type: text/plain
Date: 10 Dec 2003 10:12:54 -0500
Message-Id: <1071069175.2068.6.camel@mulgrave>
Mime-Version: 1.0
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, 2003-12-09 at 23:54, Grant Grundler wrote:
> James and I talked about this offline. Issue was card-mode dino
> and the PCI yenta bridge were colliding on the bus numbering.
> The card-mode Dino bus numbering was assuming no PCI-PCI bridges
> for *all* the host bridges, not just the card-mode bridges.
> I expect a combination of 4-port tulip and card-mode dinoe would
> have exposed this problem too.

Actually, I have a 4 and 2 port tulip card, and can verify that it does
(as expected) obscure the cardmode dino.  Obviously, any PCI card with
an internal bridge would cause the same problem.


> Otherwise the diff looks good to me. I trust it works for you
> and hopefully a few other people can try it too. If not, we
> can always fix it more later...

well, the bad news is that with the four port and the patches, the
machine hangs loading the tulip module...looks like some resource got
assigned to the wrong window.

James
