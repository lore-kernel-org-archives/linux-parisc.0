Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA04128
	for <parisc-linux@puffin.external.hp.com>; Sun, 14 Jan 2001 10:59:16 -0700
Date: Sun, 14 Jan 2001 13:02:20 -0500
From: "Phillip D. Beal" <pdbeal@louisville.edu>
To: Alex deVries <alex@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/80 problem
Message-ID: <20010114130220.A92364@athena.louisville.edu>
References: <20010111213734.D134330@athena.louisville.edu> <3A5E8AA6.6D825A61@linuxcare.com> <20010112182012.H13351@neep.com.au> <20010113223513.A63406@athena.louisville.edu> <3A614153.68903841@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A614153.68903841@linuxcare.com>; from alex@linuxcare.com on Sun, Jan 14, 2001 at 01:04:03AM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Jan 14, 2001 at 01:04:03AM -0500, Alex deVries wrote:
> "Phillip D. Beal" wrote:
> > 
> > I've tried all three, and the boot
> > sequence from the netowrk fails.  
> 
> I suspect there's a problem with your network boot server (ie. rbootd)
> *not* the image you're booting.  Does the log output of rbootd indicated
> a successful  transfer of the bootfile?  You can do this by running
> 'rbootd -d', which should spew debug info to the console.

Well, the odd thing is that the network setup works fine for a 735 and
755, but not the 715.  But wait, you said a 715 uses bootp not rboot,
and I know the 735 and 755 use the rbootd and can boot from my network
setup.

-- 
Phillip Beal                           ___           _               _   
Electrical and Computer Engineering   | _ ) ___ __ _| |___  _ _  ___| |_ 
pdbeal@louisville.edu                 | _ \/ -_) _` | |_ /_| ' \/ -_)  _|
http://www.bealz.net/                 |___/\___\__,_|_/__(_)_||_\___|\__|
