Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12502.mail.yahoo.com (web12502.mail.yahoo.com [216.136.173.194])
	by dsl2.external.hp.com (Postfix) with SMTP id 90F894834
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Mar 2003 01:23:03 -0700 (MST)
Message-ID: <20030313082302.19126.qmail@web12502.mail.yahoo.com>
Date: Thu, 13 Mar 2003 00:23:02 -0800 (PST)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] enumerating devices from user space
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030312233651.74216d8f.vincentl@ec-lyon.fr>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-960209626-1047543782=:19054"
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

--0-960209626-1047543782=:19054
Content-Type: text/plain; charset=us-ascii


Being as I just got done with a class from HP Education on Linux, this very issue was brought up by all of us HP-UX guys.  We love our IOSCAN.  The instructor told us that someone within HP actually wrote an "ioscan" for Red Hat.  I'm thinking that getting a copy of that source code would be a good place to start.  I'm going to do a search for the guy tomorrow or get his name from our instructor to see if I can get a hold of his code.
derek
 Lyonel Vincent <vincentl@ec-lyon.fr> wrote:Hello Helge,

The goal is precisely that: *accurately* report installed hardware
(including the "standard" stuff) and how it's connected in a *unified*
way, without having to use dozens of inconsistent tools (pci-utils,
lsusb, sg-utils, cat, grep, black magic, etc.).
A good example of this being HP-UX's ioscan. DMI-aware PCs also have a
similar feature.

SCSI, PCI etc. are already enumerated platform-independently (without
needing pci-utils nor sg-utils, only pci.ids) but they currently seem to
come "out of the void" as the underlying hardware (LASI, various GSC
bridges, etc) is not enumerated.
Concerning the obvious /proc/cpuinfo, its info is reported too (on
PA-RISC, x86, IA-64, PowerPC and Alpha).

In short, that's why I'd like to access ioscan-like data under PA-RISC
Linux from user space.

cheers,
lv.

On Wed, 12 Mar 2003 21:50:50 +0100
Helge Deller wrote:

