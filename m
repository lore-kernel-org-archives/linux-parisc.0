Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from passion.cambridge.redhat.com (dell-paw-3.cambridge.redhat.com [195.224.55.237])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0FFFF482A
	for <parisc-linux@parisc-linux.org>; Fri, 20 Apr 2001 15:30:34 -0600 (MDT)
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010420172435.A21252@thyrsus.com> 
References: <20010420172435.A21252@thyrsus.com>  <Pine.LNX.4.33.0104201440580.12186-100000@xanadu.home> <6817.987801548@redhat.com> 
To: esr@thyrsus.com
Cc: Nicolas Pitre <nico@cam.org>,
	Tom Rini <trini@kernel.crashing.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>,
	"Albert D. Cahalan" <acahalan@cs.uml.edu>,
	Matthew Wilcox <willy@ldl.fc.hp.com>,
	james rich <james.rich@m.cc.utah.edu>,
	lkml <linux-kernel@vger.kernel.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: OK, let's try cleaning up another nit. Is anyone paying attention? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 20 Apr 2001 22:29:00 +0100
Message-ID: <7043.987802140@redhat.com>
Sender: David Woodhouse <dwmw2@redhat.com>
List-ID: <linux-parisc.vger.kernel.org>


esr@thyrsus.com said:
>  Not good enough.  In a year, the pile of false positives would get
> high enough to make it too hard to spot real bugs like the Aironet
> mismatch.  The whole  point of the cleanup is to be able to mechanize
> the consistency checks so they require a minimum of human judgment.

I'm not sure that's the case. The nature of the false positives is that 
they're generally _temporary_ aberrations, caused by the loss of 
synchronisation of various maintainers w.r.t submitting patches to Linus.

I'd be very surprised if the number of false positives isn't fairly stable, 
with new ones being introduced at a similar rate to the rate at which old 
ones finally become correct. 

Might be interesting to check a few older kernels to see if this is true. 
Actually I might expect it to be roughly proportional to the number of 
separately-maintained bodies of code - so it'll grow over time, as the size 
of the Linux kernel grows. 

--
dwmw2
