Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA21817
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Mar 2000 12:30:15 -0700
From: Hugo.van.der.Kooij@caiw.nl
Date: Wed, 15 Mar 2000 19:30:40 +0100 (CET)
To: Philipp Rumpf <prumpf@inwestnet.de>
Cc: "Brian S. Julin" <bri@mojo.calyx.net>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Cross compiler -- on Alpha?
In-Reply-To: <20000315182657.D673@abacus.local>
Message-ID: <Pine.LNX.4.10.10003151927530.21833-100000@bastion.hugo.vanderkooij.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 15 Mar 2000, Philipp Rumpf wrote:

> > Will the new ELF compiler/binutils work on an Alpha
> > Linux box?  (I wouldn't think it would make a difference
> > what the host was but then there may be a subtlety there
> > I'm unaware of.)  My x86 is out of disk.
> 
> It might.  The only real difference between alpha and i386 to run a
> cross-compiler on is sizeof(long), and I don't think we rely on that
> too heavily in gcc.

Wouldn't big endian vs little endian be an issue?

I know there is plenty of software out there that does not use proper
handling of pointers and that will break on my Alpha while you can get
away with it on intel based machines. The problem is due to bad coding but
it could be a good case to try and see if the code is clean enough.

Hugo.

-- 
Hugo van der Kooij; Oranje Nassaustraat 16; 3155 VJ  Maasland
hvdkooij@caiw.nl	http://home.kabelfoon.nl/~hvdkooij/
--------------------------------------------------------------
Use of any of my email addresses for unsollicited (commercial)
    email is a clear intrusion of my privacy and illegal!
