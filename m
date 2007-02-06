From: Guy Martin <gmsoft@gentoo.org>
Subject: Re: [parisc-linux] glibc nptl failure baseline update.
Date: Tue, 6 Feb 2007 22:42:46 +0100
Message-ID: <20070206224246.3000a76c.gmsoft__30966.1500774839$1416624275$gmane$org@gentoo.org>
References: <119aab440702051913m1edfb6ecg535c80d2301c9c11@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: debian-glibc@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
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

On Mon, 5 Feb 2007 22:13:01 -0500
"Carlos O'Donell" <carlos@systemhalted.org> wrote:

> This is my official baseline as of 2007-02-05.
> 
> To get the baseline you need to apply something like this patch:
> http://www.parisc-linux.org/~carlos/libc-head-2007-02-05.diff
> 
> Anything non-generic is already in libc ports for hppa.
> 
> I'm interested in hearing if the gentoo or ubuntu people can reproduce
> this baseline.
> In theory this baseline is good enough for a "beta" quality userspace.
> I think we are out of "alpha" quality.
> 
> Cheers,
> Carlos.


Carlos,

This is the result of the patchset I've created :

make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/math/test-float.out] Error 1
make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/math/test-double.out] Error 1
make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/math/test-ifloat.out] Error 1
make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/math/test-idouble.out] Error 1
make[1]: *** [math/tests] Error 2
make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/libio/tst-memstream2.out] Error 1
make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/libio/tst-wmemstream2.out] Error 1
make[1]: *** [libio/tests] Error 2
make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/string/tst-strxfrm2.out] Error 1
make[1]: *** [string/tests] Error 2
make[2]: [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/posix/annexc.out] Error 1 (ignored)
make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/nptl/tst-cancelx4.out] Error 1
make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/nptl/tst-cancelx5.out] Error 1
make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/nptl/tst-cancelx20.out] Error 1
make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/nptl/tst-cancelx21.out] Error 1
make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/nptl/tst-cleanupx4.out] Error 1
make[1]: *** [nptl/tests] Error 2
make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/rt/tst-timer4.out] Error 1
make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/rt/tst-timer5.out] Error 1
make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/rt/tst-cputimer1.out] Error 1
make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/rt/tst-cputimer2.out] Error 1
make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/rt/tst-cputimer3.out] Error 1
make[1]: *** [rt/tests] Error 2
make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/elf/tst-pie1.out] Error 139
make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/elf/tst-audit2.out] Error 139
make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/elf/tst-addr1.out] Error 1
make[2]: *** [/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/elf/check-textrel.out] Error 1
make[1]: *** [elf/tests] Error 2
make: *** [check] Error 2

I used those patches :

7001_hppa_local-inlining.patch : from debian's deb
7002_hppa_submitted-lt.patch : idem
7003_hppa_ports-cvs-head-20070129.patch : cvs head of the ports repo on the 20070129
7005_hppa_cvs-head-20061203.patch : cvs head as of 20061203 of the libcd repo. This is the time of the last hppa commit to ports
7006_hppa_ports-cvs-head-20070205.patch : your patch mentionned in your previous email
7007_hppa_various-fixes.patch : cfi_endproc fix + 2 small include fix


We have always had the floating point errors even on previous glibc.

The memstream tests fail with this error "Timed out: killed the child process"

The cancel tests fail with message similar to this :
cleanup handler not called for 'pause'

tst-timer4.out :
clock_gettime returned timespec = { 1170787417, 996313000 }
clock_getres returned timespec = { 0, 4000250 }

tst-addr1.out :
found symbol (null) in /var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/elf/tst-addr1

check-textrel.out :
/var/tmp/portage/glibc-2.5/work/build-default-hppa2.0-unknown-linux-gnu-nptl/libc.so: segment 3 is executable and writable


Cheers,
  Guy


-- 
Guy Martin
Gentoo Linux - HPPA port lead

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
