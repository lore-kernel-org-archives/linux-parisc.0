Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 12FBC482F
	for <parisc-linux@lists.parisc-linux.org>; Wed, 23 Oct 2002 05:12:11 -0600 (MDT)
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 16421D54
	for <parisc-linux@lists.parisc-linux.org>; Wed, 23 Oct 2002 13:12:05 +0200 (METDST)
Received: from admin.france.hp.com (ssdpc48.france.hp.com [15.129.234.2]) by hpfrcu03.france.hp.com with ESMTP (8.7.6/8.7.3 SMKit7.02) id NAA17215 for <parisc-linux@lists.parisc-linux.org>; Wed, 23 Oct 2002 13:10:20 +0200 (METDST)
Message-ID: <3DB68404.549D048A@admin.france.hp.com>
Date: Wed, 23 Oct 2002 13:12:04 +0200
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: multipart/mixed;
 boundary="------------B845CAA02AD6440228AA76B4"
Subject: [parisc-linux] insmod modules -> kernel panic:
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

This is a multi-part message in MIME format.
--------------B845CAA02AD6440228AA76B4
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

	Hi
I'm preparing a patche for the dump driver.
So I'm testing it. But when using insmod dump_rle
(it is a module to use rle compression while dumping)
It panics immediatly, it don't even start the initialisation.

By using insmod -m I have:

Using /lib/modules/2.4.19-pa22/kernel/drivers/dump/dump_rle.o
r_info 0x29 not handled
r_info 0x29 not handled
r_info 0x29 not handled
r_info 0x29 not handled
Sections:       Size      Address   Align
.this           000000b8  000d3000  2**3
.text           00000000  000d30b8  2**0
.text.dump_compress_rle 000002f8  000d30b8  2**3
.text.dump_compress_rle_init 00000038  000d33b0  2**3
.text.dump_compress_rle_cleanup 00000028  000d33e8  2**3
.stub           00000020  000d3410  2**4
.PARISC.unwind  00000030  000d3430  2**2
.kstrtab        000000b4  000d3460  2**0
.kmodtab        00000018  000d3518  2**3
__ksymtab       00000040  000d3530  2**3
__archdata      00000028  000d3570  2**4
.got            00000018  000d3598  2**3
.data           00000020  000d35b0  2**3
.opd            00000060  000d35d0  2**4
.bss            00000000  000d3630  2**0

Symbols:
000d3000 d __this_module
000d3000 D __insmod_dump_rle_O/lib/modules/2.4.19-pa22/kernel/drivers/dump/dump_rle.o_M3DB56146_V132115
000d30b8 t .text.dump_compress_rle
000d30b8 t dump_compress_rle
000d30b8 t .text
000d33b0 t .text.dump_compress_rle_init
000d33b0 T dump_compress_rle_init
000d33b0 t init_module
000d33e8 t cleanup_module
000d33e8 T dump_compress_rle_cleanup
000d33e8 t .text.dump_compress_rle_cleanup
000d3430 r .PARISC.unwind -> PANIC !!!!

Any idea, any suggestion to have more debug ?
Where this .PARISC.unwind comes from ??? It is not in my code.

	thanks.

-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
--------------B845CAA02AD6440228AA76B4
Content-Type: text/x-vcard; charset=iso-8859-1;
 name="bruno_vidal.vcf"
Content-Transfer-Encoding: base64
Content-Description: Card for Bruno Vidal
Content-Disposition: attachment;
 filename="bruno_vidal.vcf"

YmVnaW46dmNhcmQgCm46QnJ1bm87VklEQUwKdGVsO2ZheDowMS02OS04Mi02MC0xNAp0ZWw7
d29yazowMS02OS0yOS00Mi03MQp4LW1vemlsbGEtaHRtbDpUUlVFCnVybDp3d3cuZnJhbmNl
LmhwLmNvbQpvcmc6U29sdXRpb24gQ2VudGVyCnZlcnNpb246Mi4xCmVtYWlsO2ludGVybmV0
OmJydW5vX3ZpZGFsQGhwLmNvbQp0aXRsZTpFeHBlcnQgTG9naWNpZWwgRW52aXJvbm5lbWVu
dCBIYXV0ZSBEaXNwb25pYmlsaXTpCmFkcjtxdW90ZWQtcHJpbnRhYmxlOjs7SFAgRnJhbmNl
PTBEPTBBO1ouQSBkZSBDb3VydGFib2V1ZjsxIEF2LiBkdSBDYW5hZGE7OTE5NDcgTGVzIFVs
aXMgY2VkZXg7RnJhbmNlCngtbW96aWxsYS1jcHQ6OzI2MjA4CmZuOlZJREFMIEJydW5vCmVu
ZDp2Y2FyZAo=
--------------B845CAA02AD6440228AA76B4--
