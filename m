Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id AC6A24833
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 Jan 2002 10:59:54 -0700 (MST)
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 02C2B278
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 Jan 2002 18:59:47 +0100 (MET)
Message-ID: <3C4DA793.B17F1D3C@admin.france.hp.com>
Date: Tue, 22 Jan 2002 18:55:31 +0100
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] vmlinux header for savecrash.
References: <3C4C53B7.67DA24E@admin.france.hp.com> <20020121202539.994A5482A@dsl2.external.hp.com>  <3C4D2EFB.F82671C2@admin.france.hp.com> <20020122174533.38418482A@dsl2.external.hp.com>
Content-Type: multipart/mixed;
 boundary="------------B8E70CF7290CEC3ABD38A103"
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
--------------B8E70CF7290CEC3ABD38A103
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

	Hi
I don't know how to retrieve option pass to the kernel,
but give me some clue, and I'll add this information in
the dump header asap, because it is a really good idea :-)

Grant Grundler wrote:
> 
> Randolph Chung and I were wondering if dump driver could save a
> parameter passed in by palo: eg "boot_kernel=/boot/vmlinux-pa11".
> I haven't checked if something like that already exists.
> 
> grant



-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
--------------B8E70CF7290CEC3ABD38A103
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
--------------B8E70CF7290CEC3ABD38A103--
