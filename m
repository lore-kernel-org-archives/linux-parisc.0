Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 648D74CDF
	for <parisc-linux@lists.parisc-linux.org>;
	Thu,  8 Apr 2004 11:08:19 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1BBd0j-0007iX-Q2; Thu, 08 Apr 2004 18:08:17 +0100
Date: Thu, 8 Apr 2004 18:08:17 +0100
From: Matthew Wilcox <willy@debian.org>
To: Andy Walker <ajwalker@broadpark.no>
Subject: Re: [parisc-linux] EISA-Card in 715 /100
Message-ID: <20040408170817.GG18329@parcelfarce.linux.theplanet.co.uk>
References: <40739896.7010600@bluehash.de>
	<1152.192.168.1.54.1081318817.squirrel@www.puszczka.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1152.192.168.1.54.1081318817.squirrel@www.puszczka.com>
Sender: <willy@www.linux.org.uk>
Cc: =?iso-8859-1?Q?R=FCdiger?= Scholz <r.scholz@bluehash.de>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Apr 07, 2004 at 08:20:17AM +0200, Andy Walker wrote:
> > Hello,
> >
> > my HP 715/100 has an extra graphics card (HCRX-24?). Now I have read
> > that some 715s have an EISA-Slot instead of this graphics card. Can I
> > replace my graphics card with an EISA-Card. And if yes, can I also use
> > an ISA-card (e.g. an ISDN-Card)?
> >
> > T.i.a,
> >     Ruediger
> 
> Hi Rüdiger,
> 
> As I understand it, EISA was provided on the 715s by an adapter card that
> sat in the GSC slot. Seems reasonable as both are controlled by WAX. So if
> you have a GSC card in the slot you presumably don't have the adapter.

Not entirely ...

There are two families of 715; 715/33, /50 and /75 (Scorpio) and 715/64,
/80, /100 and /100XC (Mirage or Turnip).

Scorpio is based on the PCX/T chip and Mirage on the PCX/L chip.  These
are quite different architectures.  For example, Mirage has Lasi and Wax
while Scorpio has discrete logic.  If you ever get the chance to compare
the two motherboards, you'll notice how many more components a Scorpio
has than a Mirage.

The EISA adapter (Mongoose) was originally designed for the Scorpio
family which predates GSC.  It has an SGC interface instead, and plugs
into the same slot as the graphics card.  Mirage boxes have both GSC
and SGC connectors, side-by-side on the motherboard.

There is an EISA adapter as a component of Wax, but I believe it's
disabled in Mirage boxes.  It's used in GSC-based C and J class boxes
though.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
