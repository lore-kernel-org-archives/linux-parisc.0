Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id D90E34829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 17 Aug 2002 09:38:54 -0600 (MDT)
Date: Sat, 17 Aug 2002 11:37:09 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: "B. Douglas Hilton" <bdhilton@charter.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Voodoo3 PCI on C200 experiment pending!
Message-ID: <20020817153709.GD16532@systemhalted>
References: <3D5E0430.2000407@charter.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D5E0430.2000407@charter.net>
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

> I just scarfed up a somewhat used Voodoo3 PCI graphics
> card from Ebay and intend to try it out with Debian/HPPA
> and a custom built kernel.
> 
> I hope to compile a tdfx.o drm module and get the card
> recognized via a PALO boot command. I will use a dumb
> terminal for the system console during initial booting.
> 
> Any hints or tips would be appreciated :-)
> 

Stop trying to use the card as your console :)

Stick with a serial console for startup and then launch X
from that console.

It's my dream to get a Radeon 7000 PCI running on a C3K, 
but that will have to wait until September. I'm very interested
in this test... since I'm a burgeoning DRI/DRM developer :)

If you have any problems please post to:

dri-devel@lists.sourceforge.net 

or visit

#dri-devel on irc.openprojects.net

Good luck!

c.
