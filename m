Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id BAA08951
	for <hppa-linux@sod.res.cmu.edu>; Sat, 13 Mar 1999 01:47:26 -0500
Received: from srmail.sr.hp.com (srmail.sr.hp.com [15.4.45.14])
	by atlrel2.hp.com (8.8.6 (PHNE_14041)/8.8.5tis) with ESMTP id BAA06597
	for <hppa-linux@thepuffingroup.com>; Sat, 13 Mar 1999 01:47:11 -0500 (EST)
Received: (from billk@localhost) by meow.sr.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0) id WAA21078 for hppa-linux@thepuffingroup.com; Fri, 12 Mar 1999 22:46:37 -0800 (PST)
Message-Id: <199903130646.WAA21078@meow.sr.hp.com>
Subject: Re: [hppa-linux] Boot #4 and source on ftp site
In-Reply-To: <Pine.LNX.3.96.990312211042.208B-100000@quark.ix.netcom.com> from Kumar at "Mar 12, 1999  9:21:36 pm"
To: hppa-linux@thepuffingroup.com
Date: Fri, 12 Mar 1999 22:46:37 -0800 (PST)
From: Bill Katz <billk@sr.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 	
> 	I  compiled without libmilli.a and it did compile.
> 	File ipl_s.s says 
> 	The object code is converted to LIF (logical interchange format)
> 	and then at the beginning of the boot media.
> 
> 	So how do I convert the binary "ipl" to LIF. I tried "lifinit"
> 	and "mkboot" combination. But no luck, I keep getting 
> 	
> 	"Bad IPL size" and "Error reading IPL" error messages. 
> 
> 	I tried "dd" also on the raw disk. No luck with that either.
> 
> 	So my question is how to place built "ipl" binary at the
> 	appropriate place on the disk so that PDC finds it. Any magic
> 	combination of commands ? Looks like I am missing something
> 	obvious.
> 
> 
> Thanks in advance,
> 
> -pkd

You are on the right track.  After lifinit you have to use lifcp to copy
the file into the newly created LIF volume.  You also have to give it
the correct file type.  A script I use for creating bootable LIF
volumes looks something like:

#! /bin/ksh -x
LIF_FILE=uxbootlf
/bin/rm -f $LIF_FILE

lifinit `./iplopt ISL` -v8000000 -d32 -nL2DIAG -K2 -s4096 $LIF_FILE

lifcp -r -T-12800  -K2 ISL             $LIF_FILE:ISL
lifcp -r -T-12289  -K2 AUTO            $LIF_FILE:AUTO
lifcp -r -T-12928  -K2 HPUX            $LIF_FILE:HPUX

	-Bill
