From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: define SRCARCH=parisc for parisc64 builds
Date: Sat, 14 Mar 2009 21:47:06 +0100
Message-ID: <49BC17CA.9020004@gmx.de>
References: <49862F11.5000808@gmx.de> <20090313045537.GC3907@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090313045537.GC3907@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Kyle McMartin wrote:
> On Mon, Feb 02, 2009 at 12:24:01AM +0100, Helge Deller wrote:
>> The parisc64 target (HP PARISC, 64bit kernel) is similar to the spar=
c64 or=20
>> m68knommu targets, as it shares all sources for 32- and 64-bit in on=
e single
>> source path which is arch/parisc/.
>> This patch now allows one to use ARCH=3Dparisc64 and just directly b=
uild the
>> 64bit kernel without creating symlinks in arch/ and include/asm-* ma=
nually
>> the same way as it's done for sparc64 and m68knommu.
>>
>=20
> I'm going to drop this patch, powerpc and mips don't do it,=20

they maybe don't need it ?

> and 'parisc64' hasn't been valid as $ARCH since v2.3 or something equ=
ally
> ancient, so I can't see any point in it.

=C4h ?
And how do you build a 64bit parisc kernel then ?

Helge
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
