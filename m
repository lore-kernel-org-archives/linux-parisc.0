Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id EA4E34829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  3 Nov 2002 16:03:09 -0700 (MST)
Date: Sun, 3 Nov 2002 23:56:47 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: "BUCH-PEDERSEN,LEIF (HP-France,ex1)" <leif_buch-pedersen@hp.com>,
	"'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] ip6tables problem 
In-Reply-To: <20021031193623.6B06E4829@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.44.0211032348580.24848-100000@gfrw1044.bocc.de>
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

Hi Grant,

> Not many people use IPV6 (ie run it on their machines).
> I'm not aware of anyone trying it for parisc-linux.

I'm running an IPv6 cluster on two 715 HPPA machines in production use
(using heartbeat and an IPv6 IP address takeover script). Yet another 720
HPPA machine is running for development and testing and partly builds the
stuff for the Debian IPv6 project (http://debian.fabbione.net).

However, i'm not using the ip6tables on that boxes as all three of them
are behind dedicated packet filters...

At least i can confirm the original problem (just tried it on the 720).

--jochen
