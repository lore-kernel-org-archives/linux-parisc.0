Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0265F48A2
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 28 Feb 2004 10:41:50 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1Ax8TF-0002tA-70; Sat, 28 Feb 2004 17:41:49 +0000
Date: Sat, 28 Feb 2004 17:41:49 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] C3000 and Promise Ultra100 TX2 PCI Controller
Message-ID: <20040228174149.GD25779@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.58.0402260127230.26951@sal.ucc.ie>
	<20040226051124.GB3645@colo.lackof.org>
	<Pine.LNX.4.58.0402260513010.28003@sal.ucc.ie>
	<20040226155659.GA11451@colo.lackof.org>
	<1077907459.29711.13.camel@dhcp23.swansea.linux.org.uk>
	<20040227212356.GA28668@colo.lackof.org>
	<Pine.LNX.4.58.0402272325410.9660@sal.ucc.ie>
	<Pine.LNX.4.58.0402280055400.10811@sal.ucc.ie>
	<1077984432.31248.4.camel@dhcp23.swansea.linux.org.uk>
	<20040228164506.GA11659@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040228164506.GA11659@colo.lackof.org>
Sender: <willy@www.linux.org.uk>
Cc: "M. Grabert" <xam@cs.ucc.ie>, parisc-linux@lists.parisc-linux.org,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, Feb 28, 2004 at 09:45:06AM -0700, Grant Grundler wrote:
> include/asm/io.h:#define readw(addr) (*(volatile unsigned short *) __io_virt(addr))
> 
> 
> Uhoh..no swapping at all in this case.
> I was expecting readw to swap bytes.
> Am I just confused again about how a BE is supposed to behave?
> *sigh*

You're confused by looking at the unused definition ;-)

#define readw(addr) le16_to_cpu(__raw_readw(addr))

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
