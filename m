Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0FE18482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Jul 2003 08:03:35 -0600 (MDT)
Date: Tue, 1 Jul 2003 16:03:27 +0200
Message-ID: <3ED71F6D0000C050@ocpmta7.freegates.net>
In-Reply-To: <20030701132146.GD23597@parcelfarce.linux.theplanet.co.uk>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Kernel compilation for J5600
To: "Matthew Wilcox" <willy@debian.org>,
	"Mark Mestdagh" <Mark.Mestdagh@Icon-Europe.com>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi all,
 
> > drivers/ide/idedriver.o(.text.probe_hwif+0xfc): undefined reference to
> > `local_irq_set'

> This is 2.4.21-pa1?

Hmm not yet and my patch to Grant is definitely incomplete (Sorry, my bad).

In fact I am hesitate:

For many other paltform we can found:
(in system_irqsave.h)
[...]
/* For spinlocks etc */
#define local_irq_save(x)  __save_and_cli(x)
#define local_irq_set(x)   __save_and_sti(x)

#define local_irq_restore(x) __restore_flags(x)
#define local_irq_disable() __cli()
[...]

OTC for parisc:
[...]
#define local_irq_save(x) \
	__asm__ __volatile__("rsm %1,%0" : "=r" (x) :"i" (PSW_I) : "memory" )
#define local_irq_restore(x) \
	__asm__ __volatile__("mtsm %0" : : "r" (x) : "memory" )

[...]

So can we here simply add:
#define local_irq_set(x)   __save_and_sti(x)

Or do we actualy need a specific local_irq_set(x)?

Thanks in advance for advise,
    Joel


---------------------------------
Tiscali ADSL: 19,50 euros/mois...abonnez-vous sur www.tiscali.be
