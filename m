Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7EA68482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 10 Apr 2002 09:37:13 -0600 (MDT)
Message-Id: <200204101537.g3AFb96a026728@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] some bugs
To: xam@cs.ucc.ie (M. Grabert)
Date: Wed, 10 Apr 2002 11:37:08 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: deller@gmx.de, parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.44.0204101509020.1717-100000@sal.ucc.ie> from "M. Grabert" at Apr 10, 2002 03:35:06 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> > > - 100Mbit is not supported properly (full-duplex support is always
> > >   recognized, but 100Mbit just occationally).
> > >   Of course it's a full 10/100Mbit SWITCH (no hub), and I checked the
> > > cables Moreover I just have 100Mbit network devices plugged into the
> > > switch.
> >
> > I never had problems with tulip and 100MBit here (on c3k).
> 
> 10Mbit works perfectly. 100Mbit works once it is detected, which is
> often, but not always. Lately it seems to be working most of the times
> on 100Mbit, perhaps due latest improvements in the kernel ?
> 
> But perhaps it's only a h/w issue (incompatibility with switch and
> network card?). Once the workstation is switched on, it seems
> the kernel won't change the connection mode (e.g. changing from
> 10Mbit to 100Mbit) that was initially negotiated by the network card.
> Thus is presume that sometimes the h/w 100Mbit negotiation works,
> sometimes not, since the 10Mbit mode is entered BEFORE starting the
> linux kernel (which don't change it to 100Mbit).

I've a similar problem with a C200 under hpux.  The card doesn't always
autonegotiate 100Mbit full-duplex in the PDC at boot.  I then force the
card to 100Mbit full-duplex in the hpux driver initialization.  However,
even this sometimes fails.  Then, if something happens to the switch
configuration, I have never seen the card renegotiate the link settings
successfully.  I have a feeling that it might be better to set the PDC
default to 100Mbit half-duplex, and also set the switch and boot
parameters to the same (ie., don't use full-duplex or autonegotiation).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
