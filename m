Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1BFE6482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Jan 2002 13:28:42 -0700 (MST)
Date: Tue, 15 Jan 2002 21:28:13 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: mike_phillips@urscorp.com
Cc: linux-tr@linuxtr.net,
	HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>,
	Randolph Chung <randolph@tausq.org>,
	Matthew Wilcox <willy@debian.org>
Subject: Re: [linux-tr] Re: [parisc-linux] IBM TR patch
In-Reply-To: <OF92E3B858.7A575C3D-ON85256B42.0068A37B@urscorp.com>
Message-ID: <Pine.LNX.4.43.0201152120370.11606-100000@alpha.bocc.de>
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

Hi Mike,

> What I have to ensure is that we don't lose any functionality that we 
> already have, i.e. a change for parisc stops i386/alpha/etc from working. 
> Also, the pcmcia driver ibmtr_cs relies on ibmtr and, being pcmcia, can be 
> used on more architectures and all changes to ibmtr have to be double 
> checked against ibmtr_cs. 

That's what i did for the changes. I tested them on an Auto 16/4 ISA card 
in a HP 9000/720 and on an Auto 16/4 PCMCIA card in an i586 Laptop. 

I guess the pre-summarisation is there for performance reasons. In 
particular on older architectures, it's probably faster to copy and 
calculate the IPv4 checksum in the same step than to copy and checksum in 
two seperate steps. I'm not sure, if this is still true and if someone 
benchmarked the difference.

> Just out of interest, which t/r chipset does the token ring adapter for 
> the old 712's use ? If its the tropic chipset I can test on my 712/80. 

No clue. I'm just using a spare ISA card in the EISA slot...

--jochen
