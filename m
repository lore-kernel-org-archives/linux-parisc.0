Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3F1944866
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Dec 2002 11:20:39 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18LSW9-00020L-00; Mon, 09 Dec 2002 18:20:33 +0000
Date: Mon, 9 Dec 2002 18:20:33 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Matthew Wilcox <willy@debian.org>,
	Randolph Chung <tausq@debian.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>, carlos@baldric.uwo.ca,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Trap handler
Message-ID: <20021209182033.L20336@parcelfarce.linux.theplanet.co.uk>
References: <20021208232601.GH21187@tausq.org> <200212082355.gB8NtUAe010825@hiauly1.hia.nrc.ca> <20021209051214.GK21187@tausq.org> <20021209061913.GM21187@tausq.org> <20021209125416.F20336@parcelfarce.linux.theplanet.co.uk> <20021209180316.GA6635@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021209180316.GA6635@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Mon, Dec 09, 2002 at 11:03:16AM -0700
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

On Mon, Dec 09, 2002 at 11:03:16AM -0700, Grant Grundler wrote:
> > Judging from the use of cli & sti in the x86 asm, I would venture to
> > suggest that the I bit should be cleared.  It makes sense anyway --
> > you can't expect interrupts to be disabled over a page fault.
> 
> The above two statements don't make sense to me.
> Clearing I-bit (ie rsm) will disable interrupts.
> The second sentence suggests the opposite.
> Or did I read it wrong?

i misremembered the sense of the I bit

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
