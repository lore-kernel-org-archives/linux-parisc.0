Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id EC1B4482F
	for <parisc-linux@lists.parisc-linux.org>; Wed, 23 Oct 2002 08:20:16 -0600 (MDT)
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 97D7F1140
	for <parisc-linux@lists.parisc-linux.org>; Wed, 23 Oct 2002 16:20:12 +0200 (METDST)
Received: from admin.france.hp.com (ssdpc48.france.hp.com [15.129.234.2]) by hpfrcu03.france.hp.com with ESMTP (8.7.6/8.7.3 SMKit7.02) id QAA03480 for <parisc-linux@lists.parisc-linux.org>; Wed, 23 Oct 2002 16:18:27 +0200 (METDST)
Message-ID: <3DB6B01B.61D240D@admin.france.hp.com>
Date: Wed, 23 Oct 2002 16:20:11 +0200
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] insmod modules -> kernel panic:
References: <3DB68404.549D048A@admin.france.hp.com>
Content-Type: multipart/mixed;
 boundary="------------0A91584CAB98F2932BF77BEE"
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
--------------0A91584CAB98F2932BF77BEE
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

	hi
It seems to be a weird problem. I've recompile everything
(make clean && make dep && make vmlinux && make modules && make modules_install)
And:
-A-class: 64bits compilation, it panic, but not at the same place than before:
# insmod -m dump_rle
.
.
.
Symbols:
000d3000 D __insmod_dump_rle_O/lib/modules/2.4.19-pa22/kernel/drivers/dump/dump_rle.o_M3DB6A52E_V132115
000d3000 d __this_module
000d30b8 t .text.dump_compress_rle
000d30b8 t dump_compress_rle
000d30b8 t .text
000d33b0 t .text.dump_compress_rle_init
000d33b0 T dump_compress_rle_init
000d33b0 t init_module
000d3400 t cleanup_module
000d3400 T dump_compress_rle_cleanup
000d3400 t .text.dump_compress_rle_cleanup
000d3460 r .PARISC.unwind
000d3490 r .rodata
000d3490 r .LC5
000d3490 R __insmod_dump_rle_S.rodata_L20
000d3630 D __insmod_dump_rle_S.data_L32
000d3630 d dump_rle_compression
000d3630 d .data
000d36b0 d .bss -> it panic here

-712: works fine !!!!!

I'll try to install the latest 64 bit compiler....


-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
--------------0A91584CAB98F2932BF77BEE
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
--------------0A91584CAB98F2932BF77BEE--
