Received: from smtp1.cern.ch (smtp1.cern.ch [137.138.128.38])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id IAA29167
	for <parisc-linux@puffin.external.hp.com>; Mon, 11 Dec 2000 08:35:13 -0700
Sender: Jes.Sorensen@cern.ch
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@puffin.external.hp.com, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] A500 status update
References: <200012070634.WAA07459@milano.cup.hp.com>
From: Jes Sorensen <jes@linuxcare.com>
Date: 11 Dec 2000 16:37:16 +0100
In-Reply-To: Grant Grundler's message of "Wed, 6 Dec 2000 22:34:55 -0800 (PST)"
Message-ID: <d3d7ez6kb7.fsf@lxplus015.cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "Grant" == Grant Grundler <grundler@cup.hp.com> writes:

Grant> o dd to
Grant> raw disk isn't working right. "No space left on device".  See
Grant> the output below.

Likely cause would be that the structs for stat don't match between
the kernel and glibc. I still think the best approach would be to go
for a clean 64 bit userland from the beginning as we have on the Alpha
and ia64 and provide backwards compat support afterwards. I don't like
to see the hppa64 port end up in the same situation as sparc64 where
almost nothing gets done for years because there is already a 32 bit
userland.

Anyway it looks to me like someone needs to sit down and decide on a
strategy for this and review all the data structures accordingly.

Grant> o don't see Acenic driver output. I've got
Grant> CONFIG_ACENIC=y and the device is definitely seen by PCI.

Bug in the driver, compile it as a loadable module and it will work
... or grab http://home.cern.ch/~jes/gige/acenic-0.49-test2.tar.gz

Jes
