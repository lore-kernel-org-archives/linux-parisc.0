From: Ulrich Teichert <krypton@ulrich-teichert.org>
Subject: Re: [parisc-linux] kernel module relocation bug
Date: Mon, 29 Nov 2004 23:51:05 +0100 (MET)
Message-ID: <200411292251.iATMp5i2007453@arbas.nms.ulrich-teichert.org>
References: <20041129194618.GM6359@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: Ulrich Teichert <krypton@ulrich-teichert.org>,
 James Bottomley <James.Bottomley@SteelEye.com>,
 PARISC list <parisc-linux@lists.parisc-linux.org>
To: tausq@debian.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041129194618.GM6359@tausq.org> from "Randolph Chung" at Nov 29,
	2004 11:46:18 AM
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi,

>> I've seen this quite often in userspace on hppa-linux, lately while building
>> TAO (http://www.cs.wustl.edu/~schmidt/TAO.html).
>
>what error do you see? the one that recommends rebuilding with
>-ffunction-sections?

Yes, exactly. While linking a huge C++ executable against dynamic
C++ libraries build with -fPIC.

>in your application, do you first build some .o's, link them together
>into a bigger .o, and then use those to create your final application
>image? (otherwise i don't think this problem should occur; if it does
>there's a bug somewhere that we should fix).
[TAO isn't really *my* application, it's more Douglas C. Schmidt's one,
I'm just a happy user]

Well, the linking of libraries as it's done in TAO is IMHO pretty much
standard:

g++ -D_REENTRANT -DACE_HAS_AIO_CALLS -D_GNU_SOURCE   -I/opt/ACE_wrappers -DACE_HAS_EXCEPTIONS -D__ACE_INLINE__ -DACE_BUILD_DLL -DACE_OS_BUILD_DLL -shared -Wl,-h -Wl,libACE.so.5.4.0 -o libACE.so.5.4.0 .shobj/ARGV.o
...
[countless list of objects]
...
.shobj/NT_Service.o .shobj/UUID.o -Wl,-E -L/opt/ACE_wrappers/ace -L./  -ldl -lpthread -lrt
rm -f libACE.so
ln -s libACE.so.5.4.0 libACE.so
chmod a+rx libACE.so.5.4.0

and all the other libs are created more or less the same way.

>> Wouldn't there a way to fix that somewhere else in the toolchain? Or is
>> there a parisc machine code limitation in the way? I would really get rid of
>> -ffunction-sections as it seems to generate slower executables. Could
>> you please explain what needs to be done?
>
>we have (or, rather, Dave has) been fixing this in various places. This
>problem happens much less frequently now than it used to. Fixes may be
>required either in gcc or in the linker to detect when a branch target
>is too far away and needs to be converted to a long branch.

Ah, then most likely, my toolchain is too old. I'm using debian woody right
now:

GNU ld version 2.12.90.0.1 20020307 Debian/GNU Linux
GNU assembler version 2.12.90.0.1 (hppa-linux) using BFD version 2.12.90.0.1 20020307 Debian/GNU Linux
Reading specs from /usr/lib/gcc-lib/hppa-linux/3.0.4/specs
Configured with: ../src/configure -v --enable-languages=c,c++,f77,proto,objc --prefix=/usr --infodir=/share/info --mandir=/share/man --enable-shared --with-gnu-as --with-gnu-ld --with-system-zlib --enable-long-long --enable-nls --without-included-gettext --disable-checking --enable-threads=posix --with-cpp-install-dir=bin hppa-linux
Thread model: posix
gcc version 3.0.4

What ld/gas/gcc versions would you recommend? Do I need extra patches?

TIA,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de
Stormweg 24               |listening to: Suicide Drive (The Deep Eynde)
24539 Neumuenster, Germany|Public Pervert (Interpol) Clé De Contact (Metal Urbain)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
