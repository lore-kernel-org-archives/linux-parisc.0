Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 910454829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 Oct 2002 11:40:41 -0600 (MDT)
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 668AE8B2
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 Oct 2002 19:40:37 +0200 (METDST)
Received: from admin.france.hp.com (ssdpc48.france.hp.com [15.129.234.2]) by hpfrcu03.france.hp.com with ESMTP (8.7.6/8.7.3 SMKit7.02) id TAA21967 for <parisc-linux@lists.parisc-linux.org>; Thu, 17 Oct 2002 19:38:53 +0200 (METDST)
Message-ID: <3DAEF613.A3A42F9E@admin.france.hp.com>
Date: Thu, 17 Oct 2002 19:40:35 +0200
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Dump driver: step by step
References: <3DABF865.8224BF5@admin.france.hp.com> <3DAC09D7.47F2D9C0@hpfrcu81.france.hp.com> <3DAC0D9E.BD896745@admin.france.hp.com>
Content-Type: multipart/mixed;
 boundary="------------B0F7A425023EC0FFE255DD2C"
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
--------------B0F7A425023EC0FFE255DD2C
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

	hi
Good news, now I'm able to initialise and read/write on
multiple disk. The solution a new time was a specific
PDC call on PAT system (we don't need it on 712 for example):

dump_pdc_call(PDC_IO, PDC_IO_RESET_DUMP_DEVS, __pa(pdc_result),__pa(dumpdev))

where dumpdev is the list of all "struct device_path".
It would be really interresting if someone is able to
find the "parisc 2.0 I/O firmware" doc, it would gain
a lot's of time to poor little programmers like me.

	Bye.

-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
--------------B0F7A425023EC0FFE255DD2C
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
--------------B0F7A425023EC0FFE255DD2C--
