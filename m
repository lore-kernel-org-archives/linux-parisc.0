Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id OAA11926
	for <parisc-linux@sod.res.cmu.edu>; Wed, 7 Apr 1999 14:07:22 -0400
Date: Wed, 7 Apr 1999 11:05:39 -0700 (PDT)
From: Jason Eckhardt <jason@equator.com>
Message-Id: <199904071805.LAA22267@gatekeeper.equator.com>
To: kumar@ix.netcom.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Qn on Linux/PA-RISC future Console driver
List-ID: <linux-parisc.vger.kernel.org>


>
> Hi,
> 	Has anyone done some work on Linux/PA-RISC Console driver.
> 	Are we planning to use PDC for console or is it possible
> 	to directly access Console device. 
>

  I believe HP-UX uses the STI ROM interface rather than going
  through the IODC interface (i.e. like the bootstrap), although an HP person
  can tell us positively.
  It doesn't seem we could get very good performance through IODC console calls
  due to the setup involved when calling it from an virtually addressed OS 
  (switching to real mode, etc). Also, I believe that IODC is not re-entrant.
  I don't know if the STI ROM has the same restrictions.
  
  It would be nice to have direct access to the console device (although it
  is more work), but as of
  yet we have no console device-specific documentation (or even the STI ROM
  i/f for that matter).

  Jason.
