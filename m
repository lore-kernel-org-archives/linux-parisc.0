Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (lightning.swansea.linux.org.uk [194.168.151.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id DE39A482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Jan 2002 14:26:19 -0700 (MST)
Subject: Re: [linux-tr] Re: [parisc-linux] IBM TR patch
To: jochen@scram.de (Jochen Friedrich)
Date: Tue, 15 Jan 2002 21:37:39 +0000 (GMT)
Cc: mike_phillips@urscorp.com, linux-tr@linuxtr.net,
	parisc-linux@lists.parisc-linux.org (HP900 PARISC mailing list),
	randolph@tausq.org (Randolph Chung)
In-Reply-To: <Pine.LNX.4.43.0201152129020.11606-100000@alpha.bocc.de> from "Jochen Friedrich" at Jan 15, 2002 09:32:38 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E16QbH1-0006IW-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
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

> > And MCA.....
> 
> I doubt that this might be an issue for big endian, unless someone 
> *really* starts a Linux port for POWER2 or ports MCA to PPC for the 
> early RS/6000 (model 250?) machines.

That may happen. If the code is endian clean they can fix up the remnants
