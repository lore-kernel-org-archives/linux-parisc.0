From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: define SRCARCH=parisc for parisc64 builds
Date: Sat, 14 Mar 2009 21:56:16 +0100
Message-ID: <49BC19F0.1080405@gmx.de>
References: <49862F11.5000808@gmx.de> <20090313045537.GC3907@bombadil.infradead.org> <49BC17CA.9020004@gmx.de> <20090314204922.GA3167@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090314204922.GA3167@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Kyle McMartin wrote:
> On Sat, Mar 14, 2009 at 09:47:06PM +0100, Helge Deller wrote:
>>> and 'parisc64' hasn't been valid as $ARCH since v2.3 or something e=
qually
>>> ancient, so I can't see any point in it.
>> =C4h ?
>> And how do you build a 64bit parisc kernel then ?
>>
>=20
> CONFIG_64BIT

No, this does not work with a cleanly checked-out tree.
Just remove the arch/parisc64 link which you created manually.

Helge
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
