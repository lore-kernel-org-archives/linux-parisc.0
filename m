From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] Re: Build failures close in at the cusp of being
	done.
Date: Wed, 12 Apr 2006 15:35:29 -0400
Message-ID: <119aab440604121235l5f9843f5jff688f26800e31b5@mail.gmail.com>
References: <119aab440604120715k57ee6eb1r403b142cd33ecb26@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: "Randolph Chung" <randolph@tausq.org>,
 "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440604120715k57ee6eb1r403b142cd33ecb26@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 4/12/06, Carlos O'Donell <carlos@systemhalted.org> wrote:
> We are getting close!
> ~~~~~~~~~~~~~~~~~~~~~
> /home/carlos/fsrc/glibc-work/builds/libc/libc_pic.os: In function `__getc=
wd':
> ../sysdeps/unix/sysv/linux/getcwd.c:90: undefined reference to `MAX'
> /home/carlos/fsrc/glibc-work/builds/libc/libc_pic.os: In function `inet_n=
toa':
> /mnt/flaire/src/glibc-work/src/libc/inet/inet_ntoa.c:35: undefined
> reference to `__tls_get_addr'
> collect2: ld returned 1 exit status
> make[1]: *** [/home/carlos/fsrc/glibc-work/builds/libc/libc.so] Error 1
> make[1]: Leaving directory `/mnt/flaire/src/glibc-work/src/libc'
> make: *** [all] Error 2
> ~~~~~~~~~~~~~~~~~~~~~

I think the missing __tls_get_addr reference is because without the
linuxthreads tls.h we don't enable the libc-tls.c reference (note it's
wrapped in #ifdef USE_TLS). The output object file is empty, and the
definition is definately nop'd out.

I'll see what I can do to fix that.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
