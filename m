Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA29124
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Feb 2000 17:28:43 -0700
From: willy@thepuffingroup.com
Date: Mon, 28 Feb 2000 18:26:34 -0500
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP-UX application support?
Message-ID: <20000228182634.C9944@thepuffingroup.com>
References: <20000228170446.Z9944@thepuffingroup.com> <200002282255.OAA07382@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200002282255.OAA07382@milano.cup.hp.com>; from Grant Grundler on Mon, Feb 28, 2000 at 02:55:49PM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Feb 28, 2000 at 02:55:49PM -0800, Grant Grundler wrote:
> willy@thepuffingroup.com wrote:
> 
> > > And, what about the install location of HP-UX shlibs required for these
> > > 64-bit (and 32-bit?) HP-UX applications?
> > 
> > If we use a dynamically linked application, they would need to be placed
> > in the same location that HP/UX requires them to be.
> 
> On HP-UX "SHLIB_PATH" envirment variables helps the dynamic linker
> find shared libaries. Something equivalent for linux?

We would also use the HP/UX dynamic linker --- I don't want to write
a dynamic SOM linker.  The Linux ld.so uses LD_LIBRARY_PATH (and some
other interesting things -- man 8 ld.so for more details).

> > However,
> > it wouldn't be the recommended way; packaging products as rpm or dpkg
> > (depending which distribution we pick) would be the preferred way to go.
> 
> If we can make .depot installs work, we could pull alot of stuff
> from the porting center for starters. And it would also allow folks
> to publish binaries for both OS's in a common format. That might not
> be interesting to "real" linux hackers. But to folks using HP-UX, it
> would make the transition to linux easier.

I'm not against it, I'm just not terribly excited about it.  I don't know
much about packaging formats and issues people have there.  I guess that
having alien understand depot files is the right approach, but I really
don't know.
