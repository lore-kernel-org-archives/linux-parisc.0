From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: convert the rest of the irq handlers to
 simple/percpu
Date: Fri, 03 Dec 2010 16:40:58 -0600
Message-ID: <1291416058.2881.294.camel@mulgrave.site>
References: <1291341665.25796.2.camel@mulgrave.site>
	 <4CF960D5.9000700@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4CF960D5.9000700@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2010-12-03 at 22:27 +0100, Helge Deller wrote:
> On 12/03/2010 03:01 AM, James Bottomley wrote:
> > The generic conversion eliminates the spurious no_ack and no_end
> > routines, converts all the cascaded handlers to handle_simple_irq() and
> > makes iosapic use a modified handle_percpu_irq() to become the same as
> > the CPU irq's.  This isn't an essential change, but it eliminates the
> > mask/unmask overhead of handle_level_irq().
> >
> > Signed-off-by: James Bottomley<James.Bottomley@suse.de>
> Nice patches James! (although I only reply to this one)
> 
> They work for me on 715/64, B160L and c3000.
> Can you or Kyle send those patches upstream for 2.6.37?

Sure, although kyle was also going to post a different patch, I
think ... we only need the one liner upstream to make everything work.
The rest is just a conversion to more simplistic handlers which can wait
for the merge window.

James


