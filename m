Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8FFDE49EB
	for <parisc-linux@lists.parisc-linux.org>;
	Sun,  4 Apr 2004 08:13:55 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1BA8Nl-0004Cu-Ha; Sun, 04 Apr 2004 15:13:53 +0100
Date: Sun, 4 Apr 2004 15:13:53 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Domain Validation or gcc 3.3.3 bug?
Message-ID: <20040404141353.GS16469@parcelfarce.linux.theplanet.co.uk>
References: <20040404072311.GA2650@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040404072311.GA2650@colo.lackof.org>
Sender: <willy@www.linux.org.uk>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, Apr 04, 2004 at 12:23:11AM -0700, Grant Grundler wrote:
> I trying to build/boot 64-bit UP kernel on an A500.
> But using gcc 3.3.3 tool chain...I'd just blame the toolchain
> but this box (intentionally) has a "wide" SCSI disk tray
> connected to the "narrow" SE SCSI port on the a500.
> Seems the Domain Validation isn't quite working?
> Or this remind someone of any gcc 3.3.3 bugs?

> sym0: <896> rev 0x7 at pci 0000:00:01.0 irq 129
> sym0: No NVRAM, ID 7, Fast-40, LVD, parity checking
> sym0: SCSI BUS has been reset.
> scsi0 : sym-2.1.18f

2.1.18f doesn't have domain validation ... you must have downgraded to
an earlier version of the sym2 driver.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
