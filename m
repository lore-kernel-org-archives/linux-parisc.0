From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH] parisc: define SRCARCH=parisc for parisc64 builds
Date: Sat, 14 Mar 2009 16:49:22 -0400
Message-ID: <20090314204922.GA3167@bombadil.infradead.org>
References: <49862F11.5000808@gmx.de> <20090313045537.GC3907@bombadil.infradead.org> <49BC17CA.9020004@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <49BC17CA.9020004@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Mar 14, 2009 at 09:47:06PM +0100, Helge Deller wrote:
> > and 'parisc64' hasn't been valid as $ARCH since v2.3 or something e=
qually
> > ancient, so I can't see any point in it.
>=20
> =C4h ?
> And how do you build a 64bit parisc kernel then ?
>=20

CONFIG_64BIT.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
