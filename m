Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id OAA20575
	for <hppa-linux@sod.res.cmu.edu>; Fri, 26 Mar 1999 14:21:22 -0500
Received: (from jason@localhost)
	by gatekeeper.equator.com (8.9.1a/8.9.1) id LAA22256
	for hppa-linux@thepuffingroup.com; Fri, 26 Mar 1999 11:21:14 -0800 (PST)
Date: Fri, 26 Mar 1999 11:21:14 -0800 (PST)
From: Jason Eckhardt <jason@equator.com>
Message-Id: <199903261921.LAA22256@gatekeeper.equator.com>
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] Linker scripts and the boot loader
List-ID: <linux-parisc.vger.kernel.org>


>
> Okay.  How does the boot loader work with loading the kernel?  I recall
> Jason saying something about the boot loader knowing how to load binaries.
>

  Currently, the bootloader assumes that the kernel is position independent
  and either straight binary or SOM (packed with ld -N). By "straight" binary
  I mean only the code and no headers, etc.
  I think HockeyPUX is linked at a certain address and is not position
  independent. I'm not sure why being inflexible like this is a win, but if
  necessary we could do the same.

  Also, since the loader assumes a binary image, the ELF image we produce
  will need to be massaged (same as x86 linux kernel, at least at one time).
  This was done because its simple to just read one record after the other
  into memory and execute.
  Alternatively, more code could be added to "understand" ELF. I prefer to
  keep the bootloader simple...it is just a bootloader after all.

  The simple dummy kernel you saw in the bootstrap tests is just a position
  independent binary loaded straight from the LIF and executed.

  Jason.
