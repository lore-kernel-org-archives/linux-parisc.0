Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A3DF548CB
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 27 Feb 2004 18:53:55 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1Awtfu-0000tn-ME; Sat, 28 Feb 2004 01:53:54 +0000
Date: Sat, 28 Feb 2004 01:53:54 +0000
From: Matthew Wilcox <willy@debian.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Subject: Re: [parisc-linux] C3000 and Promise Ultra100 TX2 PCI Controller
Message-ID: <20040228015354.GX25779@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.58.0402260003140.26587@sal.ucc.ie>
	<1077757727.26560.7.camel@dhcp23.swansea.linux.org.uk>
	<Pine.LNX.4.58.0402260127230.26951@sal.ucc.ie>
	<20040226051124.GB3645@colo.lackof.org>
	<Pine.LNX.4.58.0402260513010.28003@sal.ucc.ie>
	<20040226155659.GA11451@colo.lackof.org>
	<1077907459.29711.13.camel@dhcp23.swansea.linux.org.uk>
	<20040227212356.GA28668@colo.lackof.org>
	<Pine.LNX.4.58.0402272325410.9660@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.58.0402272325410.9660@sal.ucc.ie>
Sender: <willy@www.linux.org.uk>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>,
	Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Feb 27, 2004 at 11:50:20PM +0000, M. Grabert wrote:
> I've created a modified io.c for 2.4 and for 2.6 (can be found here:
> http://www.cs.ucc.ie/~xam/io/ ). I used a CVS version updated a couple
> of minutes ago, just after the merge with 2.6.4-rc1.

Erm, sorry, I misled you.  I started the merge, went out for dinner,
came back and finished it off.  Should be good now.

There's typically two messages to the -cvs list (plus all the directory
add mails ...), the first is adding Linus' new tree on a branch, then
the second (which should be in your mailbox by now) is the merge back
to mainline.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
