Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 91A594843
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  9 Dec 2003 21:54:30 -0700 (MST)
Date: Tue, 9 Dec 2003 21:54:29 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] proposed changes to dino.c
Message-ID: <20031210045429.GA18782@colo.lackof.org>
References: <1071031038.1977.1.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1071031038.1977.1.camel@mulgrave>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Dec 09, 2003 at 11:37:16PM -0500, James Bottomley wrote:
> This updates dino to configure unassigned resources (primarily so I can
> get it to recognise my yenta cardbus bridge).

James and I talked about this offline. Issue was card-mode dino
and the PCI yenta bridge were colliding on the bus numbering.
The card-mode Dino bus numbering was assuming no PCI-PCI bridges
for *all* the host bridges, not just the card-mode bridges.
I expect a combination of 4-port tulip and card-mode dinoe would
have exposed this problem too.

> The side effect is that it will reorder all the resources in the dino
> window.

I think this will be ok as long firmware doesn't try to remember
and PCI resources. STI is what I don't know about and worry a bit.

Otherwise the diff looks good to me. I trust it works for you
and hopefully a few other people can try it too. If not, we
can always fix it more later...

thanks,
grant
