Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B5C474829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Apr 2003 15:16:20 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 190U3E-0004xV-PE; Tue, 01 Apr 2003 23:16:16 +0100
Date: Tue, 1 Apr 2003 23:16:16 +0100
From: Matthew Wilcox <willy@debian.org>
To: Ricardo Jose Guevara Ochoa <jguevara@unitec.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] network card
Message-ID: <20030401221616.GG29376@parcelfarce.linux.theplanet.co.uk>
References: <36d3af5ee545d6d.e545d6d36d3af5e@unitec.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <36d3af5ee545d6d.e545d6d36d3af5e@unitec.edu>
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

On Tue, Apr 01, 2003 at 04:03:38PM -0600, Ricardo Jose Guevara Ochoa wrote:
> I got a HP 9000 D-Class D270 running Debian 3.0r1 with linux version 
> 2.4.17-32, and the instalation detected one of two network cards thats 
> comes with the server. It detected the lan card that is integrated to 
> the server, but i need to use the both cards. The one it did not 
> detect is an eisa lan card, HP A4308-66001. Can someone help, o can i 
> put a isa card to this server.

I suggest you update your kernel to at least 2.4.19, and I think 2.4.20
would be a wiser choice.  IIRC we didn't support the ISA or EISA slots at
all in 2.4.17.  This doesn't guarantee the card will work, but it might
do.  I had a 100VG card working in a 715 when I was doing EISA initially.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
