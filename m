From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] new debian binutils-hppa64, r=2.15-7 pb?
Date: Thu, 23 Jun 2005 11:18:26 +0200
Message-ID: <4282FEEC00010445__3718.20649966157$1416623814$gmane$org@mail-3-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: Kyle McMartin <kyle@there.is.no.cabal.ca>,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: "Matthias Klose" <doko@cs.tu-berlin.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Matthias,

[...]
>
> that should be fixed after the next gcc-defaults upload.
>
just update:
[...]
Setting up gcc-3.3-hppa64 (3.3.6-7) ...
[...]

and just noticed a small pb while re-compiling the kernel:
make is still looking for hppa64-linux-gcc

/usr/src/linux-2.6.12-pa1-050620/scripts/gcc-version.sh: line 11: hppa64-=
linux-gcc:
command not found

this coming from:
# cd /usr/bin; ls -l hppa64*
lrwxr-xr-x  1 root root     34 Dec 22  2004 hppa64-linux-gcc -> /etc/alte=
rnatives/hppa64-linux-gcc
[...]

unfortunately this alternative is not updated and still point to:
/etc/alternatives/hppa64-linux-gcc -> /usr/bin/hppa64-linux-gcc-3.3

in place of the new hppa64-linux-gnu-gcc-3.3.

Oops: still a small pb:
[...]
make -f /usr/src/linux-2.6.12-pa1-050620/scripts/Makefile.build obj=3Dfs/=
autofs4
   rm -f fs/autofs4/built-in.o; hppa64-linux-ar rcs fs/autofs4/built-in.o=

/bin/sh: hppa64-linux-ar: command not found
make[3]: *** [fs/autofs4/built-in.o] Error 127

Thanks for your attention,
    Joel






_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
