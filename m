Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id SAA22887
	for <hppa-linux@sod.res.cmu.edu>; Sat, 13 Mar 1999 18:33:35 -0500
Date: Sat, 13 Mar 1999 15:33:18 -0800 (PST)
From: Jason Eckhardt <jason@equator.com>
Message-Id: <199903132333.PAA19874@gatekeeper.equator.com>
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] Boot #4 and source on ftp site
Cc: jason@gatekeeper.equator.com
List-ID: <linux-parisc.vger.kernel.org>


> > 	So my question is how to place built "ipl" binary at the
> > 	appropriate place on the disk so that PDC finds it. Any magic
> > 	combination of commands ? Looks like I am missing something
> > 	obvious.
> > 
> > 
> > Thanks in advance,
> > 
> > -pkd
>
> You are on the right track.  After lifinit you have to use lifcp to copy
> the file into the newly created LIF volume.  You also have to give it
> the correct file type.  A script I use for creating bootable LIF
> volumes looks something like:
>

  That is one way. The way I do it for our very simple LIF volume is as folows:
  Once you have obtained the SOM ipl binary (after make), then:
   % strip ipl
   % mkipl ipl
   % mklifhdr hdr x y z a b c (see the utility for what these #'s mean)
   % cat hdr pad_file ipl vmlinux > bootstrap.bin

  pad_file is a 1024 byte file full of 0.

  I did forget to put this information into the README, sorry.
  Eventually (next few days, hopefully), there will be one utility "mkimg"
  that will automatically do everything above for you (particularly, picking
  the numbers which have to do with entry points, etc).
 
  Of course, vmlinux doesn't yet exist. I just have a simple dummy kernel
  I use there, which hasn't been included in the distribution. If you
  want to play around without the dummy kernel, just comment out the line
  in ipl_c.c that branches to the kernel and remove "vmlinux" from the
  concat line step above. You can then see the bootstrap run, but it won't
  try to execute the kernel.

  Have fun, Jason.
