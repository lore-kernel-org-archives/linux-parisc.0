Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id B844E482F
	for <parisc-linux@lists.parisc-linux.org>; Fri, 18 Oct 2002 09:58:50 -0600 (MDT)
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id F11311655
	for <parisc-linux@lists.parisc-linux.org>; Fri, 18 Oct 2002 17:58:46 +0200 (METDST)
Received: from admin.france.hp.com (ssdpc48.france.hp.com [15.129.234.2]) by hpfrcu03.france.hp.com with ESMTP (8.7.6/8.7.3 SMKit7.02) id RAA29856 for <parisc-linux@lists.parisc-linux.org>; Fri, 18 Oct 2002 17:57:02 +0200 (METDST)
Message-ID: <3DB02FB0.5C048CF7@admin.france.hp.com>
Date: Fri, 18 Oct 2002 17:58:40 +0200
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: multipart/mixed;
 boundary="------------A6C8ECAEACB40A053591D3B6"
Subject: [parisc-linux] Strange offset with file system parition
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
--------------A6C8ECAEACB40A053591D3B6
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

	Hi
I've succeded to produce my first dump using IODC.
I've retrieve it, but I had some difficulties
with ms-dos parition. I'm using "gendisk_head"
to retrieve start/end of a parition. For my sda1
it find 32768. So I'm writing at start+PAGE_SIZE
-> in my case it should be 0x8000 + 0x1000
And When I look by using 
dd if=/dev/sda skip=9 bs=4096 count=1 | hexdump
It's fine, I'm on the right place.

But when doing:
dd if=/dev/sda1 skip=1 bs=4096 count=1 | hexdump
-> I'm not good ?????
There is a difference of 0x600:

hexdump /tmp/sda1.bin | more
0000000 0000 0000 0000 0000 0000 0000 0000 0000
*
0001600 a819 0173 618f 23ed 0000 0005 0000 0778
0001610 0000 0008 0000 1000 0000 0000 0004 0000

-> I found my magic number 0x600 to fare.

But

# hexdump /tmp/sda.bin | more
.
.
0009000 a819 0173 618f 23ed 0000 0005 0000 0778

-> that okay !!!!!!!

So my question: where this difference come from ?

Thanks.


-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
--------------A6C8ECAEACB40A053591D3B6
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
--------------A6C8ECAEACB40A053591D3B6--
