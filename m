Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA31550
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Mar 2000 14:15:49 -0700
From: willy@thepuffingroup.com
Date: Tue, 21 Mar 2000 16:16:33 -0500
To: "Brian S. Julin" <bri@mojo.calyx.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] parisc gcc compile on ALPHA
Message-ID: <20000321161633.J3211@thepuffingroup.com>
References: <Pine.BSO.4.21.0003211437430.8233-100000@mojo.calyx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSO.4.21.0003211437430.8233-100000@mojo.calyx.net>; from Brian S. Julin on Tue, Mar 21, 2000 at 02:44:50PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Mar 21, 2000 at 02:44:50PM -0500, Brian S. Julin wrote:
> 
> I'm back to trying to get things to build on my ALPHA.
> I've got binutils built and installed (even managed to 
> trick the debian packaging scripts into making a package 
> w/o ld :)

but... ld works fine in the latest binutils.  From your error message,
it looks like you aren't using ELF binutils.  When did you last update
your binutils package?
