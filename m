Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id D3EAB482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 Jan 2002 02:24:06 -0700 (MST)
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 74168B0A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 Jan 2002 10:24:01 +0100 (MET)
Received: from admin.france.hp.com (ssdpc48.france.hp.com [15.129.234.2]) by hpfrcu03.france.hp.com with ESMTP (8.7.6/8.7.3 SMKit7.02) id KAA10286 for <parisc-linux@lists.parisc-linux.org>; Tue, 22 Jan 2002 10:23:27 +0100 (MET)
Message-ID: <3C4D2EFB.F82671C2@admin.france.hp.com>
Date: Tue, 22 Jan 2002 10:20:59 +0100
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] vmlinux header for savecrash.
References: <3C4C53B7.67DA24E@admin.france.hp.com> <20020121202539.994A5482A@dsl2.external.hp.com>
Content-Type: multipart/mixed;
 boundary="------------5490FC84E99E01E2CB93F34F"
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
--------------5490FC84E99E01E2CB93F34F
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

	Sorry, but on my system, fgrep gives nothing
(and by using strings, I found nothing also). And I
can't use dmesg buffer, because by definition it is a buffer,
so after running sometime, the palo boot strings is not
in the buffer anymore. Some new ideas ?

	Thanks.

Grant Grundler wrote:
> 
> Bruno Vidal wrote:
> > As I said few days ago, I've a dump driver ready.
> > Now I'm working on a savecrash command. It works fine
> > for the dump, but I need to save with the dump some
> > informations like the running kernel at dump time.
> 
> Bruno - this is great!
> 
> > So in the dump I've got this informations:
> > utsname_release and utsname_version. Now, how can
> > I found the right kernel in /boot ? In other
> > word, how can I retrieve utsname informations in a
> > binary file (without system.map and gdb) ?
> 
> A couple of ideas/hacks:
> o assume it's /boot/System.map + /boot/vmlinux. Tell people if they
>   want to use dump/savecrash, that's what they have to do.
> 
> o assume it's in /boot. Use fgrep to find the matching strings.
>   Something like
>         #!/bin/sh
>         cd /boot
>         for i in *
>         do
>                 fgrep $1 $i > /dev/null 2>&1
>                 if [ $? -eq 0 ]
>                 then
>                         echo $i
>                         exit 0
>                 fi
>         done
>         exit 1
> 
> The case that /boot might not be mounted could cause problems.
> 
> Since klogd seems to want System.map, perhaps savecrash could use
> the same heuristics to find the "right" System.map.
> See Documentation/oops-tracing.txt for more details.
> 
> hth,
> grant

-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
--------------5490FC84E99E01E2CB93F34F
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
--------------5490FC84E99E01E2CB93F34F--
