Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Jeremy Drake <jeremyd@apptechsys.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.18 SMP instability 
In-Reply-To: Message from Jeremy Drake <jeremyd@apptechsys.com>
   of "Tue, 28 May 2002 14:56:03 PDT." <Pine.LNX.4.44.0205281436230.11012-100000@garibaldi.apptechsys.com>
References: <Pine.LNX.4.44.0205281436230.11012-100000@garibaldi.apptechsys.com> 
Date: Tue, 28 May 2002 22:56:09 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020529045609.7573F482A@dsl2.external.hp.com>
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

Jeremy Drake wrote:
> The LCD has a network, the HDD and an unfilled heart on the screen -- not 
> changing.

Not an HPMC then.

> The console says apt-get (668): unaligned access to 0x403ce08c it 
> ip=0x4005e4f7

That's odd - i've never seen that from apt-get.

> The TOC button had no effect.  Here's a ser pim from after I pulled the 
> power and restarted it.  It doesn't look particularly helpful.

Again I didn't look up the arcane stuff.
GR02 and IAOQ were both pointing at cpu_idle()
CR23 was zero; no external interrupts pending

grant
