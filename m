Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id PAA12714
	for <parisc-linux@puffin.external.hp.com>; Thu, 7 Dec 2000 15:05:40 -0700
To: Matthew Wilcox <matthew@wil.cx>
cc: Richard Hirst <rhirst@linuxcare.com>, Grant Grundler <grundler@cup.hp.com>,
        parisc-linux@puffin.external.hp.com, debian-hppa@lists.debian.org
Subject: Re: A500 status update 
In-Reply-To: Your message of "Thu, 07 Dec 2000 20:46:49 GMT."
             <20001207204649.A31668@parcelfarce.linux.theplanet.co.uk>
References: <200012070634.WAA07459@milano.cup.hp.com> <200012070649.WAA07510@milano.cup.hp.com> <20001207095613.D7166@linuxcare.com> <E1443ib-0003sK-00@noam.fc.hp.com>  <20001207204649.A31668@parcelfarce.linux.theplanet.co.uk> 
Date: Thu, 07 Dec 2000 15:08:17 -0700
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E1449D7-0008AD-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= On Thu, Dec 07, 2000 at 09:16:25AM -0700, Paul Bame wrote:
= > I've left many syscalls disabled and think we should keep them turned
= > off until it's proven they actually are used.  We should
= > probably consider nuking them in the 32-bit kernel too.
= 
= i noticed we still had readdir.  i believe glibc always uses getdents.

readdir is disabled on parisc64 -- hasn't been a problem yet...

	-P
