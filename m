Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 825A2482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Nov 2002 00:40:18 -0700 (MST)
Date: Thu, 21 Nov 2002 08:39:43 +0100
Message-ID: <3DA3C54C000066FE@ocpmta5.be.tiscali.com>
In-Reply-To: <3DA3C54C000066E1@ocpmta5.be.tiscali.com>
From: jsoe0708@tiscali.be
Subject: RE: [parisc-linux] glibc + SuSE (When email becomes to much)
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
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

>-- Original Message --
>From: jsoe0708@tiscali.be
>Subject: RE: [parisc-linux] glibc + SuSE (When email becomes to much)
>To: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
>	parisc-linux@lists.parisc-linux.org
>Date: Thu, 21 Nov 2002 07:53:21 +0100
>
>
>Hi Carlos,
>
>>pa,
>>
>>I remember someone posting an email about trying
>>to build an unpatched version of glibc 2.3.1 :)
>
>I am not this one but to build toolchain I used the last glibc-2.3.1-5 dpkg
>sources and the build of glibc was successfully completed this night :)
>
>Congratulation,
>    Joel
>
>PS1: gcc-3.3 (let say phase 2) failled but I still have a look
>
Here is the error message:
mkdir libgcc
if [ -f stmp-dirs ]; then true; else touch stmp-dirs; fi
/Develop/parisc-linux/build/gcc/gcc/xgcc -B/Develop/parisc-linux/build/gcc/gcc/
-B/Develop/parisc-linux/parisc-SN33/hppa-linux/bin/ -B/Develop/parisc-linux/parisc-SN33/hppa-linux/lib/
-isystem /Develop/parisc-linux/parisc-SN33/hppa-linux/include -O2  -DIN_GCC
   -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -isystem
./include  -fPIC -DELF=1 -DLINUX=1 -g -DHAVE_GTHR_DEFAULT -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED
 -I. -I. -I/Develop/parisc-linux/src/gcc/gcc -I/Develop/parisc-linux/src/gcc/gcc/.
-I/Develop/parisc-linux/src/gcc/gcc/config -I/Develop/parisc-linux/src/gcc/gcc/../include
-DL_divI -xassembler-with-cpp -c /Develop/parisc-linux/src/gcc/gcc/config/pa/milli64.S
-o libgcc/./_divI.o
/Develop/parisc-linux/build/gcc/gcc/collect2: /lib/libc.so.6: version `GLIBC_2.3'
not found (required by /Develop/parisc-linux/build/gcc/gcc/collect2)
make[2]: *** [libgcc/./_divI.oS] Error 1
make[2]: Leaving directory `/Develop/parisc-linux/build/gcc/gcc'
make[1]: *** [libgcc.a] Error 2
make[1]: Leaving directory `/Develop/parisc-linux/build/gcc/gcc'
make: *** [all-gcc] Error 2

### Wed Nov 20 18:54:33 2002 ###

So it seems that it did not get the right path to the libc.so?

Thanks in advance for help,
    Joel


-----------------------------------------------------
ADSL Advantage...L'activation et le 1er mois sont GRATUITS...http://adsl.tiscali.be
