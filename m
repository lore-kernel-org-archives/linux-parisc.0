Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id GAA06495
	for <parisc-linux@puffin.external.hp.com>; Sun, 7 Nov 1999 06:06:41 -0700
Date: Sun, 7 Nov 1999 14:02:28 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] pgtable.h:acc_rights()
Message-Id: <19991107140228.F14009@mathe.stud.uni-erlangen.de>
References: <19991106172023.L25252@mencheca.ch.genedata.com> <19991106205125.L11609@mathe.stud.uni-erlangen.de> <19991106214859.A1743@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19991106214859.A1743@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>

> the real problem is, that we don't have a working copy on write at the 
> moment. So whenever the first access to COW page is a read access, every
> write access afterwards will lead to an unhandled page fault (which causes
> a panic at the moment). 

Actually, there is some code there to explain this.  I never realized we did 
differentiate between read/write accesses and thought we were still hardcoding
a write access.  This shouldn't be too difficult to work around.

	Philipp Rumpf
