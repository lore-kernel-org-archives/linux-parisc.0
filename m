From: dann frazier <dannf@dannf.org>
Subject: Re: HPPA and Squeeze
Date: Mon, 6 Jul 2009 20:43:42 -0600
Message-ID: <20090707024342.GB15572@lackof.org>
References: <20090706214315.GA3826@bombadil.infradead.org> <20090707014710.EF3975022@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, carlos@systemhalted.org,
	randolph@tausq.org, James.Bottomley@hansenpartnership.com,
	deller@gmx.de, kurt@roeckx.be, pkern@debian.org,
	debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org,
	debian-release@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090707014710.EF3975022@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jul 06, 2009 at 09:47:09PM -0400, John David Anglin wrote:
> > If I remember correctly, there's still some issues with the L2 cache on
> > pa8800 that we haven't quite bothered to work out yet, since it's "good
> > enough" for now. James probably knows more. It would be interesting to
> > see if you could reproduce it with a UP 64-bit kernel on your C3750 to
> > discount the L2 problems.
> 
> Googling, I see Grant had trouble with RCU_TORTURE_TEST=y.  Probably,
> I should test current kernel to see if the problem is still present.
> 
> I guess you are referring to this change:
> http://fossplanet.com/linux.debian.devel.kernel.cvs/thread-4378354-r7141-patches/
> 
> I'm thinking we must be missing a flush...  Maybe in clear_user_page
> as for copy_user_page?
> 
> Do the problematic debian buildd machines have pa8800/pa8900 processors?

dannf@penalosa:~$ cat /proc/cpuinfo 
processor	  : 0
cpu family	  : PA-RISC 2.0
cpu 		  : PA8700 (PCX-W2)
cpu MHz		    : 750.000000
model		      : 9000/785/J6700
model name	      : Duet W2
hversion	      : 0x00005dd0
sversion	      : 0x00000491
I-cache		      	: 768 KB
D-cache			  : 1536 KB (WB, direct mapped)
ITLB entries		  : 240
DTLB entries		  : 240 - shared with ITLB
bogomips		  : 1495.04
software id		  : 2001606322


> My sense is that some change (probably to the core memory management
> code) made the coherence issue worse post 2.6.22.x.
> 
> Dave

-- 
dann frazier

