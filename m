Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.maybe.net (12-231-234-80.client.attbi.com [12.231.234.80])
	by dsl2.external.hp.com (Postfix) with SMTP id 4BD4A4829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Apr 2003 19:00:05 -0700 (MST)
Date: Tue, 1 Apr 2003 18:00:04 -0800
From: Chris Jantzen <chris-parisc@maybe.net>
To: Matthew Wilcox <willy@debian.org>
Cc: Ricardo Jose Guevara Ochoa <jguevara@unitec.edu>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] network card
Message-ID: <20030402020004.GG31656@maybe.net>
References: <36d3af5ee545d6d.e545d6d36d3af5e@unitec.edu> <20030401221616.GG29376@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030401221616.GG29376@parcelfarce.linux.theplanet.co.uk>
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

On Tue, Apr 01, 2003 at 11:16:16PM +0100, Matthew Wilcox wrote:
> On Tue, Apr 01, 2003 at 04:03:38PM -0600, Ricardo Jose Guevara Ochoa wrote:
> > I got a HP 9000 D-Class D270 running Debian 3.0r1 with linux version 
> > 2.4.17-32, and the instalation detected one of two network cards thats 
> > comes with the server. It detected the lan card that is integrated to 
> > the server, but i need to use the both cards. The one it did not 
> > detect is an eisa lan card, HP A4308-66001. Can someone help, o can i 
> > put a isa card to this server.
> 
> I suggest you update your kernel to at least 2.4.19, and I think 2.4.20
> would be a wiser choice.  IIRC we didn't support the ISA or EISA slots at
> all in 2.4.17.  This doesn't guarantee the card will work, but it might
> do.  I had a 100VG card working in a 715 when I was doing EISA initially.

AFAIK EISA DMA is still unsupported, though strides have been made in
the overall architecture to support non-PCI DMA in Linux more elegantly.

-- 
chris jantzen kb7rnl =->         __O
Insert witty comment here.     _`\<,_
http://www.maybe.net/         (*)/ (*)
