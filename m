Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 81F694829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Sep 2002 00:19:23 -0600 (MDT)
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id F0DD81C1C
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Sep 2002 08:19:17 +0200 (METDST)
Received: from admin.france.hp.com (ssdpc48.france.hp.com [15.129.234.2]) by hpfrcu03.france.hp.com with ESMTP (8.7.6/8.7.3 SMKit7.02) id IAA11328 for <parisc-linux@lists.parisc-linux.org>; Mon, 2 Sep 2002 08:17:49 +0200 (METDST)
Message-ID: <3D73014A.15ED96ED@admin.france.hp.com>
Date: Mon, 02 Sep 2002 08:12:26 +0200
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: multipart/mixed;
 boundary="------------C8EBD1BF8147A59EBF9CB289"
Subject: [parisc-linux] iodc call and HPMC: dump driver.
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
--------------C8EBD1BF8147A59EBF9CB289
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

	Hi all.
Do you know a guy who is a guru of iodc calls ?
I'm still stuck with this. I think I was really near the
solution. Now my iodc call create beatifull HPMC.
Take a look to this call, I was thinking that it
was all right, but there is still something wrong.
now i'm able to retrieve hpa,
I based this on palo code:

ret =  real32_call(PAGE0->mem_boot.iodc_io, (unsigned long)PAGE0->mem_boot.hpa, DUMPDEV_WRITE,
  PAGE0->mem_boot.spa, __pa(PAGE0->mem_boot.dp.layers), __pa(pdc_result), devaddr, __pa(iodc_dbuf), 2048);

DUMPDEV_WRITE = 1
static unsigned long pdc_result[32] __attribute__ ((aligned (8))); 
static char __attribute__((aligned(64))) iodc_dbuf[DUMP_PAGE_SZ];

and devaddr=191889408

Disk /dev/sda: 64 heads, 32 sectors, 17366 cylinders
Units = cylinders of 2048 * 512 bytes

/dev/sda1   *         1        61     62448   f0  Linux/PA-RISC boot
/dev/sda2            62       183    124928   83  Linux
/dev/sda3           184      1648   1500160   82  Linux swap
/dev/sda4          1649     17366  16095232    5  Extended
/dev/sda5          1649      5554   3999728   83  Linux
/dev/sda6          5555      9460   3999728   82  Linux swap
/dev/sda7          9461     13366   3999728   83  Linux
/dev/sda8         13367     17366   4095984   83  Linux

Do you know someone who is well aware of iodc calls ?
I want to discuss a bit about this.

	Thanks.

-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
--------------C8EBD1BF8147A59EBF9CB289
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
--------------C8EBD1BF8147A59EBF9CB289--
