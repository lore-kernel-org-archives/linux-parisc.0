Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 7D52E483E
	for <parisc-linux@parisc-linux.org>; Sun, 21 Sep 2003 05:22:31 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] sched_clock implementation
Date: Sun, 21 Sep 2003 13:20:36 +0200
Cc: parisc-linux@parisc-linux.org
References: <20030918203510.GD21596@parcelfarce.linux.theplanet.co.uk> <3F6C9622.60402@tiscali.be> <20030921000447.GC31268@dsl2.external.hp.com>
In-Reply-To: <20030921000447.GC31268@dsl2.external.hp.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200309211320.36485.deller@gmx.de>
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

On Sunday 21 September 2003 02:04, Grant Grundler wrote:
> On Sat, Sep 20, 2003 at 06:02:10PM +0000, Joel Soete wrote:
> > a quick look into paxx.pdf which about CR16 speak of "peak instruction
> > rate" but do not define anywhere?
> > I presume that is the cpu clock but would like somebody confirm.
>
> Read about "Interval Timer" (cr16) in the PA 2.0 Arch book.
> PDC provides the exact rate that CR16 is changing.
> Looks like PDC_TOD_ITIMER is the call but I'm not sure offhand.
> In any case, I've only seen it used as CPU cycle counter.
> (ie 1:1 with CPU clock).

Hi Joel,

I think we have the rate in the variable "boot_cpu_data.cpu_hz" (see 
arch/parisc/kernel/processor.c) already.

Helge
