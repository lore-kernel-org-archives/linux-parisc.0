From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Re: Boot problem with HPPA 735/125 w/ A1439A CRX
Date: Sun, 29 Jul 2007 22:18:48 +0200
Message-ID: <200707292218.49045.deller__43909.0715292425$1416624423$gmane$org@gmx.de>
References: <200707291829.l6TITMPi028794@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200707291829.l6TITMPi028794@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sunday 29 July 2007, John David Anglin wrote:
> > > There seems to be an issue with mode "1280x1024".
> > 
> > Are you running your console in 1280x1024 as well, e.g. what does "fbset -i" reports ?
> 
> Believe so.
> 
> mode "1280x1024"
>     geometry 1280 1024 1280 1024 8
>     timings 0 0 0 0 0 0 0
>     rgba 8/0,8/0,8/0,0/0
> endmode
> 
> Frame buffer device information:
>     Name        : stifb
>     Address     : 0xf9000000
>     Size        : 2097152
>     Type        : PACKED PIXELS
>     Visual      : PSEUDOCOLOR
>     XPanStep    : 0
>     YPanStep    : 0
>     YWrapStep   : 0
>     LineLength  : 2048
>     MMIO Address: 0xf8100000
>     MMIO Size   : 4194304
>     Accelerator : No
> 
> > What makes me wonder is, that if "startx" works, what is the difference to "gdb/kdm" in respect to Xorg screen confifuration ??
> 
> I looked at the gdm config and didn't see anything obvious.  It's the
> default config.  In any case, gdm ends up running XKeepsCrashing.

So it crashes in userspace ony (and not the kernel). Any backtraces ?
Did you tried another resolution as well, e.g. 1024x768 ?

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
