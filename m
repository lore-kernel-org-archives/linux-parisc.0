From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] 2.6.11-rc1 pb with prebuild binaries
Date: Thu, 13 Jan 2005 18:05:25 +0100
Message-ID: <41DE4A3A00002258@mail-1-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello all,

I just encounter the same pb to build 2.6.11-rc1-pa2 64bits on my n4k as
on prebuild binaries because of:
init/built-in.o(.init.text+0x1958): In function `change_floppy':
: undefined reference to `__builtin_va_start'
arch/parisc/kernel/built-in.o(.text.real32_call+0x38): In function `real3=
2_call':
: undefined reference to `__builtin_va_start'
arch/parisc/kernel/built-in.o(.text.real64_call+0x3c): In function `real6=
4_call':
: undefined reference to `__builtin_va_start'
arch/parisc/kernel/built-in.o(.text.pdc_printf+0x34): In function `pdc_pr=
intf':
: undefined reference to `__builtin_va_start'
kernel/built-in.o(.text.panic+0x34): In function `panic':
: undefined reference to `__builtin_va_start'
kernel/built-in.o(.text.printk+0x24): more undefined references to `__bui=
ltin_va_start'
follow
make: *** [.tmp_vmlinux1] Error 1

 but not on my b2k :-)

The difference on n4k was still installed gcc-hppa64 3.0 (because during
my last atempt 2.6.10 failled to boot with gcc 3.3) otc on b2k gcc-3.3-hp=
pa64
and binutils-hppa64.

I so build first k-2.6.11-rc3-pa1 32bit for my b2k: build and boot fine :=
-)
the same k 64 up also for b2k: build and boot fine :-)
then using the opportunity to use a build dir, on this b2k I build a kern=
el
64bit up for the n4k: build and boot fine :-)
and finaly the same thing but smp: build and boot fine :-)

So the above mentioned pb seems to be fixed by a gcc binutils hppa64 upga=
rde
:-)

Hth,
    Joel

PS: kernel build loop on going to run on n4k smp (let see the results)


-------------------------------------------------------------------------=
--
Tiscali solde! 1 mois et activation Gratuits, modem =E0 9,99=80
http://reg.tiscali.be/adsl/default.asp?lg=3DFR



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
