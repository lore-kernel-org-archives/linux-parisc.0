Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel11.hp.com (palrel11.hp.com [156.153.255.246])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9D53B4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Jan 2003 06:13:01 -0700 (MST)
Received: from xparelay2.ptp.hp.com (xparelay2.ptp.hp.com [15.1.28.65])
	by palrel11.hp.com (Postfix) with ESMTP id 9C94A60024B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Jan 2003 05:12:55 -0800 (PST)
Received: from xpabh2.ptp.hp.com (xpabh2.ptp.hp.com [15.1.28.61])
	by xparelay2.ptp.hp.com (Postfix) with ESMTP id 953661C00AD4
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Jan 2003 05:12:55 -0800 (PST)
Message-ID: <9A0482A7BD2506488AD9417C93F3714F0107AE4C@xsp01.brazil.hp.com>
From: "FARINATI,LEANDRO (HP-Brazil,ex1)" <leandro.farinati@hp.com>
To: "Parisc-Linux List (E-mail)" <parisc-linux@lists.parisc-linux.org>
Date: Fri, 10 Jan 2003 05:12:53 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] kernel compilation
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

Hi people,
	
	I'm trying compile the kernel linux-2.4.20-pa13 in a 64 bit machine
(pa risc 5430) with compiler gcc version 3.0.4 and occurs the following
problem:

hppa64-linux-gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-pa13/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -D__linux__ -pipe -fno-strength-reduce
 -mno-space-regs -mfast-indirect-calls -mdisable-fpregs -ffunction-sections
