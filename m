From: "Helge Deller" <deller@gmx.de>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when	compiling
 ruby1.9
Date: Thu, 18 Dec 2008 14:09:40 +0100
Message-ID: <20081218130940.137190@gmx.net>
References: <4949812D.7080608@gmx.de>
 <20081218070340.GF30438@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081218070340.GF30438@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

-------- Original-Nachricht --------
> On Wed, Dec 17, 2008 at 11:46:05PM +0100, Helge Deller wrote:
> > The Debian bugzilla has a long thread about kernel crashes when
> > compiling ruby1.9 on hppa. This kernel bug led even to discussions =
if
> > hppa should be dropped for lenny.
> > See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D478717 for d=
etails.
> >=20
> > It's really easy to reproduce the bug, and it generates this backtr=
ace
> > (interestingly two backtraces):
>=20
> When does it die? My ruby1.9 is building through to the tests (where
> it's hanging without crashing...)

If it does not happen directly for you, just try a few times/cycles, e.=
g. make, make clean in the build directory.
Even killing the hanging miniruby processes can make the kernel die (wh=
en my patch wasn't applied). With the patch it stays hanging.

Helge
--=20
Psssst! Schon vom neuen GMX MultiMessenger geh=F6rt? Der kann`s mit all=
en: http://www.gmx.net/de/go/multimessenger
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
