Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7EFEF482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Nov 2001 10:12:29 -0700 (MST)
Message-Id: <200111121707.KAA25028@puffin.external.hp.com>
To: Markus Grabert <xam@student.cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C240: Graphics, 64bit kernel and more 
In-Reply-To: Message from Markus Grabert <xam@student.cs.ucc.ie>
   of "Mon, 12 Nov 2001 15:25:35 GMT." <Pine.OSF.3.96.1011112145357.4562A-100000@student.cs.ucc.ie>
Date: Mon, 12 Nov 2001 10:07:45 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

Markus Grabert wrote:
> Before I actually buy the computer, I wanted to know whether STI
> and/or the framebuffer for a 64bit kernel is working.

I'm sure it's working on 32-bit kernels and you can run 32-bit
kernels on the C240. Unless you have specific reason to run a 64-bit
kernel, I'd reccomend running a 32-bit kernel. Follow the discussion
about C200 since the C240 is *mostly* the same.

> Moreover I've read that UW-SCSI is not working yet.
> So is it working in FAST-SCSI (narrow) mode ?

A500/BCJ-XXXX machines only have UW-SCSI or U2-SCSI.
It works fine.

> Are you aware of any other gcc/binutils bugs or should
> gcc/binutils NOW create proper executables for pa2.0 and
> pa1.1 (including the old CPUs like 730's PCX-S CPU) ?

Yes - should work fine. Note one can build 32-bit PA2.0 binaries.
The scheduling and insns are optimized for PA2.0 CPU but will
run in "narrow" mode.

> does produce gcc rather good optimized code for parisc
> (compared to HP's cc, is there a significant performance difference) ?

Not as good. On avg, acc produces 10-15% faster code and can generate
the object file substantially faster. This is froma talk 1.5 years ago
given at High Performance Computer Users Group in San Jose by the
HP compiler guru on optimizing apps with acc. He was comparing SpecInt
and SpecFP results.

> I can imagine that the Linux/HPPA kernel is not very optimized yet
> (can't compare the speed on my 730 with HP/UX since I don't
> have the OS software anymore ...). Is the speed difference just a
> few percent or can you 'feel' it (mhh, fuzzy question) ?

Some initial tests I've seen so far place performance between almost
equal to as much as 3x slower (measuring SSL transactions). Until
someone gets a profiler working (oprofile?) I won't really be able
to fix this kind of problem. I just don't have time to go trolling
through all the code.

> Can I put in any PC PCI graphic card (as a second graphic card) ?

Yes. But don't expect VGA or anything that requires BIOS to work.
Alan Cox posted how to make VGA/BIOS work here nearly 2 years ago
and I don't think it's been implement by anyone though.

> The same for any PC PCI cards (ethernet, modem, TV, ...) ?

Ditto. Watch out for misaligned accesses and don't expect
anyone to have tried this already.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
