Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] STI framebuffer and PINE 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Mon, 15 Jul 2002 14:39:09 BST." <20020715143909.K27706@parcelfarce.linux.theplanet.co.uk>
References: <20020714091619.B1E35483A@dsl2.external.hp.com> <20020715142028.J27706@parcelfarce.linux.theplanet.co.uk> <1026743879.30202.5.camel@irongate.swansea.linux.org.uk>  <20020715143909.K27706@parcelfarce.linux.theplanet.co.uk> 
Date: Mon, 15 Jul 2002 15:50:22 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020715215022.A8251485D@dsl2.external.hp.com>
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

Matthew Wilcox wrote:
> But the K class hardware is not well supported.  Lan and Console
> are the only two devices which really work; the SCSI cards don't use the
> normal NCR/Symbios chips but a proprietary chip instead.

Not entirely correct. K-class has both HSC (GSC follow-on) and HP-PB "slots".
IIRC, the built-in SCSI is HSC based. But you are right in that all the HP-PB
crud isn't supported.

> Hmm.. anyone want to do a `testimonials' section on the website which
> lists peoples (successful ;-) experiences with using PA/Linux in
> production environments?

ESIEE folks have that already in their "what's supported" HW listing.
Please see the ESIEE "puffin" site for where to submit them.

> > [ObOnTopic] What is the state of the 2.4 pa-risc code in terms of rate
> > of change now. Would it be a good time to use -ac as a real sync up ?
> 
> rate of change is fairly low; i attempted to do a merge with marcelo
> during early 2.4.19 dev, but someone sent some conflicting patches in
> first, i tripped over my own feet trying to use bitkeeper and ran out
> of motivation to fix conflicts myself.

I agree, hppa is quite stable on UP and most SMP systems.
BTW - no one ever said "Thank you" for doing that - kudos!

> at OLS we decided to concentrate on 2.5 RSN.  it's more important to
> work on that than keep trying to push bits into 2.4.

yes - but I'd still like to see our changes get into 2.4.
I just want to be doing development on 2.5.

Alan Cox wrote:
| Is there somewhere I can yank a definitive stable 2.4 tree and I'll take
| a look at the 2.4 stuff. I've had a bit of practice at the merging game
| 8)

Just a bit? ;^)

For a full source tree:
	ftp://ftp.parisc-linux.org/cvs/linux-latest.tar.gz

lrwxrwxrwx    1 bame     ftpadmin       24 Jul 13 18:35 linux-latest.tar.gz -> linux-2.4.18-pa55.tar.gz
-rw-r--r--    1 bame     ftpadmin 30508560 Jul 13 18:35 linux-2.4.18-pa55.tar.gz

hth,
grant
