Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver3.hrz.tu-darmstadt.de (mailserver3.hrz.tu-darmstadt.de [130.83.126.47])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6E28F4841
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Nov 2003 13:21:18 -0700 (MST)
Received: from hrzpub.tu-darmstadt.de (IP-213157011231.dialin.heagmedianet.de [213.157.11.231])
	(authenticated bits=0)
	by mailserver3.hrz.tu-darmstadt.de (8.12.10/8.12.7) with ESMTP id hA5KKdCT011802
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <parisc-linux@lists.parisc-linux.org>; Wed, 5 Nov 2003 21:20:57 +0100
Message-ID: <3FA95BBA.7080705@hrzpub.tu-darmstadt.de>
Date: Wed, 05 Nov 2003 21:21:14 +0100
From: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Subject: [parisc-linux] fdisk problems 2.4 <-> 2.6
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

it's me again. I repartioned a IBM-hd with 4330 MB but when running 
fdisk with 2.6.0-test8-pa4, fdisk  told me:

--------><------------
gandalf:~# fdisk /dev/sdb

Befehl (m für Hilfe): p

Platte /dev/sdb: 40 MByte, 40239104 Byte
134 Köpfe, 62 Sektoren/Spuren, 9 Zylinder
Einheiten = Zylinder von 8308 * 512 = 4253696 Bytes

    Gerät Boot      Start         End      Blocks   Id  System
/dev/sdb1   *           1           8       33201   f0  Linux/PA-RISC boot
/dev/sdb2               9          23       62310   83  Linux
/dev/sdb3              24          83      249240   82  Linux Swap
/dev/sdb4              84        1019     3888144   8e  Linux LVM

Befehl (m für Hilfe):
------><-------------

Cause some bytes are missing ;)  I booted 2.4.22-pa13 and fdisk is now 
telling the correct values:

-------><--------
gandalf:~# fdisk /dev/sdb

Befehl (m für Hilfe): p

Platte /dev/sdb: 4335 MByte, 4335206400 Byte
134 Köpfe, 62 Sektoren/Spuren, 1019 Zylinder
Einheiten = Zylinder von 8308 * 512 = 4253696 Bytes

    Gerät Boot      Start         End      Blocks   Id  System
/dev/sdb1   *           1           8       33201   f0  Linux/PA-RISC boot
/dev/sdb2               9          23       62310   83  Linux
/dev/sdb3              24          83      249240   82  Linux Swap
/dev/sdb4              84        1019     3888144   8e  Linux LVM

Befehl (m für Hilfe): q

gandalf:~#
----------><--------

I have a 715/100 with 128 MB, a 2GB Seagate and a 4GB IBM-HD.
With my 2GB fdisk seems to have no problem:
------>2.6.0-test8-pa4<---------
gandalf:~# fdisk /dev/sda

Befehl (m für Hilfe): p

Platte /dev/sda: 2147 MByte, 2147678720 Byte
67 Köpfe, 62 Sektoren/Spuren, 1009 Zylinder
Einheiten = Zylinder von 4154 * 512 = 2126848 Bytes

    Gerät Boot      Start         End      Blocks   Id  System
/dev/sda1               1          11       22816   f0  Linux/PA-RISC boot
/dev/sda2              12          32       43617   83  Linux
/dev/sda3              33          96      132928   82  Linux Swap
/dev/sda4              97        1009     1896301   83  Linux

Befehl (m für Hilfe):
-----><-----------
----->2.4.22-pa13<----------
gandalf:~# fdisk /dev/sda

Befehl (m für Hilfe): p

Platte /dev/sda: 2147 MByte, 2147678720 Byte
67 Köpfe, 62 Sektoren/Spuren, 1009 Zylinder
Einheiten = Zylinder von 4154 * 512 = 2126848 Bytes

    Gerät Boot      Start         End      Blocks   Id  System
/dev/sda1               1          11       22816   f0  Linux/PA-RISC boot
/dev/sda2              12          32       43617   83  Linux
/dev/sda3              33          96      132928   82  Linux Swap
/dev/sda4              97        1009     1896301   83  Linux

Befehl (m für Hilfe):
----------><----------

Anybody encounter the same problems with fdisk?

Greetings,
    Ruediger
