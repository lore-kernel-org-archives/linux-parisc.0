Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Jochen Friedrich <jochen@scram.de>
Cc: mike_phillips@urscorp.com, linux-tr@linuxtr.net,
	HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>,
	Randolph Chung <randolph@tausq.org>,
	Matthew Wilcox <willy@debian.org>
Subject: Re: [linux-tr] Re: [parisc-linux] IBM TR patch 
In-Reply-To: Message from Jochen Friedrich <jochen@scram.de>
   of "Tue, 15 Jan 2002 21:28:13 +0100." <Pine.LNX.4.43.0201152120370.11606-100000@alpha.bocc.de>
References: <Pine.LNX.4.43.0201152120370.11606-100000@alpha.bocc.de> 
Date: Wed, 16 Jan 2002 22:01:30 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020117050130.64F98482D@dsl2.external.hp.com>
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

Jochen Friedrich wrote:
> Hi Mike,
> I guess the pre-summarisation is there for performance reasons. In 
> particular on older architectures, it's probably faster to copy and 
> calculate the IPv4 checksum in the same step than to copy and checksum in 
> two seperate steps.

I believe it's faster on all archs to do this in one loop.
Assuming one has enough registers to do both operations at the same time.
My assumption is anything that can run linux has enough registers.
(ie ld/st does not collide with xor).

grant
