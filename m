Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 18DE6482E
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Aug 2003 10:04:13 -0600 (MDT)
Date: Thu, 7 Aug 2003 18:04:05 +0200
Message-ID: <3F2E2C7700000FF2@ocpmta2.freegates.net>
In-Reply-To: <20030807083620.21079.h004.c009.wm@mail.canada.com.criticalpath.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] adding a second nic to B1000
To: geos@canada.com, parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

> Ive been trying for 5 days not to get a second nic
>installed into hp b1000 using pa-risc woody 3
>
>iv read all i can find , been to all the irc chnls 
>im at a loss here 
>
>it may be the 3com 3C95x pci card does not work in this
>box 
>
>it should work with debian 
>the card does work in i386 box 
>the builtin nic works fine
>
>can this be done? if so is there a howto ?
>if this card is not supported what nic cards are ? 

For my part, I run successfully a Debian on a b2k with 2 nic (the builtin
and an additional) since a long time but it is an hp product.

I also try some stuff coming from i386: an OEM hp equinox pci card (which
Grant use successfully on a i386) but the driver doesn't yet work on hppa;
also in the same case an ATI gfx card,... (for this last I am awaiting that
2.6 run on my b2k to investigate more because ATI drivers are already improved
in 2.6 :-))

Joel


------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
