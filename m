Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id D112D483C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Dec 2002 11:18:08 -0700 (MST)
Subject: Re: [parisc-linux] 2.4.20-paxx Config problem (follow-up)
From: Ryan Bradetich <rbradetich@uswest.net>
To: jsoe0708@tiscali.be
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3DED9BBD00002FDE@ocpmta7.freegates.net>
References: <3DED9BBD00002FDE@ocpmta7.freegates.net>
Content-Type: text/plain
Date: 23 Dec 2002 11:18:02 -0700
Message-Id: <1040667483.24209.57.camel@beavis>
Mime-Version: 1.0
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

Joel,

The PDC Console should work for this box as it is really a firmware
console.  The firmware console talks to /dev/ttyB0 instead of
/dev/ttyS0, so that might be your problem?  Also in recent kernels the
major number of /dev/ttyB0 changed from 60 to 11 so make sure the 
device file is correct.

Finally, out of curiosity, why are you trying to use the PDC console? 
The B2k should have a 16550 port (off the suckyio chip???) that should
work for you.

Thanks, and hope this helps!

- Ryan


On Mon, 2002-12-23 at 09:34, jsoe0708@tiscali.be wrote:
> Hi all,
> 
> The problem I met with arch/parisc/32 on my b2k is due to the CONFIG_SERIAL_NONSTANDARD
> (or a subselect ??).
> 
> Is PDC_console does not work on this model or is there a border effect link
> with this selection?
> 
> Can somebody help me to fix it?
> 
> Thanks,
>     Joel
> 
> 
> ********************************************
> Promo Tiscali ADSL: 35 Euros/mois, 1er mois et activation = 0 Euro http://adsl.tiscali.be
> 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
