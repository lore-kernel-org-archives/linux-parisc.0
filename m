Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA28093
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Feb 2000 16:26:29 -0700
Date: Mon, 28 Feb 2000 23:26:17 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: willy@thepuffingroup.com
Cc: "MEYER,ALAN C. HP-FtCollins,ex1\"" <alan_meyer@hp.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP-UX application support?
Message-ID: <20000228232617.N812@abacus.local>
References: <56D553C0B61BD311AD2300A0C9F485C2038D0FD0@xfc02.fc.hp.com> <20000228170446.Z9944@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000228170446.Z9944@thepuffingroup.com>; from willy@thepuffingroup.com on Mon, Feb 28, 2000 at 05:04:46PM -0500
List-ID: <linux-parisc.vger.kernel.org>

> > And, what about the install location of HP-UX shlibs required for these
> > 64-bit (and 32-bit?) HP-UX applications?
> 
> If we use a dynamically linked application, they would need to be placed
> in the same location that HP/UX requires them to be.

We might want to look at the gnemul hack sparc did (include/asm-sparc/namei.h)
- ask the sparc people for their experiences with it first though.
