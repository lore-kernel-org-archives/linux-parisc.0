Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 23B244829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Jan 2003 05:52:38 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18Yn25-0006DC-00; Wed, 15 Jan 2003 12:52:37 +0000
Date: Wed, 15 Jan 2003 12:52:37 +0000
From: Matthew Wilcox <willy@debian.org>
To: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Interesting network card ...
Message-ID: <20030115125237.E26554@parcelfarce.linux.theplanet.co.uk>
References: <20030115085619.GA17760@aurinko.ntc.nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030115085619.GA17760@aurinko.ntc.nokia.com>; from mnahkola@trinms01.ntc.nokia.com on Wed, Jan 15, 2003 at 10:56:20AM +0200
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

On Wed, Jan 15, 2003 at 10:56:20AM +0200, Nahkola Mikko wrote:
> What's the deal with the various HP-branded tulip-based NICs? Are they 
> expected to "just work" or what? I found one that sure doesn't, but then 
> again, but my kernel isn't actually new ... (2.4.18-32 packaged)

we're always interested in hearing about cards that don't
work.. hp-branded or not ;-)

> The card is the HP ANA-6911A/AUI (yes, it's a 10/100BT with coax and 
> AUI too), part# A3738-60001, and it _is_ found by the tulip driver, but 
> for some reason the driver claims that "no MII transceiver found", and 
> does list the 10B2 and AUI connections too. But I can't seem to make it 
> form a link with TP or coax, no matter what I do. And the AUI connector 
> is blocked by the C240 chassis. Is there a simple way to force the use of 
> a certain transceiver? Tried mii-tool already and it didn't help much - 
> but then again it doesn't seem to know about the coax and AUI at all...

how very interesting.  could you send an lspci -vvx for that card?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
