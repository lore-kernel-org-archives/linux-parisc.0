Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id C12BC482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Jun 2002 02:22:43 -0600 (MDT)
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 1DBA37DB
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Jun 2002 10:22:42 +0200 (METDST)
Received: from admin.france.hp.com (ssdpc48.france.hp.com [15.129.234.2]) by hpfrcu03.france.hp.com with ESMTP (8.7.6/8.7.3 SMKit7.02) id KAA16706 for <parisc-linux@lists.parisc-linux.org>; Fri, 7 Jun 2002 10:21:35 +0200 (METDST)
Message-ID: <3D006C09.164DF254@admin.france.hp.com>
Date: Fri, 07 Jun 2002 10:17:13 +0200
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] strange message with insmod
References: <3CFF72D7.30FA7556@admin.france.hp.com> <1023381362.3cff8f72ec461@webmail.tiscalinet.be>
Content-Type: multipart/mixed;
 boundary="------------FD1B093BF74B3C40166ACD07"
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
--------------FD1B093BF74B3C40166ACD07
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

	Hi
I think I found where the problem is. In order to add debug info
for P4, I've add in the main Makefile: -gdwarf-2. I've remove this
debug option, and now everything is okay. I think that this option is
creating too much debug informations. Does someone has already try
to investiguate a solution in order to add debug information, without
creating soooo much information ?

	Thanks.

Richard Hirst wrote:
> 
> On Thu, Jun 06, 2002 at 04:33:59PM +0200, Bruno Vidal wrote:
> >       Hi
> > I've compiled a new kernel (without LVM), everything seems okay.
> > My dump driver compiled right...but when I use insmod:
> > hpfrcw12:~# insmod dump
> > Using /lib/modules/2.4.18-pa35/kernel/drivers/dump/dump.o
> > r_info 0x29 not handled
> > ...
> > So it is not coming from my modules. The modules are loaded,
> > everything seems okay, but what means this messages ?
> 
> Some relocation type used in your .o files that modutils doesn't know
> how to handle.  Generally modutils only handles the relocation types
> that I have seen in modules to date.  New types might crop up as a
> result of tool chain changes, or different compiler options, or possibly
> kernel code changes might cause the toolchain to generate some other
> relocation.
> 
> Are you using the standard woody toolchain for hppa?  Can you send me
> off list your scsi/st.o, incase I can't reproduce here?
> 
> Everything might seem ok, but it could be some code paths or data
> accesses wont be handled properly.
> 
> Thanks,
>   Richard

-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
--------------FD1B093BF74B3C40166ACD07
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
--------------FD1B093BF74B3C40166ACD07--
