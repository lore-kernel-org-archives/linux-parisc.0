Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA02841
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Sep 1999 13:28:13 -0600
Date: Tue, 28 Sep 1999 21:28:27 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Simen Thoresen <simen-tt@online.no>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] compiling (and booting) on a 735
Message-ID: <19990928212827.C16533@suse.de>
References: <199909281924.VAA02857@online.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199909281924.VAA02857@online.no>; from Simen Thoresen on Tue, Sep 28, 1999 at 09:30:46PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Sep 28, 1999 at 09:30:46PM +0200, Simen Thoresen wrote:
> Do I need a tftp-server and try for a netboot?

That's what I'd do.

> make menuconfig:
> I've downloaded ncurses (v 4.2 from ftp.gnu.org,
> /gnu/ncurses/ncurses-4.2.tar.gz ) and installed it.
> 
> I then linked /usr/local/include (where ncurses.h resides) to
> /usr/include/ncurses
> (so that /usr/include/ncurses/ncurses.h exists), and sssslightly modified
> linux/scripts/lxdialog/Makefile, as HPUX's find barfed on 
> -maxdepth 1.

use GNU find.

> Running make menuconfig from the kernel directory now works great, and I

very cool.
