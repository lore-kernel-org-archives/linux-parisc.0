From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Inequivalent aliases when stracing tst-cputimer1.
Date: Sun, 3 Jul 2011 22:39:47 -0400
Message-ID: <CADZpyixbjoptakCZrdF2_X3twOMtr=Jsh__Dx3A_98=D_XZneA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: James Bottomley <James.Bottomley@hansenpartnership.com>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

James, Dave,

While running some glibc tests on 2.6.39-rc3a+ I noticed the following:
~~~
...
[ 7649.424000] INEQUIVALENT ALIASES 0x13000 and 0x14000 in file tst-cputimer1
[ 7649.568000] INEQUIVALENT ALIASES 0x13000 and 0x14000 in file tst-cputimer1
[ 7649.720000] INEQUIVALENT ALIASES 0x13000 and 0x14000 in file tst-cputimer1
...
~~~

This is a binutils head, building glibc head, with gcc 4.4.4.

This *only* happens when I strace the application.

While the application is being strace'd it continually dumps the same
message about inequivalent aliases.

Any idea what's going on here?

How can I fix it? :-)

Cheers,
Carlos.
