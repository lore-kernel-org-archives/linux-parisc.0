Received: from www.linux.org.uk (IDENT:root@parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id LAA25918
	for <parisc-linux@puffin.external.hp.com>; Fri, 8 Dec 2000 11:06:16 -0700
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 144RLU-0001kI-00; Fri, 08 Dec 2000 17:30:08 +0000
Date: Fri, 8 Dec 2000 17:30:08 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Paul Bame <bame@noam.fc.hp.com>
Cc: Matthew Wilcox <matthew@wil.cx>, Richard Hirst <rhirst@linuxcare.com>,
        Grant Grundler <grundler@cup.hp.com>,
        parisc-linux@puffin.external.hp.com, debian-hppa@lists.debian.org
Subject: Re: A500 status update
Message-ID: <20001208173008.B5974@parcelfarce.linux.theplanet.co.uk>
References: <200012070634.WAA07459@milano.cup.hp.com> <200012070649.WAA07510@milano.cup.hp.com> <20001207095613.D7166@linuxcare.com> <E1443ib-0003sK-00@noam.fc.hp.com> <20001207204649.A31668@parcelfarce.linux.theplanet.co.uk> <E1449D7-0008AD-00@noam.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E1449D7-0008AD-00@noam.fc.hp.com>; from bame@noam.fc.hp.com on Thu, Dec 07, 2000 at 03:08:17PM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Dec 07, 2000 at 03:08:17PM -0700, Paul Bame wrote:
> = On Thu, Dec 07, 2000 at 09:16:25AM -0700, Paul Bame wrote:
> = > I've left many syscalls disabled and think we should keep them turned
> = > off until it's proven they actually are used.  We should
> = > probably consider nuking them in the 32-bit kernel too.
> = 
> = i noticed we still had readdir.  i believe glibc always uses getdents.
> 
> readdir is disabled on parisc64 -- hasn't been a problem yet...

oh good.  want to disable it on parisc32 too?

-- 
Revolutions do not require corporate support.
