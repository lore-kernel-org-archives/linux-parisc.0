Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA10739
	for <parisc-linux@puffin.external.hp.com>; Tue, 10 Oct 2000 02:10:10 -0600
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 46C6D1B571
	for <parisc-linux@thepuffingroup.com>; Tue, 10 Oct 2000 10:11:15 +0200 (METDST)
Received: from admin.france.hp.com (ssdpc48.france.hp.com [15.129.234.2]) by hpfrcu03.france.hp.com with ESMTP (8.7.6/8.7.3 SMKit7.02) id KAA21609 for <parisc-linux@thepuffingroup.com>; Tue, 10 Oct 2000 10:10:23 +0200 (METDST)
Sender: vidal@hpfrcu03.france.hp.com
Message-ID: <39E2CE16.E7D9A84F@admin.france.hp.com>
Date: Tue, 10 Oct 2000 10:06:46 +0200
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Unable to compil gcc2.96 on L2000/11.00/64 bits
List-ID: <linux-parisc.vger.kernel.org>

	Hi
I'm unable to compile gcc2.96 cross compiler with latest bits.
(binutils is okay, it compile right)
I've configure it with:
../gcc/configure --target=hppa1.1-linux --prefix=$DEST --disable-nls --without-libc
(with DEST=/opt/linux_hppa)
-> it looks okay:
checking host system type... hppa2.0w-hp-hpux11.00
.
.
.
creating ./config.status
creating Makefile

# echo $?
0

So I start to compil, and after a few momment:
make[2]: Entering directory `/opt/linux_hppa/src/gcc_build/hppa1.1-linux/libiberty'
make[2]: *** No targets specified and no makefile found.  Stop.
make[2]: Leaving directory `/opt/linux_hppa/src/gcc_build/hppa1.1-linux/libiberty'
make[1]: *** [../libiberty/libiberty.a] Error 2
make[1]: Leaving directory `/opt/linux_hppa/src/gcc_build/hppa1.1-linux/libstdc++'
make: *** [all-target-libstdc++] Error 2                                  

-> no makefile for hppa1.1-linux/libiberty.
Do you have any idea to correct that ?

	Thanks.

-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
