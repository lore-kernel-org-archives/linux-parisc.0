Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA12533
	for <parisc-linux@puffin.external.hp.com>; Wed, 12 Apr 2000 09:19:03 -0600
Received: from atl6narkp02a.atl.hp.com (atl6narkp02a.atl.hp.com [15.114.135.170])
	by atlrel1.hp.com (Postfix) with ESMTP id 9A3A73588
	for <parisc-linux@thepuffingroup.com>; Wed, 12 Apr 2000 11:14:50 -0400 (EDT)
Date: Wed, 12 Apr 2000 10:14:49 -0500
From: Bob Pflederer <krp@rsn.hp.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Astro and 100BT still not working
Message-ID: <20000412101449.A1636@atl6narkp02a.atl.hp.com>
References: <200004120514.WAA16365@milano.cup.hp.com> <200004120608.XAA16442@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200004120608.XAA16442@milano.cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Apr 11, 2000 at 11:08:16PM -0700, Grant Grundler wrote:
> 
>     For I/O PDIR fetches themselves, IKE assumes that the I/O PDIR is
>     equivalently mapped. I.e., it assumes that the physical address =
>     virtual address and so it supplies bits 19:12 of the physical address
>     as the virtual index. To ensure coherency of I/O PDIR fetches, the
>     I/O PDIR must be equivalently mapped.
> 
> 
> The second paragraph worries me. It suggests parisc-linux has to flush
> the cachelines which contain I/O Pdir data every time such data is
> changed since it's not equivalently mapped.  Since only bits 31:28
> are different for kernel space (0xc....), does this still apply?
> 
No.  Only bits 19:12 of the virtual address need to match bits 19:12 of the 
physical address.  You may need to use space=0 for your virtual address 
because of the CPU's space hashing feature.
