Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id C320F482C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Nov 2001 21:51:38 -0700 (MST)
Message-Id: <200111220447.VAA03217@puffin.external.hp.com>
To: Herb Radford <herbr@magma.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] My C200 situation 
In-Reply-To: Message from Herb Radford <herbr@magma.ca>
   of "Wed, 21 Nov 2001 17:35:55 EST." <3.0.5.32.20011121173555.01928d40@mail.magma.ca>
Date: Wed, 21 Nov 2001 21:47:18 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

Herb Radford wrote:
> Does that mean that stifb is up on the FX4??

No. That's just the STI console - different driver.

> What about X then?

Dunno - but don't think that's the same.

> By the way, I also tried a 64-bit kernel 2.4.14pa6 which did not do
> anything I could see after setting the w-bit in the processor status
> register (went to 64-bit mode).

Did you enable CONFIG_PDC_NARROW?
That's required for 64-bit on Cxxx (but not on Cxxxx) machines.

grant
