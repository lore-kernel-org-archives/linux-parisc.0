Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver3.hrz.tu-darmstadt.de (mailserver3.hrz.tu-darmstadt.de [130.83.126.47])
	by dsl2.external.hp.com (Postfix) with ESMTP id DC1C04856
	for <parisc-linux@lists.parisc-linux.org>; Sat, 30 Aug 2003 06:42:42 -0600 (MDT)
Received: from hrzpub.tu-darmstadt.de (IP-213157024129.dialin.heagmedianet.de [213.157.24.129])
	(authenticated bits=0)
	by mailserver3.hrz.tu-darmstadt.de (8.12.9/8.12.7) with ESMTP id h7UCgXGY027052
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <parisc-linux@lists.parisc-linux.org>; Sat, 30 Aug 2003 14:42:38 +0200
Message-ID: <3F509BBD.2040007@hrzpub.tu-darmstadt.de>
Date: Sat, 30 Aug 2003 14:42:37 +0200
From: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Subject: [parisc-linux] Security Hole in binfmt_som.c ?
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

Hi there,

when compiling the new 2.4.22-kernel I get an errror message:
------------>><<---------------
gcc -D__KERNEL__ -I/usr/src/linux-2.4/include -Wall -Wstrict-prototypes 
-Wno-tri
graphs -O2 -fno-strict-aliasing -fno-common -D__linux__ -pipe 
-fno-strength-redu
ce -mno-space-regs -mfast-indirect-calls -mdisable-fpregs 
-ffunction-sections -m
arch=1.1 -mschedule=7100LC   -nostdinc -I 
/usr/lib/gcc-lib/hppa-linux/3.3.1/incl
ude -DKBUILD_BASENAME=binfmt_som  -c -o binfmt_som.o binfmt_som.c
binfmt_som.c:216:2: #error "Fix security hole before enabling me"
make[2]: *** [binfmt_som.o] Fehler 1
make[2]: Leaving directory `/usr/src/linux-2.4/fs'
make[1]: *** [first_rule] Fehler 2
make[1]: Leaving directory `/usr/src/linux-2.4/fs'
make: *** [_dir_fs] Fehler 2
------------>><<---------------
What's this message about?
Kernel .config is built by make oldconfig.

Greetings, Ruediger
