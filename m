Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id OAA26566
	for <hppa-linux@sod.res.cmu.edu>; Thu, 25 Mar 1999 14:57:00 -0500
Date: Thu, 25 Mar 1999 11:56:45 -0800 (PST)
From: Jason Eckhardt <jason@equator.com>
Message-Id: <199903251956.LAA23724@gatekeeper.equator.com>
To: mickey@openbsd.org
Subject: Re: [hppa-linux] Document Priority?
Cc: hppa-linux@thepuffingroup.com
List-ID: <linux-parisc.vger.kernel.org>


>
> hi
> looking at the released pdc/iodc docs i'm wondering what is in the missing
> chapters? is it possible to release the whole contents table?
> what are the plans for the rest of the book(s) ?
> and, is there any plan for "pa-risc IO architecture" release any soon?

  The PDC/IODC docs posted are actually a subset of the chapters of the
  PA-RISC I/O architecture doc. The first 8 or so chapters of the I/O
  doc contain specific information about the various "Module" types (such
  as processor modules, memory modules, I/O modules, bus converters, etc).
  The last 4-5 chapters and appendices are the same as the PDC/IODC docs we
  have.

  I'm not sure why we were given only the subset (which pertains only to
  the firmware) but I believe we can get a decent start with it. Eventually,
  we will need the other information if we intend to have working device
  drivers, etc. Of course, we can trudge through MkLinux code to figure some of
  it out, but I'd much prefer the doc.

  Jason.
