From: Randolph Chung <tausq@debian.org>
Subject: [parisc-linux] Re: Compiling glide-2001.01.26 on hppa
Date: Sat, 24 Aug 2002 11:01:37 -0700
Message-ID: <20020824180137.GB25592__34314.7501851947$1416621645$gmane$org@tausq.org>
References: <3D67C8AC.2080309@charter.net>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: debian-hppa@lists.debian.org, parisc-linux@lists.parisc-linux.org
To: "B. Douglas Hilton" <bdhilton@charter.net>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <3D67C8AC.2080309@charter.net>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> cc -O6 -m486 -fomit-frame-pointer -funroll-loops \
> -fexpensive-optimizations -ffast-math -DBIG_OPT -I. \
> -I/usr/src/glide-2001.01.26/build-tree/glide2x/swlibs/include \
> -I/usr/src/glide-2001.01.26/build-tree/glide2x/cvg/include \
> -DENDB -DX11 -Wall -fPIC -DPIC -c -o fx64.o fx64.c
> 
> cc1: Invalid option `486'
> 
> 
> My question is, what incantation should I use on hppa to
> replace the '-O6 -m486 -f...' CFLAGS?

i would suggest just using "-O2" for now....

randolph