> Hi,
> 
> I think the most intesting thing is the name of the system, which is
> (untested!) in /proc/cpuinfo (should give you "Raven U 240
> (9000/780/C240)").
> 
> The rest is mostly and often standard serial, parallel, SCSI, pci
> (pci-utils!), and some strange GSC cards (which often give you some of
> the above devices).
> 
> Regards,
> Helge
> 
> On Wednesday 12 March 2003 18:30, Lyonel Vincent wrote:
> > many thanks for the prompt answer
> >
> > well... that's exactly the answer I didn't want to ear ;o)
> > lshw can't reasonably assume that /var/log/dmesg exists and is
> > correct (or even dmesg) and dig into the trash.
> >
> > My kernel programming skills are extremely limited (not to say
> > inexistent) but how difficult would it be to expose this information
> > to user space through /proc? (AFAICT, we already have PA-RISC
> > specific files like/proc/bus/runway) A simplistic format like
> > \t etc. would do.
> > Do you think it'd be useful to make that kind of information
> > available to user- space? (besides lshw of course ;op) If it's the
> > case I'll try to do my best...
> >
> > cheers,
> > lv.
> >
> > On Wed, Mar 12, 2003 at 04:48:52PM +0000, Matthew Wilcox wrote:
> > > On Wed, Mar 12, 2003 at 05:32:36PM +0100, Lyonel Vincent wrote:
> > > > I'm currently implementing a small tool called lshw (you can
> > > > find it on Freshmeat) that enumerates installed devices on a
> > > > machine and reports them as a device tree (text, HTML and XML).
> > >
> > > That's cool.
> > >
> > > > For now it knows about DMI, PCI busses, SCSI, IDE and PCMCIA and
> > > > I would like to port it to PA-RISC Linux. I already get some
> > > > very basic info from /proc/cpuinfo.
> > > > Does anyone know how I can access the device tree as seen by the
> > > > kernel? (much like HP-UX's ioscan does and what is shown in
> > > > dmesg)
> > >
> > > You can look in /var/log/dmesg. For example...
> > >
> > > Found devices:
> > > 1. U2-IOA BC Runway Port (12) at 0xfff88000 [8], versions 0x580,
> > > 0xf, 0xb 2. Dino PCI Bridge (13) at 0xf2000000 [8/0], versions
> > > 0x680, 0x0, 0xa, additional addresses: 0xf2800000 3. Raven U/L2
> > > Dino PS/2 Port (10) at 0xf2001000 [8/1], versions 0x6, 0x0, 0x96
> > > 4. Raven U/L2 Dino RS-232 (10) at 0xf2003000 [8/3], versions 0x6,
> > > 0x0, 0x8c 5. Raven U/L2 Core FW-SCSI(4) at 0xf200c000 [8/12],
> > > versions 0x3b, 0x0, 0x89 6. Raven U/L2 Core BA(11) at 0xffd00000
> > > [8/16], versions 0x3b, 0x0, 0x81, additional addresses:
> > > 0xffd0c000 0xffc00000 7. Raven U/L2 Core Centronics (10) at
> > > 0xffd02000 [8/16/0], versions 0x3b, 0x0, 0x74, additional
> > > addresses: 0xffd01000 0xffd03000 8. Raven U/L2 Core Audio (10) at
> > > 0xffd04000[8/16/1], versions 0x3b, 0x4, 0x7b 9. Raven U/L2 Core
> > > RS-232 (10) at 0xffd05000 [8/16/4], versions 0x3b, 0x0, 0x8c 10.
> > > Raven U/L2 Core SCSI(10) at 0xffd06000 [8/16/5], versions 0x3b,
> > > 0x0, 0x82 11. Raven U/L2 Core LAN (802.3) (10) at 0xffd07000
> > > [8/16/6], versions 0x3b, 0x0, 0x8a 12. Raven U/L2 Core PS/2 Port
> > > (10) at 0xffd08000 [8/16/7], versions 0x3b, 0x0, 0x84 13. Raven
> > > U/L2 Core PS/2 Port (10) at 0xffd08100 [8/16/8], versions 0x3b,
> > > 0x0, 0x84 14. Raven Backplane Wax BA (11) at 0xffe00000[8/20],
> > > versions 0x17, 0x0, 0x8e 15. Raven Backplane Wax HIL (10) at
> > > 0xffe01000 [8/20/1], versions 0x17, 0x0, 0x73 16. Raven Backplane
> > > RS-232(10) at 0xffe02000 [8/20/2], versions 0x17, 0x0, 0x8c 17.
> > > Raven Backplane Wax EISA BA (11) at 0xfc000000 [8/20/5], versions
> > > 0x17, 0x0, 0x90, additional addresses: 0xffc88000 0xfc00000b 18.
> > > Gecko GSC Core Graphics(10) at 0xfa000000 [8/24], versions 0x16,
> > > 0x0, 0x85, additional addresses: 0xf0026000 19. U2-IOA BC GSC+
> > > Port (7) at 0xf203f000 [8/63], versions 0x501, 0x1, 0xc 20. U2-IOA
> > > BC Runway Port (12) at 0xfff8a000[10], versions 0x580, 0xf, 0xb
> > > 21. U2-IOA BC GSC+ Port (7) at 0xf103f000[10/63], versions 0x501,
> > > 0x1, 0xc 22. Raven U 240 (9000/780/C240) (0) at 0xfffa0000 [32],
> > > versions 0x599, 0x0, 0x4 23. Memory (1) at 0xfffb1000[49],
> > > versions 0x6f, 0x0, 0x9
> > >
> > > The numbers in [] tell you what the tree looks like. In this
> > > example, we have 4 top-level devices: #1, #20, #22 & #23.
> > >
> > > > I've tried digging in /proc without much success... is there a
> > > > way to get this information from user space? PPC Linux exposes
> > > > the device tree in /proc for example. A mechanism similar to
> > > > /proc/bus/pci/devices(machine- parseable text) would be great,
> > > > too.
> > >
> > > In 2.5, this information's available via sysfs. I don't think
> > > we'll expose it in /proc.
> > >
> > > > PS: I noticed that /proc/iomem lists 00000000-000009ff as "PDC
> > > > data(Page Zero)", is there a chance I can find what I need
> > > > there? (I dd-ed it from /dev/mem but I can't say if it contains
> > > > useful data...)
> > >
> > > No, you need to actually make firmware calls and you can't do that
> > > from user mode.
> > >
> > > --
> > > "It's not Hollywood. War is real, war is primarily not about
> > > defeat or victory, it is about death. I've seen thousands and
> > > thousands of dead bodies. Do you think I want to have an academic
> > > debate on this subject?"-- Robert Fisk
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


