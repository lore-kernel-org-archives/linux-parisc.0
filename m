Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Thu, 14 Aug 2003 17:33:43 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: jmd <jmd5@earthlink.net>
Cc: parisc-linux@parisc-linux.org
Message-ID: <20030814233343.GA27608@dsl2.external.hp.com>
References: <1060876670.1603.14.camel@localhost.localdomain> <20030814165644.GA19868@dsl2.external.hp.com> <1060895797.1090.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1060895797.1090.10.camel@localhost.localdomain>
Subject: [parisc-linux] Re: second nic for proxy server
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

[ replying to list...everyone learns something ]

On Thu, Aug 14, 2003 at 02:16:37PM -0700, jmd wrote:
> grant...
> 
> something is amiss here. the small section of the PCI connector is
> towards the front of the card. standard PCI cards the sector is in the
> rear (opposite end of backplane). is this a mistake on hp's part? am i
> crazy?? need glasses checked?

that's 3.3v vs 5v keying. HP(-UX) normally only sells "universal" cards
that have both 3.3 and 5v keying.

> so if this is a no go with PCI, can i put an ISA card in the EISA slot?
> major problems if i do this? i have a 3com etherlink III.

I guess. I don't touch EISA.

> this is a temporary server. if its complicated i will pass on it.

If the PCI card doesn't fit (wrong keying), then I'd pass on it.
Just my $0.02.

> btw.... when i am done with this box (month or so) its available for a
> developer if they wish to have it. cost of shipping only.

cool - thanks!
Can anyone make use of a C180?
PA2.0, PCI/EISA/GSC IO, 4 IO slots.

grant
