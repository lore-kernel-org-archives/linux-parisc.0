From: Bernd Gietzelt <berndg@fsim-ev.de>
Subject: Re: HPPA hang with PCI SERR or PARITY enabling
Date: Thu, 6 Aug 2009 14:15:42 +0200
Message-ID: <20090806141542.bf48febf.berndg@fsim-ev.de>
References: <20090615134519.6EE824FC5@hiauly1.hia.nrc.ca>
	<Pine.SOC.4.64.0907302054100.20870@math.ut.ee>
	<4A724818.4080909@tausq.org>
	<Pine.SOC.4.64.0907310923520.710@math.ut.ee>
	<20090805174507.GB11458@lackof.org>
	<Pine.SOC.4.64.0908052241550.4076@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.SOC.4.64.0908052241550.4076@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 5 Aug 2009 22:42:34 +0300 (EEST)
Meelis Roos <mroos@linux.ee> wrote:

> > It would be helpful to know if 2.6.30.x kernels (from unstable)
> > show the same problem.
> 
> Will test.

I've done some test with actual and older kernels from debian because
my system shows the same behavior.

2.6.18-5-parisc64-smp 	Kernel panic at statfs
2.6.18-6-parisc64-smp 	Kernel panic at statfs
2.6.26-2-parisc64-smp 	SERR & PARITY
2.6.30-1-parisc64-smp 	Kernel panic
at /build/buildd/linux-2.6-2.6.30/debian/build/source_hppa_none/kernel/smp.c:369
2.6.30-1-parisc64 	SERR & PARITY 

The complete logs can be found here:
http://89.144.17.178/~bernd/lasatonline.de/dokuwiki/doku.php?id=programmieren:administration:computer:ulrike


Some idea what's behind this failure message?

<snap>
Begin: Running /scripts/init-bottom ... done.
run-init: statfsKernel panic - not syncing: Attempted to kill init!
 /: Function not 
</snap>


If some additional test/logs needed: I'm compliant to deliever them.


-- 
Bernd Gietzelt <berndg@fsim-ev.de>