---------------------------------
Do you Yahoo!?
Yahoo! Web Hosting - establish your business online
--0-960209626-1047543782=:19054
Content-Type: text/html; charset=us-ascii

<P>Being as I just got done with a class from HP Education on Linux, this very issue was brought up by all of us HP-UX guys.&nbsp; We love our IOSCAN.&nbsp; The instructor told us that someone within HP actually wrote an "ioscan" for Red Hat.&nbsp; I'm thinking that getting a copy of that source code would be a good place to start.&nbsp; I'm going to do a search for the guy tomorrow or get his name from our instructor to see if I can get a hold of his code.
<P>derek
<P>&nbsp;<B><I>Lyonel Vincent &lt;vincentl@ec-lyon.fr&gt;</I></B> wrote:
<BLOCKQUOTE style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px">Hello Helge,<BR><BR>The goal is precisely that: *accurately* report installed hardware<BR>(including the "standard" stuff) and how it's connected in a *unified*<BR>way, without having to use dozens of inconsistent tools (pci-utils,<BR>lsusb, sg-utils, cat, grep, black magic, etc.).<BR>A good example of this being HP-UX's ioscan. DMI-aware PCs also have a<BR>similar feature.<BR><BR>SCSI, PCI etc. are already enumerated platform-independently (without<BR>needing pci-utils nor sg-utils, only pci.ids) but they currently seem to<BR>come "out of the void" as the underlying hardware (LASI, various GSC<BR>bridges, etc) is not enumerated.<BR>Concerning the obvious /proc/cpuinfo, its info is reported too (on<BR>PA-RISC, x86, IA-64, PowerPC and Alpha).<BR><BR>In short, that's why I'd like to access ioscan-like data under PA-RISC<BR>Linux from user space.<BR><BR>cheers,<BR>lv.<BR><BR>On Wed, 12 Mar 2003 21:50:50 +0100<BR>Helge Deller <DELLER@GMX.DE>wrote:<BR><BR>&gt; Hi,<BR>&gt; <BR>&gt; I think the most intesting thing is the name of the system, which is<BR>&gt; (untested!) in /proc/cpuinfo (should give you "Raven U 240<BR>&gt; (9000/780/C240)").<BR>&gt; <BR>&gt; The rest is mostly and often standard serial, parallel, SCSI, pci<BR>&gt; (pci-utils!), and some strange GSC cards (which often give you some of<BR>&gt; the above devices).<BR>&gt; <BR>&gt; Regards,<BR>&gt; Helge<BR>&gt; <BR>&gt; On Wednesday 12 March 2003 18:30, Lyonel Vincent wrote:<BR>&gt; &gt; many thanks for the prompt answer<BR>&gt; &gt;<BR>&gt; &gt; well... that's exactly the answer I didn't want to ear ;o)<BR>&gt; &gt; lshw can't reasonably assume that /var/log/dmesg exists and is<BR>&gt; &gt; correct (or even dmesg) and dig into the trash.<BR>&gt; &gt;<BR>&gt; &gt; My kernel programming skills are extremely limited (not to say<BR>&gt; &gt; inexistent) but how difficult would it be to expose this information<BR>&gt; &gt; to user space through /proc? (AFAICT, we already have PA-RISC<BR>&gt; &gt; specific files like/proc/bus/runway) A simplistic format like<BR>&gt; &gt; <HWPATH>\t<TYPE> <INSTANCE><HVERSION><SVERSION>etc. would do.<BR>&gt; &gt; Do you think it'd be useful to make that kind of information<BR>&gt; &gt; available to user- space? (besides lshw of course ;op) If it's the<BR>&gt; &gt; case I'll try to do my best...<BR>&gt; &gt;<BR>&gt; &gt; cheers,<BR>&gt; &gt; lv.<BR>&gt; &gt;<BR>&gt; &gt; On Wed, Mar 12, 2003 at 04:48:52PM +0000, Matthew Wilcox wrote:<BR>&gt; &gt; &gt; On Wed, Mar 12, 2003 at 05:32:36PM +0100, Lyonel Vincent wrote:<BR>&gt; &gt; &gt; &gt; I'm currently implementing a small tool called lshw (you can<BR>&gt; &gt; &gt; &gt; find it on Freshmeat) that enumerates installed devices on a<BR>&gt; &gt; &gt; &gt; machine and reports them as a device tree (text, HTML and XML).<BR>&gt; &gt; &gt;<BR>&gt; &gt; &gt; That's cool.<BR>&gt; &gt; &gt;<BR>&gt; &gt; &gt; &gt; For now it knows about DMI, PCI busses, SCSI, IDE and PCMCIA and<BR>&gt; &gt; &gt; &gt; I would like to port it to PA-RISC Linux. I already get some<BR>&gt; &gt; &gt; &gt; very basic info from /proc/cpuinfo.<BR>&gt; &gt; &gt; &gt; Does anyone know how I can access the device tree as seen by the<BR>&gt; &gt; &gt; &gt; kernel? (much like HP-UX's ioscan does and what is shown in<BR>&gt; &gt; &gt; &gt; dmesg)<BR>&gt; &gt; &gt;<BR>&gt; &gt; &gt; You can look in /var/log/dmesg. For example...<BR>&gt; &gt; &gt;<BR>&gt; &gt; &gt; Found devices:<BR>&gt; &gt; &gt; 1. U2-IOA BC Runway Port (12) at 0xfff88000 [8], versions 0x580,<BR>&gt; &gt; &gt; 0xf, 0xb 2. Dino PCI Bridge (13) at 0xf2000000 [8/0], versions<BR>&gt; &gt; &gt; 0x680, 0x0, 0xa, additional addresses: 0xf2800000 3. Raven U/L2<BR>&gt; &gt; &gt; Dino PS/2 Port (10) at 0xf2001000 [8/1], versions 0x6, 0x0, 0x96<BR>&gt; &gt; &gt; 4. Raven U/L2 Dino RS-232 (10) at 0xf2003000 [8/3], versions 0x6,<BR>&gt; &gt; &gt; 0x0, 0x8c 5. Raven U/L2 Core FW-SCSI(4) at 0xf200c000 [8/12],<BR>&gt; &gt; &gt; versions 0x3b, 0x0, 0x89 6. Raven U/L2 Core BA(11) at 0xffd00000<BR>&gt; &gt; &gt; [8/16], versions 0x3b, 0x0, 0x81, additional addresses:<BR>&gt; &gt; &gt; 0xffd0c000 0xffc00000 7. Raven U/L2 Core Centronics (10) at<BR>&gt; &gt; &gt; 0xffd02000 [8/16/0], versions 0x3b, 0x0, 0x74, additional<BR>&gt; &gt; &gt; addresses: 0xffd01000 0xffd03000 8. Raven U/L2 Core Audio (10) at<BR>&gt; &gt; &gt; 0xffd04000[8/16/1], versions 0x3b, 0x4, 0x7b 9. Raven U/L2 Core<BR>&gt; &gt; &gt; RS-232 (10) at 0xffd05000 [8/16/4], versions 0x3b, 0x0, 0x8c 10.<BR>&gt; &gt; &gt; Raven U/L2 Core SCSI(10) at 0xffd06000 [8/16/5], versions 0x3b,<BR>&gt; &gt; &gt; 0x0, 0x82 11. Raven U/L2 Core LAN (802.3) (10) at 0xffd07000<BR>&gt; &gt; &gt; [8/16/6], versions 0x3b, 0x0, 0x8a 12. Raven U/L2 Core PS/2 Port<BR>&gt; &gt; &gt; (10) at 0xffd08000 [8/16/7], versions 0x3b, 0x0, 0x84 13. Raven<BR>&gt; &gt; &gt; U/L2 Core PS/2 Port (10) at 0xffd08100 [8/16/8], versions 0x3b,<BR>&gt; &gt; &gt; 0x0, 0x84 14. Raven Backplane Wax BA (11) at 0xffe00000[8/20],<BR>&gt; &gt; &gt; versions 0x17, 0x0, 0x8e 15. Raven Backplane Wax HIL (10) at<BR>&gt; &gt; &gt; 0xffe01000 [8/20/1], versions 0x17, 0x0, 0x73 16. Raven Backplane<BR>&gt; &gt; &gt; RS-232(10) at 0xffe02000 [8/20/2], versions 0x17, 0x0, 0x8c 17.<BR>&gt; &gt; &gt; Raven Backplane Wax EISA BA (11) at 0xfc000000 [8/20/5], versions<BR>&gt; &gt; &gt; 0x17, 0x0, 0x90, additional addresses: 0xffc88000 0xfc00000b 18.<BR>&gt; &gt; &gt; Gecko GSC Core Graphics(10) at 0xfa000000 [8/24], versions 0x16,<BR>&gt; &gt; &gt; 0x0, 0x85, additional addresses: 0xf0026000 19. U2-IOA BC GSC+<BR>&gt; &gt; &gt; Port (7) at 0xf203f000 [8/63], versions 0x501, 0x1, 0xc 20. U2-IOA<BR>&gt; &gt; &gt; BC Runway Port (12) at 0xfff8a000[10], versions 0x580, 0xf, 0xb<BR>&gt; &gt; &gt; 21. U2-IOA BC GSC+ Port (7) at 0xf103f000[10/63], versions 0x501,<BR>&gt; &gt; &gt; 0x1, 0xc 22. Raven U 240 (9000/780/C240) (0) at 0xfffa0000 [32],<BR>&gt; &gt; &gt; versions 0x599, 0x0, 0x4 23. Memory (1) at 0xfffb1000[49],<BR>&gt; &gt; &gt; versions 0x6f, 0x0, 0x9<BR>&gt; &gt; &gt;<BR>&gt; &gt; &gt; The numbers in [] tell you what the tree looks like. In this<BR>&gt; &gt; &gt; example, we have 4 top-level devices: #1, #20, #22 &amp; #23.<BR>&gt; &gt; &gt;<BR>&gt; &gt; &gt; &gt; I've tried digging in /proc without much success... is there a<BR>&gt; &gt; &gt; &gt; way to get this information from user space? PPC Linux exposes<BR>&gt; &gt; &gt; &gt; the device tree in /proc for example. A mechanism similar to<BR>&gt; &gt; &gt; &gt; /proc/bus/pci/devices(machine- parseable text) would be great,<BR>&gt; &gt; &gt; &gt; too.<BR>&gt; &gt; &gt;<BR>&gt; &gt; &gt; In 2.5, this information's available via sysfs. I don't think<BR>&gt; &gt; &gt; we'll expose it in /proc.<BR>&gt; &gt; &gt;<BR>&gt; &gt; &gt; &gt; PS: I noticed that /proc/iomem lists 00000000-000009ff as "PDC<BR>&gt; &gt; &gt; &gt; data(Page Zero)", is there a chance I can find what I need<BR>&gt; &gt; &gt; &gt; there? (I dd-ed it from /dev/mem but I can't say if it contains<BR>&gt; &gt; &gt; &gt; useful data...)<BR>&gt; &gt; &gt;<BR>&gt; &gt; &gt; No, you need to actually make firmware calls and you can't do that<BR>&gt; &gt; &gt; from user mode.<BR>&gt; &gt; &gt;<BR>&gt; &gt; &gt; --<BR>&gt; &gt; &gt; "It's not Hollywood. War is real, war is primarily not about<BR>&gt; &gt; &gt; defeat or victory, it is about death. I've seen thousands and<BR>&gt; &gt; &gt; thousands of dead bodies. Do you think I want to have an academic<BR>&gt; &gt; &gt; debate on this subject?"-- Robert Fisk<BR>&gt; <BR>_______________________________________________<BR>parisc-linux mailing list<BR>parisc-linux@lists.parisc-linux.org<BR>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux</BLOCKQUOTE><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://webhosting.yahoo.com/ps/wh3/prod/">Yahoo! Web Hosting</a> - establish your business online
--0-960209626-1047543782=:19054--
