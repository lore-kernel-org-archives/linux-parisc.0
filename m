Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 6A16A482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Oct 2001 09:06:35 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] disks not recognized by new 53c700/53c710 driver (was [parisc-linux-cvs] linux rhirst)
Date: Sat, 13 Oct 2001 17:05:53 +0200
Cc: Albert Strasheim <fullung@ilink.nis.za>,
	parisc-linux@lists.parisc-linux.org
References: <20011013162103.A3604@dogbert.localdomain> <20011013144307.02B16482B@dsl2.external.hp.com> <20011013155903.A22395@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20011013155903.A22395@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Message-Id: <20011013150635.6A16A482A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

On Saturday 13 October 2001 16:59, Matthew Wilcox wrote:
> On Sat, Oct 13, 2001 at 04:42:27PM +0200, Helge Deller wrote:
> > You should prefer "make menuconfig". That way you won't
> > miss such things.
>
> Um?  make oldconfig only prompts you for new options.  it's harder to
> miss things with oldconfig than menuconfig, IMO.

Hi Matthew,

of course you're right. But if I have a lots of new options
I just too often press only lots of "n" <return>s and miss
the new parts. I know that is not the way it should be done,
but as it seems it's not only me who do it this way....

Helge
