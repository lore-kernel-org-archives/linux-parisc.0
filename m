Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id B7999482C
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Dec 2001 10:29:59 -0700 (MST)
Message-Id: <200112051725.KAA19039@puffin.external.hp.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.16-pa15 still POWERFAIL(was 2.4.16-pa12 Power failled) 
In-Reply-To: Message from Richard Hirst <rhirst@linuxcare.com>
   of "Wed, 05 Dec 2001 16:08:31 GMT." <20011205160831.F7051@linuxcare.com>
Date: Wed, 05 Dec 2001 10:25:17 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

Richard Hirst wrote:
> On Wed, Dec 05, 2001 at 11:22:17AM +0100, joel.soete@freebel.net wrote:
> This is a bit of debug from my a500, 2.4.16-pa13
> 
> request_irq(66, 000000001037fd90, 0x0, IO-SAPIC00-L1, 000000001009bc58)
> request_irq(66, 000000001037c590, 0x0, powerfail, 0000000000000000)
> request_irq(129, 0000000010374ed0, 0x4000000, sym53c8xx, 000000001fe98000)
> iosapic_interrupt(): irq 66 line 1 eoi fffffffffed30840, irq_num 129
> POWERFAIL INTERRUPTION !
> 
> Don't claim to understand this, but it looks like "powerfail" has
> requested the wrong irq?

Uhm. looks like a shared IRQ. that explains why I see it when
the lan is ifconfig'd instead. Does powerfail need an exclusive IRQ
in the CPU IRQ domain?

I never had the impression any of the HP9000 servers support
a soft-power switch. Many of the older servers did support "Host
powerfail" - but everything shipped since K-class does not.
I think we will need to figure out how to disable this for PAT boxes
and for DKR-class.

This reminds me:
   For PAT PDC boxes, we need to write a "PAT Event Handler"
which has exclusive IRQ on CPU EIRR bit 19 (numbered bass ackwards).
"we" means someone in HP. I don't think any of the documentation
for PAT has been published (or will be published anytime soon *sigh*).

grant
