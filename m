From: Alex Ivanov <gnidorah@p0n4ik.tk>
Subject: Re: [PATCH]  parisc: Fix cache routines to ignore vma's with an invalid pfn
Date: Wed, 24 Jul 2013 14:18:37 +0400
Message-ID: <FFAF7250-C718-46D5-B632-A6FE442A0EFF@p0n4ik.tk>
References: <BLU0-SMTP618F2A575D86195DC418DD976F0@phx.gbl> <51EEFB3B.3010107@gmx.de> <BLU0-SMTP673C7B36CA7DEFADDE7F9B976F0@phx.gbl>
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
Content-Type: text/plain; charset=koi8-r
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP673C7B36CA7DEFADDE7F9B976F0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

24.07.2013, =D7 3:44, John David Anglin <dave.anglin@bell.net> =CE=C1=D0=
=C9=D3=C1=CC(=C1):

> On 23-Jul-13, at 5:52 PM, Helge Deller wrote:
>=20
>> I've restructured the functions with cleaner return/continue code an=
d submitted it into my "for-next" git tree at
>> https://patchwork.kernel.org/patch/2825923/mbox/
>=20
> Looks fine to me.  I'll test soon.
>=20
> Dave
> --
> John David Anglin	dave.anglin@bell.net
>=20
>=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-paris=
c" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Thank you both! It behaves normally at my side.--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
