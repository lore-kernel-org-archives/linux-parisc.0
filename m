Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA02892
	for <parisc-linux@puffin.external.hp.com>; Sat, 6 Nov 1999 13:49:34 -0700
Received: from hub-fue by rachael.franken.de
	via rmail with uucp
	id <m11kCnS-0027anC@rachael.franken.de>
	for thepuffingroup.com!parisc-linux; Sat, 6 Nov 1999 21:50:50 +0100 (MET)
	(Smail-3.2 1996-Jul-4 #4 built DST-Sep-8)
Date: Sat, 6 Nov 1999 21:48:59 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Philipp Rumpf <prumpf@mathe.stud.uni-erlangen.de>
Cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] pgtable.h:acc_rights()
Message-ID: <19991106214859.A1743@alpha.franken.de>
References: <19991106172023.L25252@mencheca.ch.genedata.com> <19991106205125.L11609@mathe.stud.uni-erlangen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19991106205125.L11609@mathe.stud.uni-erlangen.de>; from Philipp Rumpf on Sat, Nov 06, 1999 at 08:51:25PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Nov 06, 1999 at 08:51:25PM +0100, Philipp Rumpf wrote:
> > Why is acc_rights written like this?
> 
> See my commit message.  Basically that works around the "pages mapped
>  read-only when they should be read-write" problem Thomas reported.

the real problem is, that we don't have a working copy on write at the 
moment. So whenever the first access to COW page is a read access, every
write access afterwards will lead to an unhandled page fault (which causes
a panic at the moment). 

Thomas.

-- 
   This device has completely bogus header. Compaq scores again :-|
It's a host bridge, but it should be called ghost bridge instead ;^)
                                        [Martin `MJ' Mares on linux-kernel]
