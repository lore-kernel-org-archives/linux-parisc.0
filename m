Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel12.hp.com (palrel12.hp.com [156.153.255.237])
	by dsl2.external.hp.com (Postfix) with ESMTP id 826AD482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Nov 2002 05:12:10 -0700 (MST)
Received: from xparelay1.ptp.hp.com (xparelay1.ptp.hp.com [15.1.28.62])
	by palrel12.hp.com (Postfix) with ESMTP id 06BAFE0075F
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Nov 2002 04:12:06 -0800 (PST)
Received: from xpabh4.ptp.hp.com (xpabh4.ptp.hp.com [15.1.28.64])
	by xparelay1.ptp.hp.com (Postfix) with ESMTP id 2A8EFE000AE
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Nov 2002 04:11:49 -0800 (PST)
Message-ID: <CB813811CBF6D3118DCC00902740BB4A0B8665D5@xsp01.brazil.hp.com>
From: "FARINATI,LEANDRO (HP-Brazil,ex1)" <leandro.farinati@hp.com>
To: parisc-linux@lists.parisc-linux.org
Date: Fri, 22 Nov 2002 04:11:36 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] pa-risc assembler
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

	I would like to know about usage of .subspa, because I am converting
some asm sourcecodes in hp-ux to linux.
	When iI will try to compile the source code with "cc --hppa-linux
-std=iso9899:1990 -march=2.0 -mpa-risc-2-0 -D__KERNEL__ -I../../include -I.
-c -o myfile.o myfile.s, the result is always" the same "Error: unknown
pseudo-op: `.subspa'".
	Why this happens?

Thanks in advance,

-----------------------------------------------------------------------
              Leandro Marcondes Farinati
                    Software Developer

*   leandro.farinati@hp.com
*   +55-51-3316-2852 Telnet  725-2852
FAX +55-51-3316-2754 Mobile +55-51-9965-8020
