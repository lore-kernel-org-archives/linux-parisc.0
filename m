Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail1.WPI.EDU (mail1.WPI.EDU [130.215.36.102])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0AD49483E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Nov 2003 11:00:12 -0700 (MST)
Received: from mcafee.wpi.edu (mcafee.WPI.EDU [130.215.36.86])
	by mail1.WPI.EDU (8.12.10/8.12.10) with SMTP id hABI0BdC005698
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Nov 2003 13:00:11 -0500
Received: from vapier.res.WPI.NET (vapier.res.WPI.NET [130.215.224.143])
	by smtp.WPI.EDU (8.12.10/8.12.10) with ESMTP id hABI08DF003025
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Nov 2003 13:00:08 -0500
From: Mike Frysinger <vapier@gentoo.org>
Reply-To: vapier@gentoo.org
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] framebuffer drawing incorrectly ?
Date: Tue, 11 Nov 2003 13:00:14 -0500
References: <200311101646.55611.vapier@gentoo.org> <20031110225434.GA27176@solo.franken.de>
In-Reply-To: <20031110225434.GA27176@solo.franken.de>
MIME-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_zOSs/50bSVWsmdv";
  charset="iso-8859-1"
Message-Id: <200311111300.19041.vapier@gentoo.org>
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

--Boundary-02=_zOSs/50bSVWsmdv
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Description: signed data
Content-Disposition: inline

On Monday 10 November 2003 17:54, you wrote:
> try to turn off double buffering.

that did the trick, thanks everyone
-mike

--Boundary-02=_zOSs/50bSVWsmdv
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iQIVAwUAP7EjskFjO5/oN/WBAQJ2zBAA0LezmO0S+nHOksjDln7I2k612+NoDPMe
WJwUtQb1llIuda/9q7+PF3IzmDqeAIfzr5zQqHkTSkb8a3htrxURfpZrDQQsSMlq
28Lpq2zGcBman993EXEyt/ppj0S86Jbcgs0bOsV8EgmHjtuLLXzHNrnQl71QLP/+
orpXvrbkm+AZne1UT/6kd3576xxloLHKhoQF0rBCNIkRufGZfDHzdPf9dXId8AIU
mEJbG4gSDmC+4hbxQnZ9pNOUPA/qW3y0nSfRRKyRbwr0uIvDOTaCeIm5brAw3TpW
X7q6/QysT+iKY4QfBoFwWEcPZcW9C9TXhDxMEgXzuUnNBRmnnC8Q4SfFFLGD0+cN
VmZj+kvenUWnenI7AtaeEYRQM89Mpbhv4IFLoQb714WDk4vrTaN895ZhjDHc3XJY
VdI/MCvI9L9Jj50wsB+c2xM0rLlixGUhTQReVRDwRqK28ju0HMFtMXudxDQQ5vge
k/Ly4oUHJ6gm5tYsucMmPvOgawODwE6qJzpe7XTt9YbQ/yLfjeyQ24LH0kKuT6Az
+7H/PgK4nwdQPXaQgNLhvUXEAD49lLM7uyUJCfV8SXiKRntkNmKoRXK2cfZT+avH
XRGEiB8G4efHl0xWu/JUMXITUsi2gIED8V469tgobp2eMAzSNj4hR7a1nKTrBpfw
4LU8sShMnLI=
=+1sH
-----END PGP SIGNATURE-----

--Boundary-02=_zOSs/50bSVWsmdv--
