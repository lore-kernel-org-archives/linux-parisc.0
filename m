From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [hp-parisc:boot_devel 2/2] arch/powerpc/boot/inflate.c:358:18: error: 'uint32_t' undeclared
Date: Sun, 20 Aug 2017 08:20:20 +0200
Message-ID: <1693319.G71mkjZMyY@daneel.sf-tec.de>
References: <201708200711.P5rCbvmM%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3411059.sa7WtQPL5J"; micalg="pgp-"; protocol="application/pgp-signature"
Cc: linux-parisc@vger.kernel.org
To: kbuild test robot <fengguang.wu@intel.com>, kbuild-all@01.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <201708200711.P5rCbvmM%fengguang.wu@intel.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart3411059.sa7WtQPL5J
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Sonntag, 20. August 2017, 07:51:13 schrieb kbuild test robot:
> tree:  
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git
> boot_devel head:   2de6ba7d548dff737bdc47173c8a7b6b20d94966
> commit: 2de6ba7d548dff737bdc47173c8a7b6b20d94966 [2/2] Initial support for
> compressed boot config: powerpc-akebono_defconfig (attached as .config)
> compiler: powerpc-linux-gnu-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         wget
> https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O
> ~/bin/make.cross chmod +x ~/bin/make.cross
>         git checkout 2de6ba7d548dff737bdc47173c8a7b6b20d94966
>         # save the attached .config to linux build tree
>         make.cross ARCH=powerpc

You will not get help for powerpc problems on the parisc list.

Eike
--nextPart3411059.sa7WtQPL5J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEABECAAYFAlmZKikACgkQXKSJPmm5/E5uRgCfRLDX/A39clv04jrJ50ncLvk2
CIQAoKOF9dG94WYUI8e8O37hamyLTf35
=qNiV
-----END PGP SIGNATURE-----

--nextPart3411059.sa7WtQPL5J--

