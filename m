Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.65.60])
	by dsl2.external.hp.com (Postfix) with SMTP id 097B14834
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Mar 2003 13:58:00 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: vincentl@ec-lyon.fr, Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] enumerating devices from user space
Date: Wed, 12 Mar 2003 21:50:50 +0100
Cc: parisc-linux@lists.parisc-linux.org
References: <20030312173235.A4332@typhon.pilat.fr> <20030312164852.GT16414@parcelfarce.linux.theplanet.co.uk> <20030312183000.A4426@typhon.pilat.fr>
In-Reply-To: <20030312183000.A4426@typhon.pilat.fr>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200303122150.50302.deller@gmx.de>
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

Hi,

I think the most intesting thing is the name of the system, which is (untested!) in 
/proc/cpuinfo (should give you "Raven U 240 (9000/780/C240)").

The rest is mostly and often standard serial, parallel, SCSI, pci (pci-utils!), and
some strange GSC cards (which often give you some of the above devices).

Regards,
Helge

On Wednesday 12 March 2003 18:30, Lyonel Vincent wrote:
> many thanks for the prompt answer
>
> well... that's exactly the answer I didn't want to ear ;o)
> lshw can't reasonably assume that /var/log/dmesg exists and is correct (or
> even dmesg) and dig into the trash.
>
> My kernel programming skills are extremely limited (not to say inexistent)
> but how difficult would it be to expose this information to user space
> through /proc? (AFAICT, we already have PA-RISC specific files like
> /proc/bus/runway) A simplistic format like <hwpath>\t<type> <instance>
> <hversion> <sversion> etc. would do.
> Do you think it'd be useful to make that kind of information available to
> user- space? (besides lshw of course ;op) If it's the case I'll try to do
> my best...
>
> cheers,
> lv.
>
> On Wed, Mar 12, 2003 at 04:48:52PM +0000, Matthew Wilcox wrote:
> > On Wed, Mar 12, 2003 at 05:32:36PM +0100, Lyonel Vincent wrote:
> > > I'm currently implementing a small tool called lshw (you can find it on
> > > Freshmeat) that enumerates installed devices on a machine and reports
> > > them as a device tree (text, HTML and XML).
> >
> > That's cool.
> >
> > > For now it knows about DMI, PCI busses, SCSI, IDE and PCMCIA and I
> > > would like to port it to PA-RISC Linux. I already get some very basic
> > > info from /proc/cpuinfo.
> > > Does anyone know how I can access the device tree as seen by the
> > > kernel? (much like HP-UX's ioscan does and what is shown in dmesg)
> >
> > You can look in /var/log/dmesg.  For example...
> >
> > Found devices:
> > 1. U2-IOA BC Runway Port (12) at 0xfff88000 [8], versions 0x580, 0xf, 0xb
> > 2. Dino PCI Bridge (13) at 0xf2000000 [8/0], versions 0x680, 0x0, 0xa, 
> > additional addresses: 0xf2800000 3. Raven U/L2 Dino PS/2 Port (10) at
> > 0xf2001000 [8/1], versions 0x6, 0x0, 0x96 4. Raven U/L2 Dino RS-232 (10)
> > at 0xf2003000 [8/3], versions 0x6, 0x0, 0x8c 5. Raven U/L2 Core FW-SCSI
> > (4) at 0xf200c000 [8/12], versions 0x3b, 0x0, 0x89 6. Raven U/L2 Core BA
> > (11) at 0xffd00000 [8/16], versions 0x3b, 0x0, 0x81,  additional
> > addresses: 0xffd0c000 0xffc00000 7. Raven U/L2 Core Centronics (10) at
> > 0xffd02000 [8/16/0], versions 0x3b, 0x0, 0x74,  additional addresses:
> > 0xffd01000 0xffd03000 8. Raven U/L2 Core Audio (10) at 0xffd04000
> > [8/16/1], versions 0x3b, 0x4, 0x7b 9. Raven U/L2 Core RS-232 (10) at
> > 0xffd05000 [8/16/4], versions 0x3b, 0x0, 0x8c 10. Raven U/L2 Core SCSI
> > (10) at 0xffd06000 [8/16/5], versions 0x3b, 0x0, 0x82 11. Raven U/L2 Core
> > LAN (802.3) (10) at 0xffd07000 [8/16/6], versions 0x3b, 0x0, 0x8a 12.
> > Raven U/L2 Core PS/2 Port (10) at 0xffd08000 [8/16/7], versions 0x3b,
> > 0x0, 0x84 13. Raven U/L2 Core PS/2 Port (10) at 0xffd08100 [8/16/8],
> > versions 0x3b, 0x0, 0x84 14. Raven Backplane Wax BA (11) at 0xffe00000
> > [8/20], versions 0x17, 0x0, 0x8e 15. Raven Backplane Wax HIL (10) at
> > 0xffe01000 [8/20/1], versions 0x17, 0x0, 0x73 16. Raven Backplane RS-232
> > (10) at 0xffe02000 [8/20/2], versions 0x17, 0x0, 0x8c 17. Raven Backplane
> > Wax EISA BA (11) at 0xfc000000 [8/20/5], versions 0x17, 0x0, 0x90, 
> > additional addresses: 0xffc88000 0xfc00000b 18. Gecko GSC Core Graphics
> > (10) at 0xfa000000 [8/24], versions 0x16, 0x0, 0x85,  additional
> > addresses: 0xf0026000 19. U2-IOA BC GSC+ Port (7) at 0xf203f000 [8/63],
> > versions 0x501, 0x1, 0xc 20. U2-IOA BC Runway Port (12) at 0xfff8a000
> > [10], versions 0x580, 0xf, 0xb 21. U2-IOA BC GSC+ Port (7) at 0xf103f000
> > [10/63], versions 0x501, 0x1, 0xc 22. Raven U 240 (9000/780/C240) (0) at
> > 0xfffa0000 [32], versions 0x599, 0x0, 0x4 23. Memory (1) at 0xfffb1000
> > [49], versions 0x6f, 0x0, 0x9
> >
> > The numbers in [] tell you what the tree looks like.  In this example, we
> > have 4 top-level devices: #1, #20, #22 & #23.
> >
> > > I've tried digging in /proc without much success... is there a way to
> > > get this information from user space? PPC Linux exposes the device tree
> > > in /proc for example. A mechanism similar to /proc/bus/pci/devices
> > > (machine- parseable text) would be great, too.
> >
> > In 2.5, this information's available via sysfs.  I don't think we'll
> > expose it in /proc.
> >
> > > PS: I noticed that /proc/iomem lists 00000000-000009ff as "PDC data
> > > (Page Zero)", is there a chance I can find what I need there? (I dd-ed
> > > it from /dev/mem but I can't say if it contains useful data...)
> >
> > No, you need to actually make firmware calls and you can't do that from
> > user mode.
> >
> > --
> > "It's not Hollywood.  War is real, war is primarily not about defeat or
> > victory, it is about death.  I've seen thousands and thousands of dead
> > bodies. Do you think I want to have an academic debate on this subject?"
> > -- Robert Fisk
