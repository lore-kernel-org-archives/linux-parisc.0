Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 30 Jun 2003 10:39:18 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] byte swapping redux
Message-ID: <20030630163918.GD14971@dsl2.external.hp.com>
References: <20030629213301.GA24957@dsl2.external.hp.com> <3ED70CF10000B8FE@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3ED70CF10000B8FE@ocpmta2.freegates.net>
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

On Mon, Jun 30, 2003 at 12:19:49PM +0200, Joel Soete wrote:
> Hmm here no pb to build intermezzo (as a module) neither for 2.4.21-pa1 neither
> 2.4.22-pre2-pa1 (gcc-3.3 32bits at least). So I suspect that it is a pb with
> binutils (I still have to downgrade it to binutils-2.13.90.0.18-1.7_hppa.deb)

For the record, here are the toolchain versions I'm using:
grundler@ios:~$ ld -v
GNU ld version 2.14.90.0.1 20030505 Debian GNU/Linux
grundler@ios:~$ gcc -v
Reading specs from /usr/lib/gcc-lib/hppa-linux/3.2.3/specs
Configured with: ../src/configure -v
--enable-languages=c,c++,f77,objc,ada --prefix=/usr
--mandir=/usr/share/man --infodir=/usr/share/info
--with-gxx-include-dir=/usr/include/c++/3.2 --enable-shared
--with-system-zlib --enable-nls --without-included-gettext
--enable-__cxa_atexit --enable-clocale=gnu --enable-objc-gc hppa-linux
Thread model: posix
gcc version 3.2.3
grundler@ios:~$ 


> which Dave fixed in upstream a time ago but (I don't know why) not yet
> included in debian dpkg.

Dave isn't responsible for the debian package...find the maintainer.

thanks,
grant
