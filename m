From: Helge Deller <deller@gmx.de>
Subject: Re: linux-next: manual merge of the parisc-hd tree with Linus' tree
Date: Tue, 04 Feb 2014 09:48:26 +0100
Message-ID: <52F0A95A.8000509@gmx.de>
References: <20140204112718.160f82c52d5219ef8dd3a924@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20140204112718.160f82c52d5219ef8dd3a924@canb.auug.org.au>
List-ID: <linux-next.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 02/04/2014 01:27 AM, Stephen Rothwell wrote:
> Today's linux-next merge of the parisc-hd tree got a conflict in
> arch/parisc/include/asm/elf.h between commit 9dabf60dc4ab ("parisc: add
> flexible mmap memory layout support") from Linus' tree and commit
> 13de8ec38997 ("parisc: add flexible mmap memory layout support") from the
> parisc-hd tree.
> 
> It seems that this tree was rebased before being sent to Linus (I
> understand why) so I will just drop the whole parisc tree for today.
> Please just tidy up.

Thanks Stephen!

I just cleaned it up.

Helge
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJS8KlaAAoJEKGDlV8wpRJBdQEP/13n4pmbCH8Aox+eFwQhi7G5
Jkc6d7DodiVsMNLVK1r/JTXhK+S+7lrQT+ccbU0GKjIHs5ROO+FuE2ZiTOAXAvAq
/maZpewxSq2f5d+gJJZ6bOy7A8N1Zj/5byuuVycz+1XF4jmOj7a+B1wD8/EDqwS3
YmwTJy+Mo7WtTm5i0qeqmExcieoAviPBmH2T4L0FnHeYSCa876kKWUSzEN2Dy1u8
E9oKwlBYdH66gywsp27P8pqnH8sAZuhq30S0q7wHjsMzXgep3poo2Yy+RCrP3Vm2
cpv7cOSgGfDMhhcJ1is0j9UfxYM3mEqThIjAZDcheLDyZ1cmfebks7BojaHBHyQt
WM7/W1LZR9JQDcvuGlDmqrAOQkOJsAdUm4+sL4tdOt2CiKqtReIqQHnCUNnO81de
PEDtkkXhOkdzu12tV0HCTVJSIXQU57/h2VobYlDu5VvYDjB1nthWhTV7l7mBlJjx
Pe0ktJZT/DHs1OWV2nkwRGH92SakPqHxIsHaQ+XyXMkuO9g9rktZ2v3pL1B/uFsA
q5z6EZ0p604kDzwlAJb+mQ5YjBgAQsxliaCayRVDvoKtCo2Rmf1CHHkmzIYyUG9P
qffk+cqdUuYzoz5wEsLCtiyFK3t6IYkW50T+iZjt4Fqm8QKqX9ysxSZLkgTi/mzF
SCQI0dteIigBYakBH1xc
=WwyM
-----END PGP SIGNATURE-----
