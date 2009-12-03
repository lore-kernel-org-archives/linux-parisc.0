From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] modules: don't export section names of empty sections
 via sysfs
Date: Thu, 03 Dec 2009 08:08:53 -0600
Message-ID: <1259849333.17964.48.camel@mulgrave.site>
References: <20091202232915.GA2251@p100.box>
	 <200912031750.41240.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, kyle@mcmartin.ca,
	akpm@linux-foundation.org, roland@redhat.com,
	dave@hiauly1.hia.nrc.ca, torvalds@linux-foundation.org
To: Rusty Russell <rusty@rustcorp.com.au>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200912031750.41240.rusty@rustcorp.com.au>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 2009-12-03 at 17:50 +1030, Rusty Russell wrote:
> On Thu, 3 Dec 2009 09:59:15 am Helge Deller wrote:
> > [PATCH] modules: don't export section names of empty sections via sysfs
> 
> Thanks, applied.
> 
> Ah, I see Linus snuck this in before the release.  Excellent.

That's great.  The next step is probably to find out why the toolchain
is doing this ... generating zero length allocated segments seems to be
somewhat deviant behaviour ...

James


