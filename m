Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 65F0548AD
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  8 Mar 2004 10:51:01 -0700 (MST)
Date: Mon, 8 Mar 2004 12:49:14 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Message-ID: <20040308174914.GC19791@baldric.uwo.ca>
References: <20040307212316.GI5139@baldric.uwo.ca>
	<4045FF3900002A8A@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <4045FF3900002A8A@ocpmta2.freegates.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] New glibc patches 2004-03-08, fixes GLRO changes.
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Mar 08, 2004 at 08:27:34AM +0100, Joel Soete wrote:
> Oops I miss somehing,

New patches here, passes testsuite without regression.

http://www.parisc-linux.org/~carlos/glibc-hppa-patches-2004-03-08.tar.gz

Joel,

Is there any chance that you could do some testing for me please?

1. Use debootstrap to build a chroot (/mnt/chroot)
2. Compile glibc with --prefix=/mnt/chroot
3. Install the new glibc there.
4. Test out running some stuff from the chroot.
	o Try running Xnest
	o Try running X applications through Xnest
	o Try building a new kernel in the chroot.

Thanks!

c.
