Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA23900
	for <parisc-linux@puffin.external.hp.com>; Sun, 10 Dec 2000 23:44:00 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 11 Dec 2000 06:46:28 -0000
Received: from ottawa.linuxcare.com (HELO linuxcare.com) (216.208.98.2)
  by smtp.linuxcare.com with SMTP; 11 Dec 2000 06:46:28 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <3A3478C8.5415E923@linuxcare.com>
Date: Mon, 11 Dec 2000 01:48:40 -0500
From: Alex deVries <adevries@linuxcare.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Harmony driver...
List-ID: <linux-parisc.vger.kernel.org>


I'm committing a driver for the harmony audio chip, found in 712s, 715s,
and I think others.

This driver definitely has problems, among them:
- no /dev/dsp or /dev/mixer support at all, you're stuck with the volume
and 8bit 8khz mono ulaw format
- for a reason I haven't yet figured out, interrupts are never called
the second time around; doing a 'cat sample.au > /dev/audio' works the
first time, and hangs the second.  Resetting on open() doesn't seem to
help.  Need to look into this.
- the code can be a lot cleaner
- I doubt this works with anything other than 4k pages
- recording doesn't work
- the buffer allocation scheme can be done quicker

I do expect to clean these things up within a week.

I can do a 'cat free_software_song.au > /dev/audio' and hear reasonable
sound on my 712/80.  It took me awhile to get the clicks and pops out,
as well as getting the chip to play the 4k frames in the right order.

The driver isn't built by default because of the above problems.  But,
you can enable CONFIG_SOUND_GSC_HARMONY.  I'd appreciate feedback from
people with other machines.

- Alex

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
