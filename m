Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 147AF4895
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Jul 2002 07:39:10 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17U64D-0008Ud-00; Mon, 15 Jul 2002 14:39:09 +0100
Date: Mon, 15 Jul 2002 14:39:09 +0100
From: Matthew Wilcox <willy@debian.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Matthew Wilcox <willy@debian.org>,
	Stephan Trajkoff <stephan@itp.bg>, Ralf.Hildebrandt@charite.de,
	parisc-linux@lists.parisc-linux.org
Subject: Re: Re: [parisc-linux] STI framebuffer and PINE
Message-ID: <20020715143909.K27706@parcelfarce.linux.theplanet.co.uk>
References: <20020714091619.B1E35483A@dsl2.external.hp.com> <20020715142028.J27706@parcelfarce.linux.theplanet.co.uk> <1026743879.30202.5.camel@irongate.swansea.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1026743879.30202.5.camel@irongate.swansea.linux.org.uk>; from alan@lxorguk.ukuu.org.uk on Mon, Jul 15, 2002 at 03:37:59PM +0100
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

On Mon, Jul 15, 2002 at 03:37:59PM +0100, Alan Cox wrote:
> On Mon, 2002-07-15 at 14:20, Matthew Wilcox wrote:
> > i have to say i think you're a complete lunatic for wanting to support
> > `clients' on a K class running PA/Linux right now.
> 
> Someone has to go first. I ran www.linux.org.uk on the first ever Mac68K
> Linux box and that helped no end in the stabilisation process.

Certainly, and I'm aware of people using PA/Linux in production environments
today.  But the K class hardware is not well supported.  Lan and Console
are the only two devices which really work; the SCSI cards don't use the
normal NCR/Symbios chips but a proprietary chip instead.

Hmm.. anyone want to do a `testimonials' section on the website which
lists peoples (successful ;-) experiences with using PA/Linux in
production environments?

> [ObOnTopic] What is the state of the 2.4 pa-risc code in terms of rate
> of change now. Would it be a good time to use -ac as a real sync up ?

rate of change is fairly low; i attempted to do a merge with marcelo
during early 2.4.19 dev, but someone sent some conflicting patches in
first, i tripped over my own feet trying to use bitkeeper and ran out
of motivation to fix conflicts myself.

at OLS we decided to concentrate on 2.5 RSN.  it's more important to
work on that than keep trying to push bits into 2.4.

-- 
Revolutions do not require corporate support.
