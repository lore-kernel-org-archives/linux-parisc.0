Return-Path: <carlos@baldric.uwo.ca>
Received: from fep04-mail.bloor.is.net.cable.rogers.com
	(fep04-mail.bloor.is.net.cable.rogers.com [66.185.86.74])
	by dsl2.external.hp.com (Postfix) with ESMTP id BA58C4840
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  2 Feb 2004 14:06:57 -0700 (MST)
Date: Mon, 2 Feb 2004 16:07:17 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Message-ID: <20040202210716.GB11884@baldric.uwo.ca>
References: <20040201230839.GA10328@baldric.uwo.ca>
	<20040202072050.GB28571@lug-owl.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040202072050.GB28571@lug-owl.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] glibc 2.3.3 is bug free, weekly regression build,
	mailed to cvs.p-l.org?
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> 
> I certainly could (from hardware and shell scripting opint of view), but
> I might need some help with all the ./configury ...
> 
> Building a toolchain isn't allways a pleasuring task, esp. if you want a
> cross-toolchain. So if interested, I'd dedicate my b132l to that job:)

How about no toolchain build, and just a glibc build with checks for
regressions in the testsuite?

I just fixed glibc so you don't have to build a cross-toolchain, or any
toolchain for the matter. So now all you need to do is:

Initially:
(1) Pull down glibc cvs.

	echo Enter "anoncvs" as the password
	cvs -z 9 -d :pserver:anoncvs@sources.redhat.com:/cvs/glibc login
	cvs -z 9 -d :pserver:anoncvs@sources.redhat.com:/cvs/glibc co libc

(2) Pull down latest patch set.

	wget http://www.parisc-linux.org/~carlos/glibc-hppa-patches-latest.tar.gz
	(Symlinked to glibc-hppa-patches-2004-02-02.tar.gz)

(3) Apply patches, watch for rejects.

	tar zxvf $FILENAME.tar.gz
	cd $SRC/libc
	# How do you gr0k for pathname from a symlinked tar.gz that
	# unpacks to something else...
	for i in `ls $PATHNAME/*`; do patch -p1 < $i; done;
	find . -name '*.rej'

(4) Jump to "Weekely: (4)"

Weekly:
(1) Reverse out patches.

	for i in `ls $PATHNAME/*`; do patch -R -p1 < $i; done;

(2) Pull down latest patch set.

	= Same as above (2)

(3) Update glibc source tree.

	cd $GLIBCSRC
	cvs up >& ../cvs-up.log

(4) Apply new patches, watch for rejects.

	= Same as above (3)

(5) Configure, make, make -k check
	
	export CC=gcc
	export CFLAGS="-O2 -g"

	$BASE/$SRC/$LIBC/configure --host=hppa-linux
	--build=hppa-linux --target=hppa-linux --prefix=/usr
	--enable-add-ons=linuxthreads --disable-tls --disable-__thread
	--enable-all-warnings >& ../configure-hppa.log

	make >& ../build-hppa.log
	make -k check >& ../check-hppa.log

(6) Watch for regresssions.

	grep 'Error' check-hppa.log >& mailout.txt
	# Mail mailout.txt to cvs.parisc-linux.org?

(7) Wait a week, then go to (1)

	# Add to your weekly cron?

Is anyone opposed to having 'grep 'Error' check.log' posted to
cvs.parisc-linux.org on a weekly basis?

Is this enough information to lend a helping hand in writing the build
script? :)

c.
