Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 480B8484B
	for <parisc-linux@parisc-linux.org>;
	Sat,  7 Feb 2004 15:00:47 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1ApaVK-0007eg-BW; Sat, 07 Feb 2004 22:00:46 +0000
Date: Sat, 7 Feb 2004 22:00:46 +0000
From: Matthew Wilcox <willy@debian.org>
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Merge status with 2.6
Message-ID: <20040207220046.GB24334@parcelfarce.linux.theplanet.co.uk>
References: <20040207172108.GV24334@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040207172108.GV24334@parcelfarce.linux.theplanet.co.uk>
Sender: <willy@www.linux.org.uk>
Cc: parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, Feb 07, 2004 at 05:21:08PM +0000, Matthew Wilcox wrote:
> drivers/ide/pci/ns87415.c: I pinged Bart about this patch last week.

This patch just went into Linus' tree.

> drivers/net/tg3.c: Doesn't actually affect PA-RISC; I'll try to get it
> 	merged with jgarzik/davem this week.

Merged with davem.

> drivers/net/tulip: Some of this I'll try to get merged with jgarzik,
> 	other bits he wants rewritten before he'll accept.

The majority of our diff is now merged into jgarzik's tree.

Still some other pieces to do.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
