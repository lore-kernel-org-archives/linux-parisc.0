From: Helge Deller <deller@gmx.de>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Sat, 10 Apr 2010 22:46:37 +0200
Message-ID: <4BC0E3AD.4050802@gmx.de>
References: <20100408215453.GA18445@hiauly1.hia.nrc.ca> <20100408224446.96F294FA3@hiauly1.hia.nrc.ca> <x2p119aab441004090714v107c8fc1s9ca94066871a3e8b@mail.gmail.com> <20100409151330.GA23889@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Carlos O'Donell <carlos@systemhalted.org>, gniibe@fsij.org,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100409151330.GA23889@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 04/09/2010 05:13 PM, John David Anglin wrote:
> On Fri, 09 Apr 2010, Carlos O'Donell wrote:
>> For example, are the futex fixes anywhere for Kyle to pickup?
> 
> The futex fixes are Helge's and were posted to the list on Wed,
> 03 Feb 2010 23:03:49 +0100 along with Helge's minifail3.c.

Yes, but there is still a bug in the patch I sent, and it's still in Dave's big
patchset. See below...

--- a/arch/parisc/include/asm/atomic.h
+++ b/arch/parisc/include/asm/atomic.h
 #else
 #  define _atomic_spin_lock_irqsave(l,f) do { local_irq_save(f); } while (0)
 #  define _atomic_spin_unlock_irqrestore(l,f) do { local_irq_restore(f); } while (0)
+#  define _atomic_spin_lock_irqsave_user(l,f) _atomic_spin_lock_irqsave(l,f)
+#  define _atomic_spin_unlock_irqrestore_user(l,f) _atomic_spin_lock_irqsave_user(l,f)

atomic_spin_lock_irqsave_user() is wrong.
It needs to be:
->  atomic_spin_lock_irqsave_user(l,f) _atomic_spin_lock_irqsave_user(l,f)

In addition, my patch doesn't touches all needed atomic locks.

Nevertheless, on my B2000 (32bit, SMP, 2.6.32.2 kernel) I still do see the minifail bug.
The only difference seems to be, that the minifail3 program doesn't get stuck any
more. It still crashes though from time to time...
So, at least a little improvement :-)

Helge
