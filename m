Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hal.pp.fishpool.fi (hal.pp.fishpool.fi [195.197.229.212])
	by dsl2.external.hp.com (Postfix) with ESMTP id A51634829
	for <parisc-linux@parisc-linux.org>; Fri, 11 Oct 2002 06:59:10 -0600 (MDT)
Date: Fri, 11 Oct 2002 15:59:02 +0300 (EEST)
From: =?iso-8859-1?Q?Martin-=C9ric_Racine?= <q-funk@pp.fishpool.fi>
To: Matthew Wilcox <willy@debian.org>
Cc: Thibaut VARENE <varenet@esiee.fr>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] hardware features of 712-60 ?
In-Reply-To: <20021011135400.J18545@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.21.0210111557140.24681-100000@hal.pp.fishpool.fi>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, 11 Oct 2002, Matthew Wilcox wrote:

> On Fri, Oct 11, 2002 at 03:22:14PM +0300, Martin-=C9ric Racine wrote:
> > 3) Optional RS-232:  which module?  In which dialogue?
>=20
> it says "serial driver" right after it.  the precise option you need to
> turn on is :
>       bool '   serial port on GSC support' CONFIG_SERIAL_GSC
>=20
> > d) Optional BA:  which module?  In which dialogue?
> > e) Core BA:  which module?  In which dialogue?
>=20
> dep_bool '  Lasi I/O support' CONFIG_GSC_LASI $CONFIG_GSC
>=20
> is this really so hard?

Yes.  Nobody can guess about the GSC items, or if using only the Lasi-somet=
hing
option is enough when there is also a generic driver for some item.

--=20
Martin-=C9ric Racine, Espoo, Finland.
"Kas sa tahad mind? - Nej!!! =C4r du en idiot?!!"
http://www.pp.fishpool.fi/~q-funk/
