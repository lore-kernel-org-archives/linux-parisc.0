Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id B771A483E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Nov 2003 09:27:28 -0700 (MST)
Message-ID: <3FB10DEF.30908@tiscali.be>
Date: Tue, 11 Nov 2003 16:27:27 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: vapier@gentoo.org
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] framebuffer drawing incorrectly ?
References: <200311101646.55611.vapier@gentoo.org> <3FB01295.10005@tiscali.be> <200311102105.42375.vapier@gentoo.org>
In-Reply-To: <200311102105.42375.vapier@gentoo.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Mike,


Mike Frysinger wrote:
> On Monday 10 November 2003 17:35, you wrote:
> 
>>please send your xfonfig-4 and your dmesg file.
> 
> 
> http://wh0rd.de/mike/hppa-dmesg
> http://wh0rd.de/mike/hppa-XF86Config-4

All seems ok. I just notice a small difference with my "Display" definition:
[...]
Section "Screen"
         Identifier      "Default Screen"
         Device          "HPA208LC1024"
         Monitor         "Targa"
         DefaultDepth    8
         SubSection "Display"
                 Depth           1
                 Modes           "1280x1024"
         EndSubSection
EndSection
[...]

you added:
		Virtual		0 0
		ViewPort	0 0

well I don't know exactely what is realy makes and I presume that you 
already test without (commented) those lines?

> http://wh0rd.de/mike/hppa-fbcon-pic.jpg
> the pic is a little blurry but you can see that the white text is from the 
> hppa firmware/palo while the purple text is from the bootup ... also, it 
> seems that the buffer is swapped in the middle ... the lower half of the 
> purple text is actually displayed first when scrolling back through the 
> buffer ...
> -mike
hmm, i never see such behaviour before but it seems that electronic 
signals emitted by hp system are not compatible with your screen (bad 
cable, adapter?)??
[For my part I also try, here at home with a foreign screen (not hp, i 
mean) but it doesn't work very well (at each reboot I was obliged to fix 
the pdc screen definition but it was working fine with a hp screen), so 
i don't even test XFree more then the time of a login...)]
Before you install Linux, do you have the opportunity to check if it was 
working with hpux X11 hpview or cde?
Or do you have some opportunity to test with a hp screen?
(or the graphical controler is broken?)

Sorry couldn't help you more.

Good luck,
	Joel

Joel
