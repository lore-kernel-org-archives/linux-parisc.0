Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mx2.isti.cnr.it (mx2.isti.cnr.it [146.48.80.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4AB644839
	for <parisc-linux@lists.parisc-linux.org>; Fri,  4 Apr 2003 04:42:27 -0700 (MST)
Received: from CONVERSION.MAIL.IAT.CNR.IT by mx.isti.cnr.it (PMDF V6.2 #30641)
 id <01KUBY2YAU7K94DTTW@mx.isti.cnr.it> for
 parisc-linux@lists.parisc-linux.org; Fri, 04 Apr 2003 13:41:17 +0200
Received: from isti.cnr.it (archimede.isti.cnr.it [146.48.84.13])
 by mx.isti.cnr.it (PMDF V6.2 #30641)
 with ESMTPS id <01KUBY0Z3SSS95MNDF@mx.isti.cnr.it> for
 parisc-linux@lists.parisc-linux.org; Fri, 04 Apr 2003 13:41:17 +0200
Date: Fri, 04 Apr 2003 13:49:33 +0200
From: Carlo Carlesi <carlesi@isti.cnr.it>
To: parisc-linux@lists.parisc-linux.org
Message-id: <3E8D714D.EF7D2C42@isti.cnr.it>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: [parisc-linux] install Debian 3.0 on hp9000 model D270/2
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

Hello,
i try to boot from cdrom but i  have the above messages:

.......
Command line for kernel: 'ramdisk_size=8192 roo=/dev/ram console=tty0
sti=8/12
sti_font=VGA8x16 TERM=linux pa;o_kernel=0/vmlinux32'
Selevted kernel: /vmlinux32 from partition 0
Selected ramdisk: /ramdisk from partition 0
ELF32 executable
Entry 00100000 first 00100000 n 5
Segment 0 load 00100000 size 2024492 mediaptr 0x1000
Segment 1 load 002f0000 size 299320 mediaptr 0x1f0000
Segment 2 load 0033c000 size 401408 mediaptr 0x23a000
Segment 3 load 003a 0000 size 32768 mediaptr 0x29c000
Segment 4 load 003c90f8 size 102032 mediaptr 02a40f8
Loading ramdisk 2663046 bytes @ 17d65000
Brancing to kernel entry point 0x00100000.   If this is the last
message you see, you need to switch your console. This is
a common symtom -- search the FAQ and mailing list at parisk-linux.org.


--------------
At this point the system is not responding .... qhat i can do ?

If i exexute the command "path" (at the prompt boot_line) i have a
"console path=8/12.0 ".

I try to put 8/12.0 as console but not is changed.


Sorry for my bad english, best regards

carlo
------------------------
Carlo Carlesi
Consiglio Nazionale Delle Ricerche
Istituto di Scienza e Tecnologia dell'Informazione
"Alessando Faedo"
Area della Ricerca di Pisa
Via Moruzzi, 1 (Italy)
Tel. +39 050 315 2800
carlo.carlesi@isti.cnr.it
