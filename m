Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "Roylance, Stephen D." <SROYLANCE@PARTNERS.ORG>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Getting a D370 off the ground 
In-Reply-To: Message from "Roylance, Stephen D." <SROYLANCE@PARTNERS.ORG>
   of "Mon, 11 Feb 2002 15:14:20 EST." <FE6B88CC9D2BD311AD120008C7B3AF87081ED289@phsexch3.mgh.harvard.edu>
References: <FE6B88CC9D2BD311AD120008C7B3AF87081ED289@phsexch3.mgh.harvard.edu> 
Date: Mon, 11 Feb 2002 22:55:46 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020212055546.74B2D4832@dsl2.external.hp.com>
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

"Roylance, Stephen D." wrote:
> So far so good, but I have a few questions:

So far, well done.

> My video card seems to be a:
> Raven Opt. 2D Graphics (Goat) (10) at 0xf6000000 [10/12], version 0x12, 0x0,
> 0x77
> What can I expect from it?  I've nerver used XF86 version 4 or an fb device,
> and I haven't figured out the new config file format.  Will I be able to use
> the the graphical console with a newer kernel?  Can I get X to use it?

I think so. This is the same gfx built into several of the regular
B/C class workstations.

> Does anyone know if I can switch resolution/video mode from the firmware? 

Not sure. I'm surprised to hear about a D with gfx in it.

> I installed the 32-bit kernel, can I use a 64-bit kernel on this machine?

Depends on cpu type. If it's a PA2.0 CPU (ie PA-8xxx), then yes.
See /proc/cpuinfo and/or check console output at boot time.

> Should I checkout the latest kernel source from cvs and build that, or is
> there some other version, or an image, I shoud use?  The kernel installed
> with the CD doesn't seem to be SMP.

Newer kernels are on ftp://ftp.parisc-linux.org/kernels/

grant
