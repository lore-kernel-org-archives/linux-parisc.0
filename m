Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id B0F7D482A
	for <parisc-linux@parisc-linux.org>; Thu, 24 May 2001 15:34:14 -0600 (MDT)
Received: from security.hp.com (cranston.fc.hp.com [15.1.44.224])
	by atlrel2.hp.com (Postfix) with ESMTP id DD9531950
	for <parisc-linux@parisc-linux.org>; Thu, 24 May 2001 17:34:13 -0400 (EDT)
To: parisc-linux@parisc-linux.org
From: LaMont Jones <lamont@hp.com>
Cc: LaMont Jones <lamont@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Thu, 24 May 2001 15:32:59 -0600
Sender: lamont@hp.com
Message-Id: <20010524213301.126241872C@security.hp.com>
Subject: [parisc-linux] still getting $$dyncall refs in shlibs
List-ID: <linux-parisc.vger.kernel.org>

With the new toolchain, sipp still builds a libsipp.so.3.1 trips the
bug checker.  Checking everything on the system doesn't find any bad
libs.  Here is the build output for libsipp.so:

gcc -pipe -O3 -fPIC -I../libsipp   -c -o rendering.o rendering.c
gcc -pipe -O3 -fPIC -I../libsipp   -c -o geometric.o geometric.c
gcc -pipe -O3 -fPIC -I../libsipp   -c -o lightsource.o lightsource.c
gcc -pipe -O3 -fPIC -I../libsipp   -c -o objects.o objects.c
gcc -pipe -O3 -fPIC -I../libsipp   -c -o smalloc.o smalloc.c
gcc -pipe -O3 -fPIC -I../libsipp   -c -o transforms.o transforms.c
...
gcc -pipe -O3 -fPIC -I../libsipp   -c -o xalloca.o xalloca.c
gcc -pipe -O3 -fPIC -I../libsipp   -c -o phong.o phong.c
gcc -pipe -O3 -fPIC -I../libsipp   -c -o strauss.o strauss.c
gcc -pipe -O3 -fPIC -I../libsipp   -c -o teapot.o teapot.c
ld --shared -o libsipp.so.3.1 rendering.o geometric.o lightsource.o objects.o smalloc.o transforms.o viewpoint.o basic_shader.o marble.o granite.o mask.o bozo.o bumpy.o planet.o noise.o bezier.o bezier_lex.o pixelbuf.o torus.o cone.o ellipsoid.o prism.o sipp_pixmap.o sipp_bitmap.o wood.o xalloca.o phong.o strauss.o teapot.o  -soname libsipp.so.3 -lc
ld: bfd assertion fail ../../bfd/elf32-hppa.c:941
ld: bfd assertion fail ../../bfd/elf32-hppa.c:941

Of course, if the assertion failure actually killed the linker, that
would help...

I'm at a loss from here - and give it to those who have a clue...
lamont
