Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id B43E4482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jan 2002 01:24:29 -0700 (MST)
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id AAFC1ED8
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jan 2002 09:24:23 +0100 (MET)
Received: from admin.france.hp.com (ssdpc48.france.hp.com [15.129.234.2]) by hpfrcu03.france.hp.com with ESMTP (8.7.6/8.7.3 SMKit7.02) id JAA23674 for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jan 2002 09:23:51 +0100 (MET)
Message-ID: <3C3EA0C1.42DDF9E0@admin.france.hp.com>
Date: Fri, 11 Jan 2002 09:22:25 +0100
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] binutils: opcodes and bfd
References: <Pine.LNX.4.21.0201101406030.23934-100000@spawn.hockeyfiend.com>
Content-Type: multipart/mixed;
 boundary="------------4E6C7175319C2D7313BA78E7"
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
--------------4E6C7175319C2D7313BA78E7
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

	Hi
Sorry, but where can I download binutils-dev. It's not on the iso CDs.
And the link on the debian seems broken, there is nothing under this directory !.
ftp://ftp.debian.org/debian/dists/unstable/main/binary-hppa/
On the debian site, I found only package for i386, not for parisc.

"Christopher C. Chimelis" wrote:
> 
> On Thu, 10 Jan 2002, Bruno Vidal wrote:
> 
> > First, thanks for your feedback, now the dump modules is working fine.
> > The system is able to dump. But now I need to modify the tool to retrieve
> > the dump. But I need bfd and opcode: libbfd.a and libopcode.a. It is part
> > of the binutil package. But in the last debian package this two librairies
> > are missing.
> 
> You need the binutils-dev package installed.  It also contains the .so
> symlinks that you may need :-)
> 
> At first, I was stunned to read the above since I personally built the
> binutils debs on the a500 and uploaded them (I'm the maintainer, btw :-P),
> but then realised that you were looking for binutil (no 's') and that's
> why you couldn't find it :-)
> 
> C
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
--------------4E6C7175319C2D7313BA78E7
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
--------------4E6C7175319C2D7313BA78E7--
