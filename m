Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id LAA32695
	for <hppa-linux@sod.res.cmu.edu>; Mon, 15 Mar 1999 11:54:43 -0500
Date: Mon, 15 Mar 1999 08:54:32 -0800 (PST)
From: Jason Eckhardt <jason@equator.com>
Message-Id: <199903151654.IAA21780@gatekeeper.equator.com>
To: hppa-linux@thepuffingroup.com, kumar@ix.netcom.com
Subject: Re: [hppa-linux] Boot #4 and source on ftp site
Cc: jason@gatekeeper.equator.com
List-ID: <linux-parisc.vger.kernel.org>


>
>
> Also I  forgot to see the boot_utils directory. 
>

 Be sure to peruse every word of the README. There is a lot of information
 in that file that is not included in the source files. It explains
 the boot process, the boot image layout, and other details.

> Any reasons you included libmilli.a in Makefile ? Since I was
> getting bad archive messages I took it out of Makefile. Does not seem
> to affect anything.
>

  I didn't include libmilli.a. Are you sure you have boot_rel_0.2.tar.gz, 
  the newest source code? If libmilli was added, somebody else did it. 
  It may be necessary to explicitly add libmilli when building with the cross
  tools, but I'm using HPUX and gcc 2.8.1 and the millicode is "automatically"
  linked in.
  Remember, boot_rel_0.2.tar.gz is the latest source and you should delete
  any previous source.
  Jason.
