Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA18991
	for <parisc-linux@puffin.external.hp.com>; Tue, 10 Oct 2000 04:41:25 -0600
Received: from user48-37.jakinternet.co.uk (HELO rhirst.linuxcare.com) (@212.41.48.37)
  by mailserv2.iuinc.com with SMTP; 10 Oct 2000 10:42:30 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 2BDA9B005; Tue, 10 Oct 2000 11:39:58 +0100 (BST)
Date: Tue, 10 Oct 2000 11:39:58 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] New nfsroots and xc
Message-ID: <20001010113957.E9399@linuxcare.com>
References: <20001010034345.6607638131@carmen.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001010034345.6607638131@carmen.fc.hp.com>; from taggart@carmen.fc.hp.com on Mon, Oct 09, 2000 at 09:43:45PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Oct 09, 2000 at 09:43:45PM -0600, Matt Taggart wrote:
> I have created 2 new palinux nfsroots. The first is just the Debian base 
> packages that we have(~15MB).
> 
> ftp://puffin.external.hp.com/pub/parisc/binaries/nfsroot/base-20001009.tar.gz
> 
> The second is the above plus everything else we have(~38MB).
> 
> ftp://puffin.external.hp.com/pub/parisc/binaries/nfsroot/nfsroot-20001009.tar.g
> z

Slightly broken:

10:~# make mlock 
cc     mlock.c   -o mlock
/usr/bin/ld: cannot open crt1.o: No such file or directory
collect2: ld returned 1 exit status
make: *** [mlock] Error 1


Dirty fix was to copy /usr/lib/crt[1in].o current directory.


10:~# gcc -v -Wall -L/usr/lib -o mlock mlock.c 
Reading specs from /usr/lib/gcc-lib/hppa-linux/2.96/specs
gcc version 2.96 20000925 (experimental)
 /usr/lib/gcc-lib/hppa-linux/2.96/cpp0 -lang-c -v -D__GNUC__=2 -D__GNUC_MINOR__=96 -D__GNUC_PATCHLEVEL__=0 -D__ELF__ -Dunix -D__hppa__ -Dlinux -D__ELF__ -D__unix__ -D__hppa__ -D__linux__ -D__unix -D__linux -Asystem(unix) -Asystem(posix) -Acpu(hppa) -Amachine(hppa) -Amachine(bigendian) -D__STDC _HOSTED__=1 -Wall -D__hp9000s700 -D_PA_RISC1_1 mlock.c /tmp/ccTCLP7c.i
GNU CPP version 2.96 20000925 (experimental) (cpplib)
 (hppa)
ignoring duplicate directory "/usr/include"
#include "..." search starts here:
#include <...> search starts here:
 /usr/include
 /usr/lib/gcc-lib/hppa-linux/2.96/include
 /usr/hppa-linux/include
End of search list.
 /usr/lib/gcc-lib/hppa-linux/2.96/cc1 /tmp/ccTCLP7c.i -quiet -dumpbase mlock.c -Wall -version -o /tmp/ccDv8UPn.s
GNU C version 2.96 20000925 (experimental) (hppa-linux) compiled by GNU C version 2.96 20000925 (experimental).
mlock.c:5: warning: return type defaults to `int'
 as -V -o /tmp/ccxVNaG8.o /tmp/ccDv8UPn.s
GNU assembler version 2.10.91 (hppa-linux) using BFD version 2.10.91
 /usr/lib/gcc-lib/hppa-linux/2.96/collect2 -dynamic-linker /lib/ld.so.1 -o mlock crt1.o crti.o /usr/lib/gcc-lib/hppa-linux/2.96/crtbegin.o -L/usr/lib -L/usr/lib/gcc-lib/hppa-linux/2.96 /tmp/ccxVNaG8.o -lgcc -lc -lgcc /usr/lib/gcc-lib/hppa-linux/2.96/crtend.o crtn.o
/usr/bin/ld: cannot open crt1.o: No such file or directory
collect2: ld returned 1 exit status
10:~# ls -l /usr/lib/crt1.o
-rw-r--r--    1 root     root         1228 Oct  6 12:05 /usr/lib/crt1.o

Richard
