Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA02370
	for <parisc-linux@puffin.external.hp.com>; Tue, 22 Feb 2000 00:56:56 -0700
Date: Tue, 22 Feb 2000 07:57:37 +0100
From: Dominik Kubla <dominik.kubla@uni-mainz.de>
To: Steve Shack <sshack@cln.etc.bc.ca>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 712 STI support
Message-ID: <20000222075737.A16202@uni-mainz.de>
References: <38B21539.A3D46D7@cln.etc.bc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <38B21539.A3D46D7@cln.etc.bc.ca>; from Steve Shack on Mon, Feb 21, 2000 at 08:48:57PM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Feb 21, 2000 at 08:48:57PM -0800, Steve Shack wrote:
> Hi,
>     Earlier today I was looking at the Openbsd hppa porting page. I
> noticed they appear to have support for the STI. I've downloaded the
> source and looked at it and it seems that yes. They have some support
> for the sti there. So this weeks project for me is getting that going.
> They also have floppy/audio going. But STI's a higher priority in my
> opinion. If anyone has any problems with this let me know.

They also seem to have WAX support.  We tried to netboot a 725/50 with
the latest images from puffin.external yesterday, which went well until
loading the ramdisk triggered a bug in block_dev.c (that's what it
reported), bootlog to follow later today.

Then we tried the OpenBSD image which dropped into the debugger instantly
but correctly identified and activated the intel ethernet chip and the
audio part before going down...

Unfortunately it will be two weeks until we can repeat that exercise,
but i will give my 735/125 a try today to see what happens...

Yours,
  Dominik
-- 
Looking for information about professional american football in Europe? 
Then visit the independant "NFL@Europe Fan Site" at:
            http://www-klinik.uni-mainz.de/staff/kubla/NFLE/
