Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252]) by dsl2.external.hp.com (Postfix) with ESMTP
	id B23C3482C; Sun, 28 Mar 2004 08:48:40 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1B7cWc-0007ZJ-Nd; Sun, 28 Mar 2004 16:48:38 +0100
Date: Sun, 28 Mar 2004 16:48:38 +0100
From: Matthew Wilcox <willy@debian.org>
To: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] [PATCH] asm-parisc/ide.h cleanup (there are no
	standard ports)
Message-ID: <20040328154838.GA26179@parcelfarce.linux.theplanet.co.uk>
References: <200403241443.43206.bzolnier@elka.pw.edu.pl>
	<20040327222810.GB24782@colo.lackof.org>
	<200403280024.57672.bzolnier@elka.pw.edu.pl>
	<20040327234926.GC24782@colo.lackof.org>
	<20040328002139.GE750@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040328002139.GE750@tausq.org>
Sender: <willy@www.linux.org.uk>
Cc: Bartlomiej Zolnierkiewicz <B.Zolnierkiewicz@elka.pw.edu.pl>,
	linux-ide@vger.kernel.org, Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, Mar 27, 2004 at 04:21:39PM -0800, Randolph Chung wrote:
> > I was told offline my hypothetical example is in fact hypothetical.
> > parisc won't build with IDE unless PCI is defined. I haven't tried.
> 
> not exactly. what i meant is, without this patch, if you built pa with
> ide enabled but pci disabled you will get a compilation error.
> 
> i think this patch looks ok too. will commit to our tree and let willy
> propogate upstream :)

I think Bart's patch already made it into Linus' tree ;-)  Whatever;
I'll push it to Linus after 2.6.5 comes out if it hasn't already made
it upstream.  Thanks, guys.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
