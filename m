Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA16315
	for <parisc-linux@puffin.external.hp.com>; Sat, 8 Jan 2000 17:40:15 -0700
Date: Sat, 8 Jan 2000 17:41:20 -0700 (MST)
From: "Nathaniel F. Thompson" <haplo@frii.com>
To: Steven Pritchard <steve@silug.org>
cc: micha28@gmx.de, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 9000/712 & Samsung Monitor
In-Reply-To: <200001080449.WAA13881@osiris.silug.org>
Message-ID: <Pine.BSF.4.10.10001081739390.74709-100000@io.frii.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


It does work the same on a 712.  To save the typing at the BOOT_ADMIN
prompt, just hit tab as it comes up.  This will force it to cycle through
different frequencies.  I have seen many machines at work that won't cycle
unless you hit tab, and some that will auto cycle.  

Nate

On Fri, 7 Jan 2000, Steven Pritchard wrote:

> Michael Schulz said:
> > I can get a 712/60 almost complete, but without a monitor.
> > So my question is, is it possible to connect a Samsung
> > Syncmaster 17GLsi with the HP.
> 
> I don't know the first thing about 712s, but I was amazed to discover
> that if you do "path console graphics.7" (and then "reset") at the
> "BOOT_ADMIN>" prompt on a 715/100, you'll get 640x480 graphics
> suitable for a VGA monitor.  Doing "path console graphics" lists the
> various choices...
> 
> BOOT_ADMIN> path console graphics
>         Monitor Choices
> Type     Resolution     Frequency
> ----     ----------     ---------
>   1      1280x1024        72Hz
>   2      1024x768         75Hz
>   3      1024x768         70Hz
>   4      1024x768         75Hz     Flat Panel
>   5      1280x1024        60Hz
>   6      1024x768         60Hz
>   7       640x480         60Hz
>   8      1280x1024        75Hz     VESA
>   9      1024x768         75Hz     VESA
>  10       800x600         75Hz     VESA
>  11       640x480         75Hz     VESA
>  12      1280x1024        72Hz     Greyscale
>  13      1280x1024        50Hz
> 
> If a 712/60 will do the same, then surely when of the lower
> resolutions or frequencies would work...
> 
> Steve
> -- 
> steve@silug.org           | Linux Users of Central Illinois
> (217)698-1694             | Meetings the 4th Tuesday of every month
> Steven Pritchard          | http://www.luci.org/ for more info
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