-march=2.0 -mschedule=8000   -nostdinc -I
/usr/lib/gcc-lib/hppa-linux/3.0.4/include -DKBUILD_BASENAME=sys_parisc32  -c
-o sys_pa
risc32.o sys_parisc32.c
sys_parisc32.c:351: parse error before "__kernel_time_t32"
sys_parisc32.c:351: warning: no semicolon at end of struct or union
sys_parisc32.c:352: warning: type defaults to `int' in declaration of
`modtime'
sys_parisc32.c:352: warning: data definition has no type or storage class
sys_parisc32.c: In function `sys32_utime':
sys_parisc32.c:357: storage size of `times32' isn't known
sys_parisc32.c:357: warning: unused variable `times32'
sys_parisc32.c: At top level:
sys_parisc32.c:386: parse error before "__kernel_clock_t32"
sys_parisc32.c:386: warning: no semicolon at end of struct or union
sys_parisc32.c:387: warning: type defaults to `int' in declaration of
`tms_stime'
sys_parisc32.c:387: warning: data definition has no type or storage class
sys_parisc32.c:388: parse error before "tms_cutime"
sys_parisc32.c:388: warning: type defaults to `int' in declaration of
`tms_cutime'
sys_parisc32.c:388: warning: data definition has no type or storage class
sys_parisc32.c:389: parse error before "tms_cstime"
sys_parisc32.c:389: warning: type defaults to `int' in declaration of
`tms_cstime'
sys_parisc32.c:389: warning: data definition has no type or storage class
sys_parisc32.c: In function `sys32_times':
sys_parisc32.c:401: dereferencing pointer to incomplete type
sys_parisc32.c:401: dereferencing pointer to incomplete type
sys_parisc32.c:401: dereferencing pointer to incomplete type
sys_parisc32.c:401: dereferencing pointer to incomplete type
sys_parisc32.c:401: dereferencing pointer to incomplete type
sys_parisc32.c:401: dereferencing pointer to incomplete type
sys_parisc32.c:401: dereferencing pointer to incomplete type
sys_parisc32.c:401: dereferencing pointer to incomplete type
sys_parisc32.c:401: dereferencing pointer to incomplete type
sys_parisc32.c:401: dereferencing pointer to incomplete type
sys_parisc32.c:402: dereferencing pointer to incomplete type
sys_parisc32.c:402: dereferencing pointer to incomplete type
sys_parisc32.c:402: dereferencing pointer to incomplete type
sys_parisc32.c:402: dereferencing pointer to incomplete type
sys_parisc32.c:402: dereferencing pointer to incomplete type
sys_parisc32.c:402: dereferencing pointer to incomplete type
sys_parisc32.c:402: dereferencing pointer to incomplete type
sys_parisc32.c:402: dereferencing pointer to incomplete type
sys_parisc32.c:402: dereferencing pointer to incomplete type
sys_parisc32.c:402: dereferencing pointer to incomplete type
sys_parisc32.c:403: dereferencing pointer to incomplete type
sys_parisc32.c:403: dereferencing pointer to incomplete type
sys_parisc32.c:403: dereferencing pointer to incomplete type
sys_parisc32.c:403: dereferencing pointer to incomplete type
sys_parisc32.c:403: dereferencing pointer to incomplete type
sys_parisc32.c:403: dereferencing pointer to incomplete type
sys_parisc32.c:403: dereferencing pointer to incomplete type
sys_parisc32.c:403: dereferencing pointer to incomplete type
sys_parisc32.c:403: dereferencing pointer to incomplete type
sys_parisc32.c:403: dereferencing pointer to incomplete type
sys_parisc32.c:404: dereferencing pointer to incomplete type
sys_parisc32.c:404: dereferencing pointer to incomplete type
sys_parisc32.c:404: dereferencing pointer to incomplete type
sys_parisc32.c:404: dereferencing pointer to incomplete type
sys_parisc32.c:404: dereferencing pointer to incomplete type
sys_parisc32.c:404: dereferencing pointer to incomplete type
sys_parisc32.c:404: dereferencing pointer to incomplete type
sys_parisc32.c:404: dereferencing pointer to incomplete type
sys_parisc32.c:404: dereferencing pointer to incomplete type
sys_parisc32.c:404: dereferencing pointer to incomplete type
sys_parisc32.c: At top level:
sys_parisc32.c:414: parse error before "__kernel_off_t32"
sys_parisc32.c:414: warning: no semicolon at end of struct or union
sys_parisc32.c:415: warning: type defaults to `int' in declaration of
`l_len'
sys_parisc32.c:415: warning: data definition has no type or storage class
sys_parisc32.c:416: parse error before "l_pid"
sys_parisc32.c:416: warning: type defaults to `int' in declaration of
`l_pid'
sys_parisc32.c:416: warning: data definition has no type or storage class
sys_parisc32.c: In function `get_flock':
sys_parisc32.c:424: dereferencing pointer to incomplete type
sys_parisc32.c:424: dereferencing pointer to incomplete type
sys_parisc32.c:424: dereferencing pointer to incomplete type
sys_parisc32.c:424: dereferencing pointer to incomplete type
sys_parisc32.c:424: dereferencing pointer to incomplete type
sys_parisc32.c:424: dereferencing pointer to incomplete type
sys_parisc32.c:424: dereferencing pointer to incomplete type
sys_parisc32.c:424: dereferencing pointer to incomplete type
sys_parisc32.c:424: dereferencing pointer to incomplete type
sys_parisc32.c:424: warning: type defaults to `int' in declaration of `type
name'
sys_parisc32.c:425: dereferencing pointer to incomplete type
sys_parisc32.c:425: dereferencing pointer to incomplete type
sys_parisc32.c:425: dereferencing pointer to incomplete type
sys_parisc32.c:425: dereferencing pointer to incomplete type
sys_parisc32.c:425: dereferencing pointer to incomplete type
sys_parisc32.c:425: dereferencing pointer to incomplete type
sys_parisc32.c:425: dereferencing pointer to incomplete type
sys_parisc32.c:425: dereferencing pointer to incomplete type
sys_parisc32.c:425: dereferencing pointer to incomplete type
sys_parisc32.c:425: warning: type defaults to `int' in declaration of `type
name'
sys_parisc32.c:426: dereferencing pointer to incomplete type
sys_parisc32.c:426: dereferencing pointer to incomplete type
sys_parisc32.c:426: dereferencing pointer to incomplete type
sys_parisc32.c:426: dereferencing pointer to incomplete type
sys_parisc32.c:426: dereferencing pointer to incomplete type
sys_parisc32.c:426: dereferencing pointer to incomplete type
sys_parisc32.c:426: dereferencing pointer to incomplete type
sys_parisc32.c:426: dereferencing pointer to incomplete type
sys_parisc32.c:426: dereferencing pointer to incomplete type
sys_parisc32.c:426: warning: type defaults to `int' in declaration of `type
name'
sys_parisc32.c:427: dereferencing pointer to incomplete type
sys_parisc32.c:427: dereferencing pointer to incomplete type
sys_parisc32.c:427: dereferencing pointer to incomplete type
sys_parisc32.c:427: dereferencing pointer to incomplete type
sys_parisc32.c:427: dereferencing pointer to incomplete type
sys_parisc32.c:427: dereferencing pointer to incomplete type
sys_parisc32.c:427: dereferencing pointer to incomplete type
sys_parisc32.c:427: dereferencing pointer to incomplete type
sys_parisc32.c:427: dereferencing pointer to incomplete type
sys_parisc32.c:427: warning: type defaults to `int' in declaration of `type
name'
sys_parisc32.c:428: dereferencing pointer to incomplete type
sys_parisc32.c:428: dereferencing pointer to incomplete type
sys_parisc32.c:428: dereferencing pointer to incomplete type
sys_parisc32.c:428: dereferencing pointer to incomplete type
sys_parisc32.c:428: dereferencing pointer to incomplete type
sys_parisc32.c:428: dereferencing pointer to incomplete type
sys_parisc32.c:428: dereferencing pointer to incomplete type
sys_parisc32.c:428: dereferencing pointer to incomplete type
sys_parisc32.c:428: dereferencing pointer to incomplete type
sys_parisc32.c:428: warning: type defaults to `int' in declaration of `type
name'
sys_parisc32.c: In function `put_flock':
sys_parisc32.c:436: dereferencing pointer to incomplete type
sys_parisc32.c:436: dereferencing pointer to incomplete type
sys_parisc32.c:436: dereferencing pointer to incomplete type
sys_parisc32.c:436: dereferencing pointer to incomplete type
sys_parisc32.c:436: dereferencing pointer to incomplete type
sys_parisc32.c:436: dereferencing pointer to incomplete type
sys_parisc32.c:436: dereferencing pointer to incomplete type
sys_parisc32.c:436: dereferencing pointer to incomplete type
sys_parisc32.c:436: dereferencing pointer to incomplete type
sys_parisc32.c:436: dereferencing pointer to incomplete type
sys_parisc32.c:437: dereferencing pointer to incomplete type
sys_parisc32.c:437: dereferencing pointer to incomplete type
sys_parisc32.c:437: dereferencing pointer to incomplete type
sys_parisc32.c:437: dereferencing pointer to incomplete type
sys_parisc32.c:437: dereferencing pointer to incomplete type
sys_parisc32.c:437: dereferencing pointer to incomplete type
sys_parisc32.c:437: dereferencing pointer to incomplete type
sys_parisc32.c:437: dereferencing pointer to incomplete type
sys_parisc32.c:437: dereferencing pointer to incomplete type
sys_parisc32.c:437: dereferencing pointer to incomplete type
sys_parisc32.c:438: dereferencing pointer to incomplete type
sys_parisc32.c:438: dereferencing pointer to incomplete type
sys_parisc32.c:438: dereferencing pointer to incomplete type
sys_parisc32.c:438: dereferencing pointer to incomplete type
sys_parisc32.c:438: dereferencing pointer to incomplete type
sys_parisc32.c:438: dereferencing pointer to incomplete type
sys_parisc32.c:438: dereferencing pointer to incomplete type
sys_parisc32.c:438: dereferencing pointer to incomplete type
sys_parisc32.c:438: dereferencing pointer to incomplete type
sys_parisc32.c:438: dereferencing pointer to incomplete type
sys_parisc32.c:439: dereferencing pointer to incomplete type
sys_parisc32.c:439: dereferencing pointer to incomplete type
sys_parisc32.c:439: dereferencing pointer to incomplete type
sys_parisc32.c:439: dereferencing pointer to incomplete type
sys_parisc32.c:439: dereferencing pointer to incomplete type
sys_parisc32.c:439: dereferencing pointer to incomplete type
sys_parisc32.c:439: dereferencing pointer to incomplete type
sys_parisc32.c:439: dereferencing pointer to incomplete type
sys_parisc32.c:439: dereferencing pointer to incomplete type
sys_parisc32.c:439: dereferencing pointer to incomplete type
sys_parisc32.c:440: dereferencing pointer to incomplete type
sys_parisc32.c:440: dereferencing pointer to incomplete type
sys_parisc32.c:440: dereferencing pointer to incomplete type
sys_parisc32.c:440: dereferencing pointer to incomplete type
sys_parisc32.c:440: dereferencing pointer to incomplete type
sys_parisc32.c:440: dereferencing pointer to incomplete type
sys_parisc32.c:440: dereferencing pointer to incomplete type
sys_parisc32.c:440: dereferencing pointer to incomplete type
sys_parisc32.c:440: dereferencing pointer to incomplete type
sys_parisc32.c:440: dereferencing pointer to incomplete type
sys_parisc32.c: In function `sys32_sysctl':
sys_parisc32.c:511: warning: cast to pointer from integer of different size
sys_parisc32.c:511: warning: cast to pointer from integer of different size
sys_parisc32.c:511: warning: cast to pointer from integer of different size
sys_parisc32.c:511: warning: cast to pointer from integer of different size
sys_parisc32.c:511: warning: cast to pointer from integer of different size
sys_parisc32.c:511: warning: cast to pointer from integer of different size
sys_parisc32.c:511: warning: cast to pointer from integer of different size
sys_parisc32.c:511: warning: cast to pointer from integer of different size
sys_parisc32.c:511: warning: cast to pointer from integer of different size
sys_parisc32.c:520: warning: cast to pointer from integer of different size
sys_parisc32.c:520: warning: cast to pointer from integer of different size
sys_parisc32.c:521: warning: cast to pointer from integer of different size
sys_parisc32.c:529: warning: cast to pointer from integer of different size
sys_parisc32.c:529: warning: cast to pointer from integer of different size
sys_parisc32.c:529: warning: cast to pointer from integer of different size
sys_parisc32.c:529: warning: cast to pointer from integer of different size
sys_parisc32.c:529: warning: cast to pointer from integer of different size
sys_parisc32.c:529: warning: cast to pointer from integer of different size
sys_parisc32.c:529: warning: cast to pointer from integer of different size
sys_parisc32.c:529: warning: cast to pointer from integer of different size
sys_parisc32.c:529: warning: cast to pointer from integer of different size
sys_parisc32.c:529: warning: cast to pointer from integer of different size
sys_parisc32.c: At top level:
sys_parisc32.c:596: parse error before "time_t32"
sys_parisc32.c:596: warning: type defaults to `int' in declaration of
`time_t32'
sys_parisc32.c:596: warning: data definition has no type or storage class
sys_parisc32.c:621: parse error before '*' token
sys_parisc32.c:622: warning: function declaration isn't a prototype
sys_parisc32.c: In function `sys32_time':
sys_parisc32.c:624: parse error before "now32"
sys_parisc32.c:626: `tloc' undeclared (first use in this function)
sys_parisc32.c:626: (Each undeclared identifier is reported only once
sys_parisc32.c:626: for each function it appears in.)
sys_parisc32.c:627: `now32' undeclared (first use in this function)
sys_parisc32.c:623: warning: unused variable `now'
sys_parisc32.c:631: warning: control reaches end of non-void function
sys_parisc32.c: At top level:
sys_parisc32.c:786: parse error before "pid"
sys_parisc32.c:788: warning: function declaration isn't a prototype
sys_parisc32.c: In function `sys32_wait4':
sys_parisc32.c:789: `ru' undeclared (first use in this function)
sys_parisc32.c:790: `pid' undeclared (first use in this function)
sys_parisc32.c:790: `stat_addr' undeclared (first use in this function)
sys_parisc32.c:790: `options' undeclared (first use in this function)
sys_parisc32.c: At top level:
sys_parisc32.c:805: parse error before "__kernel_dev_t32"
sys_parisc32.c:805: warning: no semicolon at end of struct or union
sys_parisc32.c:806: warning: type defaults to `int' in declaration of
`st_ino'
sys_parisc32.c:806: warning: data definition has no type or storage class
sys_parisc32.c:807: parse error before "st_mode"
sys_parisc32.c:807: warning: type defaults to `int' in declaration of
`st_mode'
sys_parisc32.c:807: warning: data definition has no type or storage class
sys_parisc32.c:808: parse error before "st_nlink"
sys_parisc32.c:808: warning: type defaults to `int' in declaration of
`st_nlink'
sys_parisc32.c:808: warning: data definition has no type or storage class
sys_parisc32.c:811: parse error before "st_rdev"
sys_parisc32.c:811: warning: type defaults to `int' in declaration of
`st_rdev'
sys_parisc32.c:811: warning: data definition has no type or storage class
sys_parisc32.c:812: parse error before "st_size"
sys_parisc32.c:812: warning: type defaults to `int' in declaration of
`st_size'
sys_parisc32.c:812: warning: data definition has no type or storage class
sys_parisc32.c:813: parse error before "st_atime"
sys_parisc32.c:813: warning: type defaults to `int' in declaration of
`st_atime'
sys_parisc32.c:813: warning: data definition has no type or storage class
sys_parisc32.c:815: parse error before "st_mtime"
sys_parisc32.c:815: warning: type defaults to `int' in declaration of
`st_mtime'
sys_parisc32.c:815: warning: data definition has no type or storage class
sys_parisc32.c:817: parse error before "st_ctime"
sys_parisc32.c:817: warning: type defaults to `int' in declaration of
`st_ctime'
sys_parisc32.c:817: warning: data definition has no type or storage class
sys_parisc32.c:822: parse error before "__unused2"
sys_parisc32.c:822: warning: type defaults to `int' in declaration of
`__unused2'
sys_parisc32.c:822: warning: data definition has no type or storage class
sys_parisc32.c:823: parse error before "__unused3"
sys_parisc32.c:823: warning: type defaults to `int' in declaration of
`__unused3'
sys_parisc32.c:823: warning: data definition has no type or storage class
sys_parisc32.c:827: parse error before "st_realdev"
sys_parisc32.c:827: warning: type defaults to `int' in declaration of
`st_realdev'
sys_parisc32.c:827: warning: data definition has no type or storage class
sys_parisc32.c:830: parse error before "st_uid"
sys_parisc32.c:830: warning: type defaults to `int' in declaration of
`st_uid'
sys_parisc32.c:830: warning: data definition has no type or storage class
sys_parisc32.c:831: parse error before "st_gid"
sys_parisc32.c:831: warning: type defaults to `int' in declaration of
`st_gid'
sys_parisc32.c:831: warning: data definition has no type or storage class
sys_parisc32.c:833: parse error before '}' token
sys_parisc32.c: In function `cp_new_stat32':
sys_parisc32.c:850: storage size of `tmp' isn't known
sys_parisc32.c:850: warning: unused variable `tmp'
sys_parisc32.c:851: warning: `blocks' might be used uninitialized in this
function
sys_parisc32.c: At top level:
sys_parisc32.c:957: parse error before "__kernel_off_t32"
sys_parisc32.c:957: warning: no semicolon at end of struct or union
sys_parisc32.c:960: parse error before '}' token
sys_parisc32.c: In function `filldir32':
sys_parisc32.c:989: dereferencing pointer to incomplete type
sys_parisc32.c:989: dereferencing pointer to incomplete type
sys_parisc32.c:989: warning: type defaults to `int' in declaration of `type
name'
sys_parisc32.c:996: dereferencing pointer to incomplete type
sys_parisc32.c:996: dereferencing pointer to incomplete type
sys_parisc32.c:996: dereferencing pointer to incomplete type
sys_parisc32.c:996: dereferencing pointer to incomplete type
sys_parisc32.c:996: dereferencing pointer to incomplete type
sys_parisc32.c:996: dereferencing pointer to incomplete type
sys_parisc32.c:996: dereferencing pointer to incomplete type
sys_parisc32.c:996: dereferencing pointer to incomplete type
sys_parisc32.c:996: dereferencing pointer to incomplete type
sys_parisc32.c:996: dereferencing pointer to incomplete type
sys_parisc32.c:999: dereferencing pointer to incomplete type
sys_parisc32.c:999: dereferencing pointer to incomplete type
sys_parisc32.c:999: dereferencing pointer to incomplete type
sys_parisc32.c:999: dereferencing pointer to incomplete type
sys_parisc32.c:999: dereferencing pointer to incomplete type
sys_parisc32.c:999: dereferencing pointer to incomplete type
sys_parisc32.c:999: dereferencing pointer to incomplete type
sys_parisc32.c:999: dereferencing pointer to incomplete type
sys_parisc32.c:999: dereferencing pointer to incomplete type
sys_parisc32.c:999: dereferencing pointer to incomplete type
sys_parisc32.c:1000: dereferencing pointer to incomplete type
sys_parisc32.c:1000: dereferencing pointer to incomplete type
sys_parisc32.c:1000: dereferencing pointer to incomplete type
sys_parisc32.c:1000: dereferencing pointer to incomplete type
sys_parisc32.c:1000: dereferencing pointer to incomplete type
sys_parisc32.c:1000: dereferencing pointer to incomplete type
sys_parisc32.c:1000: dereferencing pointer to incomplete type
sys_parisc32.c:1000: dereferencing pointer to incomplete type
sys_parisc32.c:1000: dereferencing pointer to incomplete type
sys_parisc32.c:1000: dereferencing pointer to incomplete type
sys_parisc32.c:1001: dereferencing pointer to incomplete type
sys_parisc32.c:1002: dereferencing pointer to incomplete type
sys_parisc32.c:1002: dereferencing pointer to incomplete type
sys_parisc32.c:1002: dereferencing pointer to incomplete type
sys_parisc32.c:1002: dereferencing pointer to incomplete type
sys_parisc32.c:1002: dereferencing pointer to incomplete type
sys_parisc32.c:1002: dereferencing pointer to incomplete type
sys_parisc32.c:1002: dereferencing pointer to incomplete type
sys_parisc32.c:1002: dereferencing pointer to incomplete type
sys_parisc32.c:1002: dereferencing pointer to incomplete type
sys_parisc32.c:1002: dereferencing pointer to incomplete type
sys_parisc32.c: In function `sys32_getdents':
sys_parisc32.c:1033: dereferencing pointer to incomplete type
sys_parisc32.c:1033: dereferencing pointer to incomplete type
sys_parisc32.c:1033: dereferencing pointer to incomplete type
sys_parisc32.c:1033: dereferencing pointer to incomplete type
sys_parisc32.c:1033: dereferencing pointer to incomplete type
sys_parisc32.c:1033: dereferencing pointer to incomplete type
sys_parisc32.c:1033: dereferencing pointer to incomplete type
sys_parisc32.c:1033: dereferencing pointer to incomplete type
sys_parisc32.c:1033: dereferencing pointer to incomplete type
sys_parisc32.c:1033: dereferencing pointer to incomplete type
sys_parisc32.c: At top level:
sys_parisc32.c:1312: parse error before "__kernel_size_t32"
sys_parisc32.c:1313: warning: function declaration isn't a prototype
sys_parisc32.c: In function `qm_modules':
sys_parisc32.c:1321: `bufsize' undeclared (first use in this function)
sys_parisc32.c:1323: `buf' undeclared (first use in this function)
sys_parisc32.c:1330: `ret' undeclared (first use in this function)
sys_parisc32.c: At top level:
sys_parisc32.c:1347: parse error before "__kernel_size_t32"
sys_parisc32.c:1348: warning: function declaration isn't a prototype
sys_parisc32.c: In function `qm_deps':
sys_parisc32.c:1351: `mod' undeclared (first use in this function)
sys_parisc32.c:1354: `ret' undeclared (first use in this function)
sys_parisc32.c:1361: `bufsize' undeclared (first use in this function)
sys_parisc32.c:1363: `buf' undeclared (first use in this function)
sys_parisc32.c: At top level:
sys_parisc32.c:1384: parse error before "__kernel_size_t32"
sys_parisc32.c:1385: warning: function declaration isn't a prototype
sys_parisc32.c: In function `qm_refs':
sys_parisc32.c:1389: `mod' undeclared (first use in this function)
sys_parisc32.c:1392: `ret' undeclared (first use in this function)
sys_parisc32.c:1402: `bufsize' undeclared (first use in this function)
sys_parisc32.c:1404: `buf' undeclared (first use in this function)
sys_parisc32.c: At top level:
sys_parisc32.c:1428: parse error before "__kernel_size_t32"
sys_parisc32.c:1429: warning: function declaration isn't a prototype
sys_parisc32.c: In function `qm_symbols':
sys_parisc32.c:1435: `mod' undeclared (first use in this function)
sys_parisc32.c:1436: `ret' undeclared (first use in this function)
sys_parisc32.c:1446: `bufsize' undeclared (first use in this function)
sys_parisc32.c:1453: `buf' undeclared (first use in this function)
sys_parisc32.c: At top level:
sys_parisc32.c:1487: parse error before "__kernel_size_t32"
sys_parisc32.c:1488: warning: function declaration isn't a prototype
sys_parisc32.c: In function `qm_info':
sys_parisc32.c:1491: `mod' undeclared (first use in this function)
sys_parisc32.c:1494: `bufsize' undeclared (first use in this function)
sys_parisc32.c:1504: `buf' undeclared (first use in this function)
sys_parisc32.c:1509: `ret' undeclared (first use in this function)
sys_parisc32.c: At top level:
sys_parisc32.c:1515: parse error before "__kernel_size_t32"
sys_parisc32.c:1516: warning: function declaration isn't a prototype
sys_parisc32.c: In function `sys32_query_module':
sys_parisc32.c:1521: `name_user' undeclared (first use in this function)
sys_parisc32.c:1545: `which' undeclared (first use in this function)
sys_parisc32.c:1551: `buf' undeclared (first use in this function)
sys_parisc32.c:1551: `bufsize' undeclared (first use in this function)
sys_parisc32.c:1551: `ret' undeclared (first use in this function)
sys_parisc32.c: At top level:
sys_parisc32.c:1791: parse error before "__kernel_size_t32"
sys_parisc32.c:1791: warning: no semicolon at end of struct or union
sys_parisc32.c:1793: parse error before "msg_controllen"
sys_parisc32.c:1793: warning: type defaults to `int' in declaration of
`msg_controllen'
sys_parisc32.c:1793: warning: data definition has no type or storage class
sys_parisc32.c:1795: parse error before '}' token
sys_parisc32.c:1798: parse error before "__kernel_size_t32"
sys_parisc32.c:1798: warning: no semicolon at end of struct or union
sys_parisc32.c:1801: parse error before '}' token
sys_parisc32.c: In function `__cmsg32_nxthdr':
sys_parisc32.c:1825: arithmetic on pointer to an incomplete type
sys_parisc32.c: In function `msghdr_from_user32_to_kern':
sys_parisc32.c:1869: dereferencing pointer to incomplete type
sys_parisc32.c:1869: dereferencing pointer to incomplete type
sys_parisc32.c:1869: dereferencing pointer to incomplete type
sys_parisc32.c:1869: dereferencing pointer to incomplete type
sys_parisc32.c:1869: dereferencing pointer to incomplete type
sys_parisc32.c:1869: dereferencing pointer to incomplete type
sys_parisc32.c:1869: dereferencing pointer to incomplete type
sys_parisc32.c:1869: dereferencing pointer to incomplete type
sys_parisc32.c:1869: dereferencing pointer to incomplete type
sys_parisc32.c:1869: warning: type defaults to `int' in declaration of `type
name'
sys_parisc32.c:1870: dereferencing pointer to incomplete type
sys_parisc32.c:1870: dereferencing pointer to incomplete type
sys_parisc32.c:1870: dereferencing pointer to incomplete type
sys_parisc32.c:1870: dereferencing pointer to incomplete type
sys_parisc32.c:1870: dereferencing pointer to incomplete type
sys_parisc32.c:1870: dereferencing pointer to incomplete type
sys_parisc32.c:1870: dereferencing pointer to incomplete type
sys_parisc32.c:1870: dereferencing pointer to incomplete type
sys_parisc32.c:1870: dereferencing pointer to incomplete type
sys_parisc32.c:1870: warning: type defaults to `int' in declaration of `type
name'
sys_parisc32.c:1871: dereferencing pointer to incomplete type
sys_parisc32.c:1871: dereferencing pointer to incomplete type
sys_parisc32.c:1871: dereferencing pointer to incomplete type
sys_parisc32.c:1871: dereferencing pointer to incomplete type
sys_parisc32.c:1871: dereferencing pointer to incomplete type
sys_parisc32.c:1871: dereferencing pointer to incomplete type
sys_parisc32.c:1871: dereferencing pointer to incomplete type
sys_parisc32.c:1871: dereferencing pointer to incomplete type
sys_parisc32.c:1871: dereferencing pointer to incomplete type
sys_parisc32.c:1871: warning: type defaults to `int' in declaration of `type
name'
sys_parisc32.c:1879: dereferencing pointer to incomplete type
sys_parisc32.c:1879: dereferencing pointer to incomplete type
sys_parisc32.c:1879: dereferencing pointer to incomplete type
sys_parisc32.c:1879: dereferencing pointer to incomplete type
sys_parisc32.c:1879: dereferencing pointer to incomplete type
sys_parisc32.c:1879: dereferencing pointer to incomplete type
sys_parisc32.c:1879: dereferencing pointer to incomplete type
sys_parisc32.c:1879: dereferencing pointer to incomplete type
sys_parisc32.c:1879: dereferencing pointer to incomplete type
sys_parisc32.c:1879: warning: type defaults to `int' in declaration of `type
name'
sys_parisc32.c:1880: dereferencing pointer to incomplete type
sys_parisc32.c:1880: dereferencing pointer to incomplete type
sys_parisc32.c:1880: dereferencing pointer to incomplete type
sys_parisc32.c:1880: dereferencing pointer to incomplete type
sys_parisc32.c:1880: dereferencing pointer to incomplete type
sys_parisc32.c:1880: dereferencing pointer to incomplete type
sys_parisc32.c:1880: dereferencing pointer to incomplete type
sys_parisc32.c:1880: dereferencing pointer to incomplete type
sys_parisc32.c:1880: dereferencing pointer to incomplete type
sys_parisc32.c:1880: warning: type defaults to `int' in declaration of `type
name'
sys_parisc32.c:1881: dereferencing pointer to incomplete type
sys_parisc32.c:1881: dereferencing pointer to incomplete type
sys_parisc32.c:1881: dereferencing pointer to incomplete type
sys_parisc32.c:1881: dereferencing pointer to incomplete type
sys_parisc32.c:1881: dereferencing pointer to incomplete type
sys_parisc32.c:1881: dereferencing pointer to incomplete type
sys_parisc32.c:1881: dereferencing pointer to incomplete type
sys_parisc32.c:1881: dereferencing pointer to incomplete type
sys_parisc32.c:1881: dereferencing pointer to incomplete type
sys_parisc32.c:1881: warning: type defaults to `int' in declaration of `type
name'
sys_parisc32.c:1882: dereferencing pointer to incomplete type
sys_parisc32.c:1882: dereferencing pointer to incomplete type
sys_parisc32.c:1882: dereferencing pointer to incomplete type
sys_parisc32.c:1882: dereferencing pointer to incomplete type
sys_parisc32.c:1882: dereferencing pointer to incomplete type
sys_parisc32.c:1882: dereferencing pointer to incomplete type
sys_parisc32.c:1882: dereferencing pointer to incomplete type
sys_parisc32.c:1882: dereferencing pointer to incomplete type
sys_parisc32.c:1882: dereferencing pointer to incomplete type
sys_parisc32.c:1882: warning: type defaults to `int' in declaration of `type
name'
sys_parisc32.c: In function `cmsghdr_from_user32_to_kern':
sys_parisc32.c:1932: `__kernel_size_t32' undeclared (first use in this
function)
sys_parisc32.c:1932: parse error before "ucmlen"
sys_parisc32.c:1937: sizeof applied to an incomplete type
sys_parisc32.c:1939: dereferencing pointer to incomplete type
sys_parisc32.c:1939: dereferencing pointer to incomplete type
sys_parisc32.c:1939: dereferencing pointer to incomplete type
sys_parisc32.c:1939: dereferencing pointer to incomplete type
sys_parisc32.c:1939: dereferencing pointer to incomplete type
sys_parisc32.c:1939: dereferencing pointer to incomplete type
sys_parisc32.c:1939: dereferencing pointer to incomplete type
sys_parisc32.c:1939: dereferencing pointer to incomplete type
sys_parisc32.c:1939: `ucmlen' undeclared (first use in this function)
sys_parisc32.c:1939: dereferencing pointer to incomplete type
sys_parisc32.c:1939: warning: type defaults to `int' in declaration of `type
name'
sys_parisc32.c:1944: sizeof applied to an incomplete type
sys_parisc32.c:1950: dereferencing pointer to incomplete type
sys_parisc32.c:1970: sizeof applied to an incomplete type
sys_parisc32.c:1972: dereferencing pointer to incomplete type
sys_parisc32.c:1972: dereferencing pointer to incomplete type
sys_parisc32.c:1972: dereferencing pointer to incomplete type
sys_parisc32.c:1972: dereferencing pointer to incomplete type
sys_parisc32.c:1972: dereferencing pointer to incomplete type
sys_parisc32.c:1972: dereferencing pointer to incomplete type
sys_parisc32.c:1972: dereferencing pointer to incomplete type
sys_parisc32.c:1972: dereferencing pointer to incomplete type
sys_parisc32.c:1972: dereferencing pointer to incomplete type
sys_parisc32.c:1972: warning: type defaults to `int' in declaration of `type
name'
sys_parisc32.c:1973: dereferencing pointer to incomplete type
sys_parisc32.c:1976: dereferencing pointer to incomplete type
sys_parisc32.c:1976: dereferencing pointer to incomplete type
sys_parisc32.c:1976: dereferencing pointer to incomplete type
sys_parisc32.c:1976: dereferencing pointer to incomplete type
sys_parisc32.c:1976: dereferencing pointer to incomplete type
sys_parisc32.c:1976: dereferencing pointer to incomplete type
sys_parisc32.c:1976: dereferencing pointer to incomplete type
sys_parisc32.c:1976: dereferencing pointer to incomplete type
sys_parisc32.c:1976: dereferencing pointer to incomplete type
sys_parisc32.c:1976: warning: type defaults to `int' in declaration of `type
name'
sys_parisc32.c:1977: dereferencing pointer to incomplete type
sys_parisc32.c:1977: dereferencing pointer to incomplete type
sys_parisc32.c:1977: dereferencing pointer to incomplete type
sys_parisc32.c:1977: dereferencing pointer to incomplete type
sys_parisc32.c:1977: dereferencing pointer to incomplete type
sys_parisc32.c:1977: dereferencing pointer to incomplete type
sys_parisc32.c:1977: dereferencing pointer to incomplete type
sys_parisc32.c:1977: dereferencing pointer to incomplete type
sys_parisc32.c:1977: dereferencing pointer to incomplete type
sys_parisc32.c:1977: warning: type defaults to `int' in declaration of `type
name'
sys_parisc32.c:1981: sizeof applied to an incomplete type
sys_parisc32.c:1982: dereferencing pointer to incomplete type
sys_parisc32.c: In function `put_cmsg32':
sys_parisc32.c:2005: storage size of `cmhdr' isn't known
sys_parisc32.c:2006: sizeof applied to an incomplete type
sys_parisc32.c:2008: dereferencing pointer to incomplete type
sys_parisc32.c:2023: sizeof applied to an incomplete type
sys_parisc32.c:2023: sizeof applied to an incomplete type
sys_parisc32.c:2025: sizeof applied to an incomplete type
sys_parisc32.c:2005: warning: unused variable `cmhdr'
sys_parisc32.c: In function `scm_detach_fds32':
sys_parisc32.c:2033: sizeof applied to an incomplete type
sys_parisc32.c:2042: sizeof applied to an incomplete type
sys_parisc32.c:2059: sizeof applied to an incomplete type
sys_parisc32.c:2061: dereferencing pointer to incomplete type
sys_parisc32.c:2061: dereferencing pointer to incomplete type
sys_parisc32.c:2061: dereferencing pointer to incomplete type
sys_parisc32.c:2061: dereferencing pointer to incomplete type
sys_parisc32.c:2061: dereferencing pointer to incomplete type
sys_parisc32.c:2061: dereferencing pointer to incomplete type
sys_parisc32.c:2061: dereferencing pointer to incomplete type
sys_parisc32.c:2061: dereferencing pointer to incomplete type
sys_parisc32.c:2061: dereferencing pointer to incomplete type
sys_parisc32.c:2061: dereferencing pointer to incomplete type
sys_parisc32.c:2063: dereferencing pointer to incomplete type
sys_parisc32.c:2063: dereferencing pointer to incomplete type
sys_parisc32.c:2063: dereferencing pointer to incomplete type
sys_parisc32.c:2063: dereferencing pointer to incomplete type
sys_parisc32.c:2063: dereferencing pointer to incomplete type
sys_parisc32.c:2063: dereferencing pointer to incomplete type
sys_parisc32.c:2063: dereferencing pointer to incomplete type
sys_parisc32.c:2063: dereferencing pointer to incomplete type
sys_parisc32.c:2063: dereferencing pointer to incomplete type
sys_parisc32.c:2063: dereferencing pointer to incomplete type
sys_parisc32.c:2065: dereferencing pointer to incomplete type
sys_parisc32.c:2065: dereferencing pointer to incomplete type
sys_parisc32.c:2065: dereferencing pointer to incomplete type
sys_parisc32.c:2065: dereferencing pointer to incomplete type
sys_parisc32.c:2065: dereferencing pointer to incomplete type
sys_parisc32.c:2065: dereferencing pointer to incomplete type
sys_parisc32.c:2065: dereferencing pointer to incomplete type
sys_parisc32.c:2065: dereferencing pointer to incomplete type
sys_parisc32.c:2065: dereferencing pointer to incomplete type
sys_parisc32.c:2065: dereferencing pointer to incomplete type
sys_parisc32.c:2067: sizeof applied to an incomplete type
sys_parisc32.c: In function `cmsg32_recvmsg_fixup':
sys_parisc32.c:2136: dereferencing pointer to incomplete type
sys_parisc32.c:2137: dereferencing pointer to incomplete type
sys_parisc32.c:2138: dereferencing pointer to incomplete type
sys_parisc32.c:2140: dereferencing pointer to incomplete type
sys_parisc32.c:2141: sizeof applied to an incomplete type
sys_parisc32.c:2144: sizeof applied to an incomplete type
sys_parisc32.c:2145: dereferencing pointer to incomplete type
sys_parisc32.c:2130: warning: `clen64' might be used uninitialized in this
function
sys_parisc32.c: In function `sys32_recvmsg':
sys_parisc32.c:2234: dereferencing pointer to incomplete type
sys_parisc32.c:2284: `__kernel_size_t32' undeclared (first use in this
function)
sys_parisc32.c:2284: parse error before "uclen"
sys_parisc32.c:2285: dereferencing pointer to incomplete type
sys_parisc32.c:2285: dereferencing pointer to incomplete type
sys_parisc32.c:2285: `uclen' undeclared (first use in this function)
sys_parisc32.c:2285: dereferencing pointer to incomplete type
sys_parisc32.c:2285: dereferencing pointer to incomplete type
sys_parisc32.c:2285: dereferencing pointer to incomplete type
sys_parisc32.c:2285: dereferencing pointer to incomplete type
sys_parisc32.c:2285: dereferencing pointer to incomplete type
sys_parisc32.c:2285: dereferencing pointer to incomplete type
sys_parisc32.c:2285: dereferencing pointer to incomplete type
sys_parisc32.c:2285: dereferencing pointer to incomplete type
sys_parisc32.c:2283: warning: unused variable `ucmsg_ptr'
sys_parisc32.c:2288: dereferencing pointer to incomplete type
sys_parisc32.c:2288: dereferencing pointer to incomplete type
sys_parisc32.c:2288: dereferencing pointer to incomplete type
sys_parisc32.c:2288: dereferencing pointer to incomplete type
sys_parisc32.c:2288: dereferencing pointer to incomplete type
sys_parisc32.c:2288: dereferencing pointer to incomplete type
sys_parisc32.c:2288: dereferencing pointer to incomplete type
sys_parisc32.c:2288: dereferencing pointer to incomplete type
sys_parisc32.c:2288: dereferencing pointer to incomplete type
sys_parisc32.c:2288: dereferencing pointer to incomplete type
sys_parisc32.c:2224: warning: `uaddr_len' might be used uninitialized in
this function
sys_parisc32.c: In function `get_fd_set32':
sys_parisc32.c:2526: warning: left shift count >= width of type
sys_parisc32.c: In function `set_fd_set32':
sys_parisc32.c:2555: warning: right shift count >= width of type
sys_parisc32.c: At top level:
sys_parisc32.c:2782: parse error before "__kernel_ino_t32"
sys_parisc32.c:2782: warning: no semicolon at end of struct or union
sys_parisc32.c:2786: parse error before '}' token
sys_parisc32.c:2792: parse error before "__kernel_ino_t32"
sys_parisc32.c:2792: warning: no semicolon at end of struct or union
sys_parisc32.c:2794: parse error before '}' token
sys_parisc32.c:2798: parse error before "__kernel_caddr_t32"
sys_parisc32.c:2798: warning: no semicolon at end of struct or union
sys_parisc32.c:2801: parse error before "ug_udimap"
sys_parisc32.c:2801: warning: type defaults to `int' in declaration of
`ug_udimap'
sys_parisc32.c:2801: warning: data definition has no type or storage class
sys_parisc32.c:2804: parse error before "ug_gdimap"
sys_parisc32.c:2804: warning: type defaults to `int' in declaration of
`ug_gdimap'
sys_parisc32.c:2804: warning: data definition has no type or storage class
sys_parisc32.c:2813: field `u_export' has incomplete type
sys_parisc32.c:2814: field `u_umap' has incomplete type
sys_parisc32.c:2815: field `u_getfh' has incomplete type
sys_parisc32.c:2917: parse error before "__kernel_time_t32"
sys_parisc32.c:2917: warning: no semicolon at end of struct or union
sys_parisc32.c:2918: warning: type defaults to `int' in declaration of
`dqb_itime'
sys_parisc32.c:2918: warning: data definition has no type or storage class
sys_parisc32.c: In function `sys32_quotactl':
sys_parisc32.c:2937: sizeof applied to an incomplete type
sys_parisc32.c:2939: dereferencing pointer to incomplete type
sys_parisc32.c:2940: dereferencing pointer to incomplete type
sys_parisc32.c:2953: dereferencing pointer to incomplete type
sys_parisc32.c:2954: dereferencing pointer to incomplete type
sys_parisc32.c:2956: sizeof applied to an incomplete type
sys_parisc32.c:3008:1: warning: "CP" redefined
sys_parisc32.c:3001:1: warning: this is the location of the previous
definition
make[1]: *** [sys_parisc32.o] Error 1
make[1]: Leaving directory `/usr/src/linux-2.4.20-pa13/arch/parisc/kernel'
make: *** [_dir_arch/parisc/kernel] Error 2

	Anyone know something about this?

-----------------------------------------------------------------------
              Leandro Marcondes Farinati
                    Software Developer

*   leandro.farinati@hp.com
*   +55-51-3316-2852 Telnet  725-2852
FAX +55-51-3316-2754 Mobile +55-51-9965-8020
