From: jsoe0708@tiscali.be
Subject: [parisc-linux] gcc 3.0 error
Date: Thu, 16 Jan 2003 15:34:36 +0100
Message-ID: <3E1AAEFA0000190A__26621.3972274729$1416622126$gmane$org@ocpmta6.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: debian-hppa@lists.debian.org
To: parisc-linux@lists.parisc-linux.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi all,

Trying to rebluid a graphical library on my hppa linux b180 still running=

gcc-3.0 as default, I got following message:

/usr/bin/ld -r -o .libs/libTKernel.la-478.o .libs/Units_UtsSequence_0.o
.libs/libTKernel.la-477.o
gcc -shared .libs/libTKernel.la-478.o  -ldl -lieee -lm  -Wl,-soname -Wl,l=
ibTKernel.so.0
-o .libs/libTKernel.so.0.0.0
/usr/bin/ld: .libs/libTKernel.la-478.o(.text.1+0x37798): cannot reach 000=
00387__ZNSolsEPFRSoS_E+0,
recompile with -ffunction-sections
/usr/bin/ld: .libs/libTKernel.la-478.o(.text.1+0x37798): cannot handle R_=
PARISC_PCREL17F
for std::ostream::operator<<(std::ostream& (*)(std::ostream&))
/usr/bin/ld: final link failed: Bad value
collect2: ld returned 1 exit status
make[3]: *** [libTKernel.la] Error 1
make[3]: Leaving directory `/CAD/OpenCascade/build/src/TKernel'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/CAD/OpenCascade/build/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/CAD/OpenCascade/build'
make: *** [all] Error 2

As it is a very long job (more then 12h) what would it be better:
1) simply following advise: "recompile with -ffunction-sections"
2) upgrade directly to gcc-3.2

Thanks for help,
    Joel


*********************************************
Vous surfez toujours avec une ligne classique ?
Faites des economies avec Tiscali Complete...
Plus d'info sur ... http://complete.tiscali.be
