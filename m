Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA19351
	for <parisc-linux@puffin.external.hp.com>; Wed, 18 Oct 2000 11:13:31 -0600
Received: from ottawa.linuxcare.com (HELO tarwebok) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 18 Oct 2000 17:14:37 -0000
To: Grant Grundler <grundler@cup.hp.com>
Cc: James Waterhouse <james.waterhouse@videotron.ca>,
        "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] booting on 712/60
References: <200010181654.JAA14222@milano.cup.hp.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 18 Oct 2000 13:04:42 -0400
In-Reply-To: Grant Grundler's message of "Wed, 18 Oct 2000 09:54:05 -0700"
Message-ID: <87r95e13o5.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler <grundler@cup.hp.com> writes:

> James Waterhouse wrote:
> > Hello,
> > 	I just compiled a ramdisk using mondays cvs src for everything. I'm
> > using the graphics console ramdisk file off the puffin.external.hp.com
> > (ramdisk20000530-sticon.tgz) to make the ramdisk. Now when I got to boot
> > it boots up until the point where the kernel says...
> 
> iirc, ramdisk20000530-sticon.tgz uses a "kluge" /dev/tty major/minor number.
> I was reading old mail on this and the kluge to use a different
> major/minor confused me. I was told this was no longer needed.
> So you can use a newer/regular ramdisk.

Ah!  Actually that triggers my memory.  You *must* append
'console=tty' to the kernel command line in order to use sticon (or
probably fbcon too for that matter), or else it will default to
serial.

Usually the PALO makefile handles this for you though.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
