Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id C723B485C
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Jul 2002 04:59:03 -0600 (MDT)
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 0E0285DE
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Jul 2002 12:59:02 +0200 (METDST)
Received: from admin.france.hp.com (ssdpc48.france.hp.com [15.129.234.2]) by hpfrcu03.france.hp.com with ESMTP (8.7.6/8.7.3 SMKit7.02) id MAA20558 for <parisc-linux@lists.parisc-linux.org>; Fri, 5 Jul 2002 12:57:45 +0200 (METDST)
Message-ID: <3D257AAB.D04CD0DC@admin.france.hp.com>
Date: Fri, 05 Jul 2002 12:53:31 +0200
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: multipart/mixed;
 boundary="------------D65508782C25C4AEBFAFAF66"
Subject: [parisc-linux] mem_pdc_call: how using it exactly.
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
--------------D65508782C25C4AEBFAFAF66
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

	Hi
I'm fighting with pdc calls since two weeks now. And I think I've nearly succeded to understand how it works. But now I have a problem. I've retrieve the modules hpa, so before using it, I need to
retrieve the spa and io_entry code in order to use it. For doing it I've wrote this, it is nearly the same thing than the function pdc_iodc_read():


static unsigned long pdc_result[32] __attribute__ ((aligned (8)));
static unsigned long pdc_result2[32] __attribute__ ((aligned (8)));

/* Get spa for this module */
hpa=dump_parms->hpa;
index=0;
iodc_data_size=32;

ret = mem_pdc_call(PDC_IODC, PDC_IODC_READ, __pa(pdc_result), hpa, index, __pa(pdc_result2), iodc_data_size);
convert_to_wide(pdc_result);
bytecnt = pdc_result[0];
memcpy(dump_iodc_data, pdc_result2, iodc_data_size);

The result is always "ret = -3" -> cannot complete call without error.
Do I forget anything (probably). Do I have to prevent interruption ? Do I have to modify PSW ?

	thanks.
 
-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
--------------D65508782C25C4AEBFAFAF66
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
--------------D65508782C25C4AEBFAFAF66--
