Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id AE3374829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 21 Oct 2002 05:19:15 -0600 (MDT)
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id BA40880F
	for <parisc-linux@lists.parisc-linux.org>; Mon, 21 Oct 2002 13:19:10 +0200 (METDST)
Received: from admin.france.hp.com (ssdpc48.france.hp.com [15.129.234.2]) by hpfrcu03.france.hp.com with ESMTP (8.7.6/8.7.3 SMKit7.02) id NAA07593 for <parisc-linux@lists.parisc-linux.org>; Mon, 21 Oct 2002 13:17:25 +0200 (METDST)
Message-ID: <3DB3E2AC.7FC260A8@admin.france.hp.com>
Date: Mon, 21 Oct 2002 13:19:08 +0200
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: multipart/mixed;
 boundary="------------EB41338C01E7D4FDD572DC6A"
Subject: [parisc-linux] Pb with shared lib/or keymap after apt-get upgrade
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
--------------EB41338C01E7D4FDD572DC6A
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

	Hi
This morning I start to upgrade my system in order
to have latest tools/binaries and so on.
I did:
apt-get update
-> fine
#apt-get upgrade
-> seems fine
But now when lauching /bin/sh (that is a link on /bin/bash):
/bin/sh: Symbol `vi_insertion_keymap' has different size in shared object, consider re-linking
/bin/sh: Symbol `vi_movement_keymap' has different size in shared object, consider re-linking
/bin/sh: Symbol `emacs_standard_keymap' has different size in shared object, consider re-linking
/bin/sh: Symbol `emacs_ctlx_keymap' has different size in shared object, consider re-linking
/bin/sh: Symbol `emacs_meta_keymap' has different size in shared object, consider re-linking

Where it comes from ?
#dpkg -l bash
ii  bash                       2.05a-2                    The GNU Bourne Again SHell

	Thanks.

-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
--------------EB41338C01E7D4FDD572DC6A
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
--------------EB41338C01E7D4FDD572DC6A--
