Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6068F4832
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Jun 2002 08:58:16 -0600 (MDT)
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 617BB189
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Jun 2002 16:58:14 +0200 (METDST)
Received: from admin.france.hp.com (ssdpc48.france.hp.com [15.129.234.2]) by hpfrcu03.france.hp.com with ESMTP (8.7.6/8.7.3 SMKit7.02) id QAA23881 for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Jun 2002 16:57:07 +0200 (METDST)
Message-ID: <3D04BD42.446D930@admin.france.hp.com>
Date: Mon, 10 Jun 2002 16:52:50 +0200
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: multipart/mixed;
 boundary="------------9EB8D9FE193EB5B2AA95E508"
Subject: [parisc-linux] Pb with ioctl and 64bits
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
--------------9EB8D9FE193EB5B2AA95E508
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

	Hi
I'm loosing my nerves. I'm stuck with it since two days, and I don't understand :-(
My ioctls are running fine with 32bits kernel. I thought I've done everything fine,
but when compiling it with 64 bits kernel it fail with:
sys32_ioctl: Unknown cmd fd(3) cmd(80047001) arg(00000803)
So my question is: what is the difference between 32bits and 64bits kernel about
the ioctls ? 

I think that arch/parisc/kernel/ioctl32.c is used with 64bits and not with 32bits, right ?

If yes, what I need to do more than:
#if defined(CONFIG_DUMP) || defined(CONFIG_DUMP_MODULE)
COMPATIBLE_IOCTL(DIOSDUMPDEV);
COMPATIBLE_IOCTL(DIOGDUMPDEV);
COMPATIBLE_IOCTL(DIOSDUMPLEVEL);
COMPATIBLE_IOCTL(DIOGDUMPLEVEL);
COMPATIBLE_IOCTL(DIOSDUMPFLAGS);
COMPATIBLE_IOCTL(DIOGDUMPFLAGS);
COMPATIBLE_IOCTL(DIOSDUMPCOMPRESS);
COMPATIBLE_IOCTL(DIOGDUMPCOMPRESS);
COMPATIBLE_IOCTL(DIOGDINDEX);
#endif /* DUMP */

	thanks.
 
-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
--------------9EB8D9FE193EB5B2AA95E508
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
--------------9EB8D9FE193EB5B2AA95E508--
