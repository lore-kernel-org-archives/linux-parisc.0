From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] glibc nptl failure baseline update.
Date: Tue, 6 Feb 2007 05:23:29 -0700
Message-ID: <20070206122329.GA13101__6144.23097945309$1416624275$gmane$org@parisc-linux.org>
References: <119aab440702051913m1edfb6ecg535c80d2301c9c11@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: debian-glibc@lists.debian.org,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702051913m1edfb6ecg535c80d2301c9c11@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Feb 05, 2007 at 10:13:01PM -0500, Carlos O'Donell wrote:
> make[2]: *** [/libc-tls-nptl/io/tst-fstatat.out] Error 1
> make[2]: *** [/libc-tls-nptl/io/tst-futimesat.out] Error 1
> make[2]: *** [/libc-tls-nptl/io/tst-renameat.out] Error 1
> make[2]: *** [/libc-tls-nptl/io/tst-fchmodat.out] Error 1
> make[2]: *** [/libc-tls-nptl/io/tst-symlinkat.out] Error 1
> make[2]: *** [/libc-tls-nptl/io/tst-linkat.out] Error 1
> make[2]: *** [/libc-tls-nptl/io/tst-mkdirat.out] Error 1
> make[2]: *** [/libc-tls-nptl/io/tst-mkfifoat.out] Error 1

I guess we need to hook up the *at syscalls.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
