Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 230AA4890
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Aug 2003 08:03:01 -0600 (MDT)
Date: Mon, 18 Aug 2003 16:00:21 +0200
To: MarquiS <marquis-@gmx.net>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] how to use internal speaker on my hp712
Message-ID: <20030818140021.GA8766@esiee.fr>
References: <oprt3ssanzhvbkz3@mail.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <oprt3ssanzhvbkz3@mail.gmx.net>
From: m.delahaye@esiee.fr (Matthieu Delahaye)
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

On Mon, Aug 18, 2003 at 03:51:36PM +0200, MarquiS wrote:
> hi list
> 
> how to use the internal speaker on my hp712 ?
> 
> 
> thx

The internal speaker is directly connected to the harmony chipset.
It is disable if something is connected on line-out.
So:
- check harmony is selected in your kernel configuration.
- check your volume setup is not to 0
- play and enjoy

Matthieu

> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
First, they ignore you.
Then they laugh at you.
Then they fight you.
Then you win
(Gandhi) 
