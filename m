From: "Geert Lorang" <geert@lorang.be>
Subject: Re: install medium for c8000 [was Re: PARISC Linux website and
 status update]
Date: Mon, 22 Apr 2013 17:00:07 +0200
Message-ID: <0d62eecac81e83ba969f27e280554c19.squirrel@mail.therion.be>
References: <CAFk90B8ZNjwyWKpO_LhGPPkYB_sgJduMVi_YBCoN_Z6hk-_sFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Cc: "Helge Deller" <deller@gmx.de>,
 debian-hppa@lists.debian.org,
 "linux-parisc" <linux-parisc@vger.kernel.org>
To: "Graham Gower" <graham.gower@gmail.com>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <CAFk90B8ZNjwyWKpO_LhGPPkYB_sgJduMVi_YBCoN_Z6hk-_sFQ@mail.gmail.com>
Resent-Message-ID: <YxZRhXJDi3O.A.bhG.JCVdRB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <http://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Mon, April 22, 2013 15:12, Graham Gower wrote:
> I'm wondering if there is an install iso with a kernel that has
> CONFIG_PDC_CONSOLE=3Dy, so that I can install on a c8000. (Or am I
> missing something, is there a way to get it to work without this?)
>
> Its kinda annoying if I've got to build a cross toolchain, cross
> compile a kernel, tftpboot, nfsroot, etc. in order to put something on =
the
> hard drive.

AFAIK the C8000s have unsupported serial ports / network card.

Adding a real cheap serial card worked very well for me with the 'latest'
HPPA netinstall iso.

Balint succeeded installing a C8000 by using a USB CD-ROM drive (+
additional serial card).

See threads:

http://lists.debian.org/debian-hppa/2010/05/msg00005.html
http://lists.debian.org/debian-hppa/2010/05/msg00004.html

There are a few more threads from Jan-May 2010 that may contain some
useful information about installing on a C8000.

Hope this helps.

Cheers,
Geert


--=20
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian=
.org
Archive: http://lists.debian.org/0d62eecac81e83ba969f27e280554c19.squirre=
l@mail.therion.be
