Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id HAA06040
	for <parisc-linux@puffin.external.hp.com>; Tue, 3 Aug 1999 07:41:17 -0600
Received: from sduchene.users.mindspring.com (user-38ld40b.dialup.mindspring.com [209.86.144.11])
	by smtp4.mindspring.com (8.8.5/8.8.5) with ESMTP id JAA13996
	for <parisc-linux@thepuffingroup.com>; Tue, 3 Aug 1999 09:42:18 -0400 (EDT)
Received: (from sad@localhost)
	by sduchene.users.mindspring.com (8.8.8/8.8.8) id JAA09892
	for parisc-linux@thepuffingroup.com; Tue, 3 Aug 1999 09:43:08 -0400
From: "Steven A. DuChene" <sduchene@mindspring.com>
Date: Tue, 3 Aug 1999 09:43:08 -0400
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] unsatisfied symbols
Message-ID: <19990803094308.G3443@sduchene.users.mindspring.com>
References: <19990803114003.A5018@grcbd508.grc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19990803114003.A5018@grcbd508.grc.hp.com>; from Ingo Matthaes on Tue, Aug 03, 1999 at 11:40:03AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Aug 03, 1999 at 11:40:03AM +0200, Ingo Matthaes wrote:
> it is not possible to compile the latest CVS-Kernels. I tried 
> various configurations, but I still get unsatisfied symbol __delay.
> Is anybody out there, who compiles the actual sources succesfully ?
> make menuconfig seems to be broken too (since 4 weeks)
> 

Ingo:
When you say make menuconfig seems to be broken, what exactly doesn't
work? As I understand the current method for compiling kernels takes
place using HP-UX with gcc. Does it also include ncurses or is the
group attempting to use the native HP-UX curses? If the later then
understand that HP-UX has at last count at least three or four
different curses libraries. Some of them are badly broken while others
are only semi broken. My advice is to get ncurses and use it instead
of the various native curses implementations.

If the make menuconfig problem isn't a problem with the curses
implementation on HP-UX I could be barking up the wrong tree here.
-- 
Steven A. DuChene   Linux Fan!  http://www.mindspring.com/~sduchene

Outside of a dog, a book is a man's best friend. Inside a dog it's
too dark to read.
                -- Groucho Marx
