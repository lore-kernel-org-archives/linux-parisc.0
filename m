Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailout08.sul.t-online.com (mailout08.sul.t-online.com [194.25.134.20])
	by dsl2.external.hp.com (Postfix) with ESMTP id CFB12483A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 20 Jul 2002 04:07:37 -0600 (MDT)
Content-Type: text/plain; charset=iso-8859-15
Date: Sat, 20 Jul 2002 11:53:20 +0200
From: Juergen Braukmann <juergen.braukmann@ruhr-west.de>
Message-ID: <3D393310.D3AB411A@ruhr-west.de>
MIME-Version: 1.0
References: <3D383969.1657EF43@ruhr-west.de> <1027121658.16562.3.camel@beavis>
Subject: Re: [parisc-linux] C110, kernel Panics, still more tears ;-(
To: Ryan Bradetich <rbradetich@uswest.net>,
	parisc list <parisc-linux@lists.parisc-linux.org>
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

Ryan Bradetich schrieb:
> 
> Juergen,
> 
> How much memory does this system have?  Also what cards do you have in
> which slot. (Please also specify PCI or GSC).
> 
> What this driver does is allocates a certian portion of memory at
> startup time for a TLB mapping.  Adjusting the ccio_mem_ratio affects
> how much memory is allocated at boot.  The U2/UTurn chip has 2 iommus,
> and the different GSC/PCI slots fall under specific iommus.  If you
> system does not have much memory, and the cards are positioned
> approparately, we could turn off the iommu memory allocatation for the
> second iommu (the /10 bus).
> 
> this is just a thought ... will see what we can do with your
> configuration :)
> 
> Thanks,
> 
> -  Ryan
> 

Hello Ryan,

I dreaded that question. ;-) This is a rescue-workststion that would
have been dumped otherwise. I have only 64 MB RAM. There are two modules
32 MB each, straigt in front of the ventilator (it used to be more, but
they took some 128 MB off). Is there some relevant placing of the
modules? In total, there are 8 memory slots. Processor in front, it is
J1-J2-J3-J4, space J5-J6-J7-J8. My modules are placed in slot 6 and 8.
(If you look at them from the other side, they are numbered 0A, 2A, 0B,
2B, space 1A, 3A, 1B, 3B. I use slots 0A and 0B, that should be fine)
I've seen that memory prices are to expensive to buy some more, since
this box is more a toy. (US$ 250 for 256MB)
Speaking about card slots, I don't know what PSC slots are, so I rather
describe things in my box:
mainbord plugs into some uprigt thing were other cards can plug in. From
the other side another board with SCSI Controler, RTC, I/O-stuff and
audio plugs in. (the "cmos" battery is there and so are the other
connectors on the back).
On the "upright thing" are 4 slots, that look like ISA/EISA and have
another connector in line with the EISA slot about 2" apart. (Suppose
that is meant with PSC. Reminds me a bit to the extension slot that VLB
had, thogh it is a different connector)
But only 3 slots are EISA, the fourth is only the "extension".
Slot 3 carries the video/framebuffer card. In the above terms it's PSC.
Apart from two ventilarors and plenty of dust that describes the content
of my box. The SCSI bus connects to my HP2490A disc, I disconnected the
two Ultra (or whatever) SCSI drive with HP-UX.
CD-ROM is both antique double speed and external.

Juergen

-- 
===========================================     __   _
Juergen Braukmann juergen.braukmann@gmx.de| -o)/ /  (_)__  __ ____  __
Tel: 0201-743648  dk4jb@db0qs.#nrw.deu.eu | /\\ /__/ / _ \/ // /\ \/ /
===========================================_\_v __/_/_//_/\_,_/ /_/\_\
