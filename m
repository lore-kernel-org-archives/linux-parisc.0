Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id XAA27711
	for <hppa-linux@sod.res.cmu.edu>; Sat, 13 Mar 1999 23:43:00 -0500
Date: Sat, 13 Mar 1999 20:43:46 -0800 (PST)
From: Kumar <kumar@ix.netcom.com>
To: hppa-linux@thepuffingroup.com
cc: jason@gatekeeper.equator.com
Subject: Re: [hppa-linux] Boot #4 and source on ftp site
In-Reply-To: <199903132333.PAA19874@gatekeeper.equator.com>
Message-ID: <Pine.LNX.3.96.990313203017.158B-100000@quark.ix.netcom.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>



OK, in the spirit of Linux tradition, I was able to hack it
to finally work. After doing couple of hex dumps of given
bootstrap.bin :-) and realizing what was I doing wrong.

Also I  forgot to see the boot_utils directory. 

So it also works on a B class 180. All that we need now is a Vmlinux.

Your answer explains why I am not seeing the moving cursor.
I Did not add a dummy kernel to image.
 
Any reasons you included libmilli.a in Makefile ? Since I was
getting bad archive messages I took it out of Makefile. Does not seem
to affect anything.

Keep up the good work. 

Cheers,
						pkd		
		

On Sat, 13 Mar 1999, Jason Eckhardt wrote:

> 
> > > 	So my question is how to place built "ipl" binary at the
> > > 	appropriate place on the disk so that PDC finds it. Any magic
> > > 	combination of commands ? Looks like I am missing something
> > > 	obvious.
> > > 
> > > 
> > > Thanks in advance,
> > > 
> > > -pkd
> >
> > You are on the right track.  After lifinit you have to use lifcp to copy
> > the file into the newly created LIF volume.  You also have to give it
> > the correct file type.  A script I use for creating bootable LIF
> > volumes looks something like:
> >
> 
>   That is one way. The way I do it for our very simple LIF volume is as folows:
>   Once you have obtained the SOM ipl binary (after make), then:
>    % strip ipl
>    % mkipl ipl
>    % mklifhdr hdr x y z a b c (see the utility for what these #'s mean)
>    % cat hdr pad_file ipl vmlinux > bootstrap.bin
> 
>   pad_file is a 1024 byte file full of 0.
> 
>   I did forget to put this information into the README, sorry.
>   Eventually (next few days, hopefully), there will be one utility "mkimg"
>   that will automatically do everything above for you (particularly, picking
>   the numbers which have to do with entry points, etc).
>  
>   Of course, vmlinux doesn't yet exist. I just have a simple dummy kernel
>   I use there, which hasn't been included in the distribution. If you
>   want to play around without the dummy kernel, just comment out the line
>   in ipl_c.c that branches to the kernel and remove "vmlinux" from the
>   concat line step above. You can then see the bootstrap run, but it won't
>   try to execute the kernel.
> 
>   Have fun, Jason.
> 
> 
> -------------------------------------------------------------------------
> To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 
> 
