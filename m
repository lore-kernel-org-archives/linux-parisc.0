Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id F031C482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  5 Feb 2002 00:56:27 -0700 (MST)
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 432D68CA
	for <parisc-linux@lists.parisc-linux.org>; Tue,  5 Feb 2002 08:56:26 +0100 (MET)
Received: from admin.france.hp.com (ssdpc48.france.hp.com [15.129.234.2]) by hpfrcu03.france.hp.com with ESMTP (8.7.6/8.7.3 SMKit7.02) id IAA08724 for <parisc-linux@lists.parisc-linux.org>; Tue, 5 Feb 2002 08:55:48 +0100 (MET)
Message-ID: <3C5F8F7E.D1956DF0@admin.france.hp.com>
Date: Tue, 05 Feb 2002 08:53:34 +0100
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] dump driver for parisc-linux: patch vs CVS
References: <3C5E768A.573CC5A2@admin.france.hp.com> <20020204174039.DAF3B482A@dsl2.external.hp.com>
Content-Type: multipart/mixed;
 boundary="------------EBA49CEA53F20620879DAC56"
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
--------------EBA49CEA53F20620879DAC56
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

	Hi.
So my work for the next few days will to create a patch
of all my modification for the latest CVS bits (so you will
have only the modifications). But I'll send it to which people ?

Grant Grundler wrote:
> As Randolph noted, we need to see the diff and what was changed
> in the generic kernel. Is the kernel and user space code GPL?

Everything is under GPL, even the code coming from SGI. I leave
all informations about the SGI code and the header of all their files.
But I've modified the code to handle specific needs for p4. I'm
also currently added code to handle multiple dump device. And I've also
the project to dump only kernel space and not user space.

> > I have modified:
> > ./Makefile
> > ./arch/parisc/config.in
> > ./arch/parisc/kernel/traps.c
> > ./arch/parisc/mm/init.c
> > ./drivers/Makefile
> > ./drivers/char/sysrq.c
> > ./init/main.c
> > ./kernel/ksyms.c
> > ./kernel/panic.c
> > ./kernel/sched.c
> 
> The last four might cause trouble....
I know, I can try to put kernel/ksyms.c to arch/parisc/kernel/parisc_ksyms.c
but it can break the code for ia64 and other architecture. but for the other
it is not possible: panic (call to dump), sched.c (another call to dump), 
main.c (init of dump). I've also an IA64 box where I can do test, so I've also
the project to do it working on it (lots of project :-).

> 
> >
> > And I've added:
> > ./include/linux/dump.h
> > ./drivers/dump/Makefile
> > ./drivers/dump/dump_base.c
> > ./drivers/dump/dump_rle.c
> > ./drivers/dump/dump_parisc.c
> 
> and we need to ask 2.4 maintainer if this can be added upstream too...
I defenitly think that it is a really needed feature (I'm working perhaps 
since a too long time in support center :-).

> 
> > So my question:
> > -Do you think it is a good idea to have a dump driver available
> > in the standart kernel ?
> 
> I do. But it's really up to linus/et al to decide that.
> I can choose to commit this code to *our* tree (parisc-linux) only.
> (and that's really not just my decision - need some consensus)

perfectly understand, so, you already have my vote :-)

> 
> > -If yes, who is able to do the code review, and put this dump
> > module in the CVS ?
> 
> Ideally, I'd like to see outstanding non-arch code changes merged
> upstream first..  Otherwise, I don't mind maintaining that code in our tree.
>
My main probleme is to have a up to date code, because I have to follow
each modification and redo the merge each time I want to update my CVS.
I agree that I need to add comments in my code, but before going further
I prefer to know if this code will stay a "patch" or not.
 
> thanks!
> grant
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
--------------EBA49CEA53F20620879DAC56
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
--------------EBA49CEA53F20620879DAC56--
