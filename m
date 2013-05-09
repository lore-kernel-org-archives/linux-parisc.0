From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] parisc: fix NATIVE set up in build
Date: Thu, 9 May 2013 01:04:02 -0400
Message-ID: <201305090104.03897.vapier@gentoo.org>
References: <1367686258-28525-1-git-send-email-vapier@gentoo.org> <BLU0-SMTP74F2A5D74A5FB368D237A797BA0@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2005987.WZF54iGmYA";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP74F2A5D74A5FB368D237A797BA0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart2005987.WZF54iGmYA
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 07 May 2013 19:24:04 John David Anglin wrote:
> This patch breaks builds on current Debian systems that want compiler
> prefixes
> like hppa64-linux-gnu-", "hppa-linux-gnu-" or no prefix for native 32-
> bit.  The NATIVE
> match previous failed and we got the correct FSF prefix.

that was the intention of the code
-mike

--nextPart2005987.WZF54iGmYA
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRiy5DAAoJEEFjO5/oN/WBFwcQANabeQfCkbQqutp+43LDb60a
1+R70iOCiYr67ksyg/JWZ8gEe24jxvI03tt+AYoOJ8q1rFAl5LW/Rqf9d2Yi+/+C
wt3/gklZdwmd51mzGUU3yPzIGqbp6tjSskyS1HnnGrzGi3a7vlAirtT5VAGBGIYT
kLlM4UoXymqggf4CK1xPB8P1kTTLTBfoBeRHDua09MoP9h5PstvyQoGndZGoDLBO
+0V0cOpKPSntSPyee3jyJoYR2lTL5ijWVDNS25q+Szouh2N5+rUrX9/U710x76JZ
DBx6jHO6X2QjuxOiHPboWEPNfeDm2uaGh1GJWjcbjXEbNOFHnqzWDiM0TUAUvOiD
l9TM3RV4CmdK+1XTGvRJLKmHsm3SvfiXGTBPPnrvsPoGA4BlpLt+6lS3br+lFqLg
lGYfcXnC9oHBJRoMn3fMQdesgOvNODf7ojkSb3owpVepFx5YXcp+JJ62duQXGIun
8XB2H07GbIrv+p8I3NjzWa8kvn6qJdY7A6dOf97FfTxq+K5E0m5UkPdNZAhz6zCo
1TXC92OZZ6VctEaE9Sltiko7IFcjlk9K7eDr0Hwue/Gw7szPCPFQLhpsMHlBS5Ro
1NBPHlUdI5nqwmbbDcElRLEuoJ8qeL8FwPhgI0qNdJZpZAOpB917s4itfLzav79p
iHdPBjVF1v71xTdqB02q
=rYV6
-----END PGP SIGNATURE-----

--nextPart2005987.WZF54iGmYA--
