From: Roland McGrath <roland@redhat.com>
Subject: [parisc-linux] Re: NPTL for hppa-linux is not backwards compatible
	with Linuxthreads.
Date: Thu, 22 Feb 2007 18:42:02 -0800 (PST)
Message-ID: <20070223024202.1175E1800E4__39701.3952526779$1416624309$gmane$org@magilla.sf.frob.com>
References: <119aab440702181522p517493e0gd4dcc8be753fd225@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: libc-ports@sourceware.org,
 Aurelien Jarno <aurel32@debian.org>,
 debian-glibc@lists.debian.org,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: Carlos O'Donell's message of  Sunday,
	18 February 2007 18:22:25 -0500
	<119aab440702181522p517493e0gd4dcc8be753fd225@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> All statically initialized locks are broken. We made locks smaller,
> and changed the value of the static initialization.

Smaller?  Smaller is easy.  And you didn't actually reduce
__SIZEOF_PTHREAD_MUTEX_T, did you?  This seems like it would not be at all
hard to accommodate just with symbol versioning and not break any
compatibility.  Off hand, it seems like it would be some simple code in one
new file in your sysdeps/ tree and a smattering of sysdeps Versions files.

But if your community is happy with a soname change and not worrying about
its various impacts, by all means just do that.  It's a lovely thing to be
able to stop compiling in all the compat stuff.

To do that, all you need is sysdeps/unix/sysv/linux/hppa/nptl/shlib-versions:

hppa.*-.*-linux.*	libc=6.1		GLIBC_2.6
hppa.*-.*-linux.*	libpthread=0.1		GLIBC_2.6

If there is any linuxthreads configuration still possible, that would leave
it producing libc.so.6/libpthread.so.0.  If that really can never be any
more, probably better to put the libc line in
sysdeps/unix/sysv/linux/hppa/shlib-versions. 


Thanks,
Roland
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
