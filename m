Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel9.hp.com (atlrel9.hp.com [156.153.255.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id B63EA4829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Dec 2002 10:56:53 -0700 (MST)
Received: from xatlrelay2.atl.hp.com (xatlrelay2.atl.hp.com [15.45.89.191])
	by atlrel9.hp.com (Postfix) with ESMTP id 5270FE0107A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Dec 2002 12:56:49 -0500 (EST)
Received: from xatlbh1.atl.hp.com (xatlbh1.atl.hp.com [15.45.89.186])
	by xatlrelay2.atl.hp.com (Postfix) with ESMTP id 50B04400183
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Dec 2002 12:56:48 -0500 (EST)
Message-ID: <9A0482A7BD2506488AD9417C93F3714F9CDC0A@xsp01.brazil.hp.com>
From: "FARINATI,LEANDRO (HP-Brazil,ex1)" <leandro.farinati@hp.com>
To: "Parisc-Linux List (E-mail)" <parisc-linux@lists.parisc-linux.org>
Date: Fri, 6 Dec 2002 12:56:41 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] linking
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

	I'm tryng link some object files (c and asm files already compiled)
and I got an error. 
	Could someone help-me to solve it?

	The main function is in main.c(main.o)
	Command Line:  gcc -o exec main.o asm.o .file1.o file2.o
	Error:
		/usr/lib/gcc-lib/hppa-linux/3.0.4/../../../crt1.o: In
function `_start':
	
/usr/lib/gcc-lib/hppa-linux/3.0.4/../../../crt1.o(.text+0x0): undefined
reference to `main'
	
/usr/lib/gcc-lib/hppa-linux/3.0.4/../../../crt1.o(.text+0x4): undefined
reference to `main'
		collect2: ld returned 1 exit status

Thanks in advance,

-----------------------------------------------------------------------
              Leandro Marcondes Farinati
                    Software Developer

*   leandro.farinati@hp.com
