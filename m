Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail2.scram.de (mail2.scram.de [195.226.127.112])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9B7A04829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Jan 2003 12:53:30 -0700 (MST)
Date: Wed, 15 Jan 2003 20:52:15 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: Matthew Wilcox <willy@debian.org>
Cc: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>,
	HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Interesting network card ...
In-Reply-To: <20030115125237.E26554@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.44.0301152050130.30955-100000@gfrw1044.bocc.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi,

> > The card is the HP ANA-6911A/AUI (yes, it's a 10/100BT with coax and
> > AUI too), part# A3738-60001, and it _is_ found by the tulip driver, but
> > for some reason the driver claims that "no MII transceiver found", and
> > does list the 10B2 and AUI connections too. But I can't seem to make it
> > form a link with TP or coax, no matter what I do. And the AUI connector
> > is blocked by the C240 chassis. Is there a simple way to force the use of
> > a certain transceiver? Tried mii-tool already and it didn't help much -
> > but then again it doesn't seem to know about the coax and AUI at all...
>
> how very interesting.  could you send an lspci -vvx for that card?

This might be a card with an older DC21x4x chipset. Maybe the de4x5.c
driver works better in this case.

--jochen
