Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA20195
	for <parisc-linux@puffin.external.hp.com>; Mon, 18 Dec 2000 11:10:16 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 18 Dec 2000 18:13:10 -0000
Received: from ottawa.linuxcare.com (HELO linuxcare.com) (216.208.98.2)
  by smtp.linuxcare.com with SMTP; 18 Dec 2000 18:13:11 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <3A3E544E.FC5B58CB@linuxcare.com>
Date: Mon, 18 Dec 2000 13:15:42 -0500
From: Alex deVries <adevries@linuxcare.com>
MIME-Version: 1.0
To: "M. Grabert" <xam@deathsdoor.com>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] (still) booting problems with HP9000/730
References: <Pine.LNX.4.21.0012172113360.11612-100000@sgate.charlysworld.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

"M. Grabert" wrote:
> The kernel starts booting, but the scsi driver (old Ncr)
> reports some warnings/errors like
> shared memory is not coherent (or so), failed to reset scsi bus,
> irq probe failed etc...
> 
> the scsi driver finally recognizes my Quantum HD and
> tries to boot from it (mount it)..
> There is nothing like VFS: unable to mount blabla;
> instead it runs in to an infinite loop of kernel oops,
> it prints continously kernel stack/register traces
> (seem to look all the same).

I talked to Richard Hirst about this a few hours ago, and it looks like
there's a problem with the SCSI driver.  It's unclear how difficult it
would be to get that going, but it certainly is possible to fix.

You'd probably have more success with the 720/730 if you did nfsroot.

If anyone has a 720 or 730 (or any other machine) with correct or broken
kernel boot logs, I'm collecting them! Those can help developers who
don't have access to all the hardware.

- Alex

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
