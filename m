Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 35E6D482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  4 Feb 2002 04:57:45 -0700 (MST)
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id DC33B395
	for <parisc-linux@lists.parisc-linux.org>; Mon,  4 Feb 2002 12:57:42 +0100 (MET)
Received: from admin.france.hp.com (ssdpc48.france.hp.com [15.129.234.2]) by hpfrcu03.france.hp.com with ESMTP (8.7.6/8.7.3 SMKit7.02) id MAA19483 for <parisc-linux@lists.parisc-linux.org>; Mon, 4 Feb 2002 12:57:06 +0100 (MET)
Message-ID: <3C5E768A.573CC5A2@admin.france.hp.com>
Date: Mon, 04 Feb 2002 12:54:50 +0100
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: multipart/mixed;
 boundary="------------37DFD4303330351644CC9096"
Subject: [parisc-linux] dump driver for parisc-linux: patch vs CVS
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
--------------37DFD4303330351644CC9096
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

	Hi.
I've a dump driver available for 2.4.17-pa3 and I'll
upgrade my source to latest CVS bits and redo the 
modifications. But do you think it is possible to
put in the CVS these modifications ? 
I have modified:
./Makefile 
./arch/parisc/config.in
./arch/parisc/kernel/traps.c
./arch/parisc/mm/init.c
./drivers/Makefile 
./drivers/char/sysrq.c
./init/main.c
./kernel/ksyms.c
./kernel/panic.c
./kernel/sched.c

And I've added:
./include/linux/dump.h 
./drivers/dump/Makefile
./drivers/dump/dump_base.c
./drivers/dump/dump_rle.c
./drivers/dump/dump_parisc.c

So my question: 
-Do you think it is a good idea to have a dump driver available 
in the standart kernel ?
-If yes, who is able to do the code review, and put this dump 
module in the CVS ?

	Thanks.
 
-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
--------------37DFD4303330351644CC9096
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
--------------37DFD4303330351644CC9096--
