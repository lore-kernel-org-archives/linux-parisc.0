Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7E4A6482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Dec 2001 23:44:42 -0700 (MST)
Date: Wed, 19 Dec 2001 07:44:25 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: Matthew Wilcox <willy@debian.org>
Cc: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] ISA memory access
In-Reply-To: <20011219014640.D8936@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.40.0112190739110.3388-100000@alpha.bocc.de>
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

Hi Matthew.

> not from my memories of the mongoose docs.  unfortunately, i don't have
> access to those again until jan 10th or so.  how does the driver access
> the card?  readb/writeb or dma?

It is pure readb/writeb. 

I also let the driver create a memory dump during initialization time and 
the dump shows stripes of 0xFF from 0xD0000-0xD00FF, 0xD0400-0xD04FF, etc 
(addresses are ISA space), while the card firmware seems to initialize all 
memory to 0x00.

Cheers,
Jochen
