From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: gcc-4.2-hppa64 bug
Date: Wed, 05 Dec 2007 20:19:14 +0100
Message-ID: <4756F9B2.8050105@aurel32.net>
References: <20071205170219.GA3608@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org,  debian-hppa@lists.debian.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <20071205170219.GA3608@fattire.cabal.ca>
Resent-Message-ID: <uN5qBTKQQ1B.A.SEF.xmvVHB@liszt>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

Kyle McMartin a =E9crit :
> John et al,
>=20
> We're currently hitting a gcc bug on hppa64 with both gcc-4.1 and
> gcc-4.2. Symptoms are that a build of the ocfs2 module spins
> (apparently) forever, I'm leaving a copy building to see if it
> eventually makes forward progress.
>=20
> It's pretty easily reproduceable by building a modular kernel with the
> ocfs2 module enabled. Is there anything I can do to help narrow this
> down?
>=20
> make fs/ocfs2/ocfs2.ko:
> 	!SMP	SMP
> 32-bit	 y	 y
> 64-bit	 y	 fails
>=20
> The troublesome source file appears to be fs/ocfs2/alloc.o, the rest
> seem to build fine.

Please note that this bug has been reported sometimes ago in the
upstream bug tracker. See: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D=
31944

Cheers,
Aurelien

--=20
  .''`.  Aurelien Jarno	            | GPG: 1024D/F1BCDB73
 : :' :  Debian developer           | Electrical Engineer
 `. `'   aurel32@debian.org         | aurelien@aurel32.net
   `-    people.debian.org/~aurel32 | www.aurel32.net


--=20
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian=
.org
