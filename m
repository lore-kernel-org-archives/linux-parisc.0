Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA30064
	for <parisc-linux@puffin.external.hp.com>; Sat, 13 Jan 2001 20:32:10 -0700
Received: from athena.louisville.edu (athena.louisville.edu [136.165.1.37])
	by erouter1.it-datacntr.louisville.edu (Postfix) with ESMTP id 5001323339
	for <parisc-linux@thepuffingroup.com>; Sat, 13 Jan 2001 22:35:45 -0500 (EST)
Date: Sat, 13 Jan 2001 22:35:13 -0500
From: "Phillip D. Beal" <pdbeal@louisville.edu>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/80 problem
Message-ID: <20010113223513.A63406@athena.louisville.edu>
References: <20010111213734.D134330@athena.louisville.edu> <3A5E8AA6.6D825A61@linuxcare.com> <20010112182012.H13351@neep.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010112182012.H13351@neep.com.au>; from andrew@neep.com.au on Fri, Jan 12, 2001 at 06:20:15PM +0800
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jan 12, 2001 at 06:20:15PM +0800, Andrew Shugg wrote:
> Alex deVries said:
> > Okay... I *think* that 735 and 755 boot using rbootd.
> 
> The 735 certainly does.

Right I know that, but what file is used from a kernel build to boot a
715?  iplboot? lifimage? vmlinux?  I've tried all three, and the boot
sequence from the netowrk fails.  It can't load iplboot for some reason.
my bootptab looks identical to the one from the nfsroot howto, otherthan
the ip I'm giving is different.  what does it require to get iplboot to
load on a network boot for a 715 using bootp?

-- 
Phillip Beal                           ___           _               _   
Electrical and Computer Engineering   | _ ) ___ __ _| |___  _ _  ___| |_ 
pdbeal@louisville.edu                 | _ \/ -_) _` | |_ /_| ' \/ -_)  _|
http://www.bealz.net/                 |___/\___\__,_|_/__(_)_||_\___|\__|
