Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA28634
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Feb 2000 16:53:30 -0700
Message-Id: <200002282255.OAA07382@milano.cup.hp.com>
To: willy@thepuffingroup.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP-UX application support? 
In-reply-to: Your message of "Mon, 28 Feb 2000 17:04:46 PST."
             <20000228170446.Z9944@thepuffingroup.com>
Date: Mon, 28 Feb 2000 14:55:49 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

willy@thepuffingroup.com wrote:

> > And, what about the install location of HP-UX shlibs required for these
> > 64-bit (and 32-bit?) HP-UX applications?
> 
> If we use a dynamically linked application, they would need to be placed
> in the same location that HP/UX requires them to be.

On HP-UX "SHLIB_PATH" envirment variables helps the dynamic linker
find shared libaries. Something equivalent for linux?

> However,
> it wouldn't be the recommended way; packaging products as rpm or dpkg
> (depending which distribution we pick) would be the preferred way to go.

If we can make .depot installs work, we could pull alot of stuff
from the porting center for starters. And it would also allow folks
to publish binaries for both OS's in a common format. That might not
be interesting to "real" linux hackers. But to folks using HP-UX, it
would make the transition to linux easier.

grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
