Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA26929
	for <parisc-linux@puffin.external.hp.com>; Sun, 6 Feb 2000 12:34:01 -0700
From: willy@thepuffingroup.com
Date: Sun, 6 Feb 2000 14:30:23 -0500
To: "Brian S. Julin" <bri@mojo.calyx.net>
Cc: Alex deVries <adevries@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Boot info from 715/64
Message-ID: <20000206143023.C319@thepuffingroup.com>
References: <388F492B.1E8EF289@linuxcare.com> <Pine.BSO.4.21.0002021544170.19835-100000@mojo.calyx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSO.4.21.0002021544170.19835-100000@mojo.calyx.net>; from Brian S. Julin on Wed, Feb 02, 2000 at 03:55:08PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Feb 02, 2000 at 03:55:08PM -0500, Brian S. Julin wrote:
> Question for the kernel high priests on the list -- is the rest of
> the input-linux stuff going into the 2.3 series soon -- if so I think 
> I'll work on converting the HIL driver over to linux-input and fitting
> the linux-input patch to this kernel (which luckily there exists one for).

Last I heard, it was a 2.5 thing.  If you want to do kernel work on a
715/64, the ncr scsi driver needs to be looked at.  It may just work if
you try it :-) [I suspect it may need some cache flushing added though]
