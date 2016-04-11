From: Rolf Eike Beer <eike@sf-mail.de>
Subject: Re: [PATCH] parisc: Simplify and speed up get_user() and put_user()
Date: Mon, 11 Apr 2016 19:26:02 +0200
Message-ID: <1967628.mnYmdTmhtu@caliban.sf-tec.de>
References: <20160409062614.GA4203@ls3530.box>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4675794.CxtPFjkCRH"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20160409062614.GA4203@ls3530.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart4675794.CxtPFjkCRH
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Samstag, 9. April 2016, 08:26:14 schrieb Helge Deller:
> This patch simplifies the code for get_user() and put_user() a lot.
> 
> Instead of accessing kernel memory (%sr0) and userspace memory (%sr3)
> hard-coded in the assembler instruction, we now preload %sr2 with either
> %sr0 (for accessing KERNEL_DS) or with sr3 (to access USER_DS) and
> use %sr2 in the load directly.
> 
> The generated code avoids a branch and speeds up execution by generating
> less assembler instructions.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>

Tested-by: Rolf Eike Beer <eike-kernel@sf-tec.de>

Eike
--nextPart4675794.CxtPFjkCRH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEABECAAYFAlcL3jAACgkQXKSJPmm5/E7bcgCfTdsqHm4xFukk1+dioJ6gMGat
GDcAnj67xN4sI397c0qdnZtg8qHUHweV
=xQAI
-----END PGP SIGNATURE-----

--nextPart4675794.CxtPFjkCRH--

