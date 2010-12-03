From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: convert the rest of the irq handlers to simple/percpu
Date: Fri, 03 Dec 2010 22:27:49 +0100
Message-ID: <4CF960D5.9000700@gmx.de>
References: <1291341665.25796.2.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1291341665.25796.2.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 12/03/2010 03:01 AM, James Bottomley wrote:
> The generic conversion eliminates the spurious no_ack and no_end
> routines, converts all the cascaded handlers to handle_simple_irq() and
> makes iosapic use a modified handle_percpu_irq() to become the same as
> the CPU irq's.  This isn't an essential change, but it eliminates the
> mask/unmask overhead of handle_level_irq().
>
> Signed-off-by: James Bottomley<James.Bottomley@suse.de>
Nice patches James! (although I only reply to this one)

They work for me on 715/64, B160L and c3000.
Can you or Kyle send those patches upstream for 2.6.37?

Helge
