Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 4 Jul 2003 21:20:40 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel compilation for J5600
Message-ID: <20030705032040.GA18582@dsl2.external.hp.com>
References: <20030701132146.GD23597@parcelfarce.linux.theplanet.co.uk> <3ED71F6D0000C050@ocpmta7.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3ED71F6D0000C050@ocpmta7.freegates.net>
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

On Tue, Jul 01, 2003 at 04:03:27PM +0200, Joel Soete wrote:
> Or do we actualy need a specific local_irq_set(x)?

We do.
#define local_irq_save(x) \
        __asm__ __volatile__("rsm %1,%0" : "=r" (x) :"i" (PSW_I) : "memory" )
#define local_irq_set(x) \
	__asm__ __volatile__("ssm %1,%0" : "=r" (x) : "i" (PSW_I) : "memory" )

I'll add that as well in my next commit.
Still looking over some of your other changes.

thanks,
grant
