Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6F785482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Aug 2003 10:41:36 -0600 (MDT)
Date: Mon, 11 Aug 2003 18:41:31 +0200
Message-ID: <3F29178A00002823@ocpmta7.freegates.net>
In-Reply-To: <20030811152442.GB20405@dsl2.external.hp.com>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] xfree86 4.2.1-9 build problem
To: "Grant Grundler" <grundler@parisc-linux.org>,
	"John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

> read model: posix gcc version 3.3.1 20030626 (Debian prerelease)
>
>
>I upgraded to gcc-3.3/unstable and got the same result when attempting
>to build glxinfo by hand.

well I just distupgrade my box (unstable) this morning, I so relaunched the
dpkg-buildpackage ... let you inform tomorrow (sorry I need place so I removed
buildtree)

Joel

PS: I presume that packages are the same  

palx2000:~# dpkg -l gcc\* libc6\* binutils\*
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Installed/Config-files/Unpacked/Failed-config/Half-installed
|/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err: uppercase=bad)
||/ Name                    Version                 Description
+++-=======================-=======================-==============================================================
ii  gcc                     3.3-2                   The GNU C compiler.
ii  gcc-3.0                 3.0.4-16                The GNU C compiler
ii  gcc-3.0-base            3.0.4-16                The GNU Compiler Collection
(base package)
ii  gcc-3.2                 3.2.3-7                 The GNU C compiler
ii  gcc-3.2-base            3.2.3-7                 The GNU Compiler Collection
(base package)
ii  gcc-3.3                 3.3.1-1                 The GNU C compiler
ii  gcc-3.3-base            3.3.1-1                 The GNU Compiler Collection
(base package)
ii  gcc-3.3-doc             3.3.1-1                 Documentation for the
GNU compilers (gcc, gobjc, g++)
ii  gcc-hppa64              3.2.3-0.1               Cross gcc for hppa64
ii  gcc-snapshot            20030728-1              A SNAPSHOT of the GNU
Compiler Collection.
ii  libc6                   2.3.1-17.0.3            GNU C Library: Shared
libraries and Timezone data
ii  libc6-dev               2.3.1-17.0.3            GNU C Library: Development
Libraries and Header Files.
ii  binutils                2.14.90.0.5-0.2         The GNU assembler, linker
and binary utilities
ii  binutils-dev            2.14.90.0.5-0.2         The GNU binary utilities
(BFD development files)

palx2000:~# gcc -v
Reading specs from /usr/lib/gcc-lib/hppa-linux/3.3.1/specs
Configured with: ../src/configure -v --enable-languages=c,c++,f77,pascal,objc,ada,treelang
--prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-gxx-include-dir=/usr/include/c++/3.3
--enable-shared --with-system-zlib --enable-nls --without-included-gettext
--enable-__cxa_atexit --enable-sjlj-exceptions --enable-clocale=gnu --enable-debug
--enable-objc-gc hppa-linux
Thread model: posix
gcc version 3.3.1 (Debian)


------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
