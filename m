Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from PHSEXCHICI2.Partners.org (phsexchici2.partners.org [170.223.254.21])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3B77E4830
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Feb 2002 09:39:48 -0700 (MST)
Message-ID: <FE6B88CC9D2BD311AD120008C7B3AF87081ED28D@phsexch3.mgh.harvard.edu>
From: "Roylance, Stephen D." <SROYLANCE@PARTNERS.ORG>
To: 'Grant Grundler' <grundler@dsl2.external.hp.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Getting a D370 off the ground 
Date: Tue, 12 Feb 2002 11:39:40 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

> > Does anyone know if I can switch resolution/video mode from 
> the firmware? 
> 
> Not sure. I'm surprised to hear about a D with gfx in it.

Do you know how to do it on workstation  machines, maybe it works the same
way?
or can anyone point me to HW/tech docs for these machines?

> > I installed the 32-bit kernel, can I use a 64-bit kernel on 
> this machine?
> 
> Depends on cpu type. If it's a PA2.0 CPU (ie PA-8xxx), then yes.
> See /proc/cpuinfo and/or check console output at boot time.
> 
> > Should I checkout the latest kernel source from cvs and 
> build that, or is
> > there some other version, or an image, I shoud use?  The 
> kernel installed
> > with the CD doesn't seem to be SMP.
> 
> Newer kernels are on ftp://ftp.parisc-linux.org/kernels/

OK, looks like I have two PA8000's.  I apt-get upgraded to unstable and
d/l'ed the latest kernel tar.gz.  
I'm getting an error trying to compile a 64 bit SMP kernel:
make[1]: hppa64-linux-gcc: Command not found
on, I guess, the first call to the compiler when I do 'make dep';
my make is:
ii  make                3.79.1-12           The GNU version of the "make"
utility.
my gcc is:
ii  gcc                 3.0.4-2             The GNU C compiler.

Do I need to mess with a makefile so it knows what the right compiler is?
Do I need to get an different version of gcc for 64-bit hppa?

> grant

Thanks!
-Steve
