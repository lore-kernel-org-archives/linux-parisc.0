Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id E3E3D482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Jul 2001 15:58:32 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id A46E5B00C; Wed,  4 Jul 2001 22:57:56 +0100 (BST)
Date: Wed, 4 Jul 2001 22:57:56 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: =?iso-8859-1?Q?Jo=EBl_Soete?= <jso@europay.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] How to access the second serial port on a B180 with PALINUX
Message-ID: <20010704225756.H23509@linuxcare.com>
References: <OFA73CA243.24E46DAD-ONC1256A7F.0022F3A1@LocalDomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <OFA73CA243.24E46DAD-ONC1256A7F.0022F3A1@LocalDomain>; from jso@europay.com on Wed, Jul 04, 2001 at 08:59:39AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jul 04, 2001 at 08:59:39AM +0200, Joël Soete wrote:
> Hio,
> 
> I just re-install my B180 with the last palinux-0.9 CD.
> 
> With STI console gpm also works excepted that it do not highlight a
> double-click selection (but selection works)?
> 
> I would also like to test the second serial port available on this model.
> Is any have tips or idea?

Support has recently been added to the kernel for the second serial
port.  Either grab a new kernel from puffin.external.hp.com, I think
Matt Taggart posted some recently, or build your own.

Richard
