Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0A3AC482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jan 2002 08:43:40 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16P3qD-0001IW-00; Fri, 11 Jan 2002 15:43:37 +0000
Date: Fri, 11 Jan 2002 15:43:37 +0000
From: Matthew Wilcox <willy@debian.org>
To: raffo@neuronet.pitt.edu
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] How to configure EISA network card in 715/80
Message-ID: <20020111154337.D26644@parcelfarce.linux.theplanet.co.uk>
References: <3C3F06DD.6050409@verizon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C3F06DD.6050409@verizon.net>; from vze26vn8@verizon.net on Fri, Jan 11, 2002 at 10:38:05AM -0500
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

On Fri, Jan 11, 2002 at 10:38:05AM -0500, Rafael Herrera wrote:
> LUCENT/Hewlett Packard
> 100 VG
> 1821 - 1400
> 
> LUCENT
> 2X01 MC
> Regatta 100
> 
> Intel
> N82503
> L7201918
> 
> The card has two ports, a 10 Mbit/sec and a 100Mbit/sec.
> 
> Is there a driver for this card?

yep it's the hp100 driver.  i've used it myself (when i got a ping back
from it, i declared the eisa code good enough to commit :-).  in config,
that's: HP 10/100VG PCLAN (ISA, EISA, PCI) support' CONFIG_HP100

btw, the 100Mbit port is 100VG, not 100TX so you need 100VG equipment
to work with it.  the 10Mbit port is vanilla 10baseT though.

-- 
Revolutions do not require corporate support.
