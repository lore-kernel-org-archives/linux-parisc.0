Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C938D4856
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  9 Mar 2004 14:04:03 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1B0oOO-0001Wn-Pi; Tue, 09 Mar 2004 21:04:00 +0000
Date: Tue, 9 Mar 2004 21:04:00 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] No PS2 keyboard/mouse on B132L, 2.6.[34]
Message-ID: <20040309210400.GM2148@parcelfarce.linux.theplanet.co.uk>
References: <25271.193.161.152.244.1078745317.squirrel@www.puszczka.com>
	<20040309053615.GA11669@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040309053615.GA11669@colo.lackof.org>
Sender: <willy@www.linux.org.uk>
Cc: Andy Walker <andy@puszczka.com>, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Mar 08, 2004 at 10:36:15PM -0700, Grant Grundler wrote:
> On Mon, Mar 08, 2004 at 12:28:37PM +0100, Andy Walker wrote:
> > Why is 8/12 (0x00089) reported as unknown in the device table and in
> > proc/interrupts? Its the Zalon HVD SCSI.
> ...
> > 6. unknown device at 0xfff8c000 [8/12] { 4, 0x0, 0x03c, 0x00089 }
> 
> It means we don't have an entry for Zalon in arch/parisc/kernel/hardware.c
> Can you submit a patch for that?
> 
> (I confess: I'm being very lazy tonight and don't want to figure
> what needs to go into the hardware.c array)

*grumble*.  I changed the output format so you could simply copy and paste
it into hardware.c!  That's exceptionally lazy of you :-P

(you can tell boot logs that predate this change because they don't use 
{ } around the numbers).

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
