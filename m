Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6C2CC4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 May 2003 06:41:20 -0600 (MDT)
Received: from localhost (localhost [127.0.0.1])
	by transport.cksoft.de (Postfix) with ESMTP id 31C271FFBCE
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 May 2003 14:41:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.int.zabbadoz.net (Postfix) with ESMTP id 1957015329
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 May 2003 12:41:03 +0000 (UTC)
Date: Sun, 18 May 2003 12:41:03 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.BSF.4.53.0305181226340.86062@e0-0.zab2.int.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Inconsistency detected by ld.so:.. / do_page_fault()
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

Hi,

bz@apollo:~> ldd /bin/cp
Inconsistency detected by ld.so: rtld.c: 879: dl_main: Assertion `_rtld_local._dl_rtld_map.l_libname' failed!
Inconsistency detected by ld.so: rtld.c: 879: dl_main: Assertion `_rtld_local._dl_rtld_map.l_libname' failed!
ldd: /lib/ld.so.1 exited with unknown exit code (127)


I have seen:
http://lists.parisc-linux.org/pipermail/parisc-linux/2003-March/019601.html

ist this patch included in some cvs so that I can rebuild me glibc ?
Or any other proposals ?



I also have other probs with vim and tcpdump and most likely others
dumping core and producing a do_page_fault() dump with IAOQ: 4xxxxxxxx
on 2.5.-latest from cvs w/o last single ioctl commit.
but I also had seen these core dumps on 2.4.18-pa33 after last
dist-upgrade some days ago ...


do_page_fault() pid=732 command='vim' type=15 address=0x00000000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 40209e44 400ec15f 00000000
r04-07  40208644 0011c8b6 00000017 00126b30
r08-11  00000000 001695a8 00000000 00000000
r12-15  00000002 00000001 00000001 00070208
r16-19  ffffffff 00000000 00000000 40208644
r20-23  00000002 40208644 400ec11c 00000000
r24-27  00000000 0011c8b6 00000002 0010f634
r28-31  000abc78 0000011e faf009c0 4000a08f
sr0-3   00000016 00000016 00000000 00000016
sr4-7   00000016 00000016 00000016 00000016

IASQ: 00000016 00000016 IAOQ: 401d1b2f 401d1b33
 IIR: 0c601094    ISR: 00000016  IOR: 00000000
 CPU:        0   CR30: 146f4000 CR31: 102e1000
 ORIG_R28: 00126f48


any ideas ?

more infos available on request.

-- 
Greetings

Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
