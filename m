Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Jeremy Drake <jeremyd@apptechsys.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] SMP support 
In-Reply-To: Message from Jeremy Drake <jeremyd@apptechsys.com>
   of "Tue, 05 Mar 2002 14:40:23 PST." <Pine.LNX.4.33L2.0203051434270.6941-100000@eiger.apptechsys.com>
References: <Pine.LNX.4.33L2.0203051434270.6941-100000@eiger.apptechsys.com> 
Date: Tue, 05 Mar 2002 18:05:41 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020306010541.A8BB84853@dsl2.external.hp.com>
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
> I am running debian-hppa on a J5000, and I am using the 2.4.17-32-smp
> kernel.  It detects both processors at boot, and shows them both in
> /proc/cpuinfo, but /proc/stat shows this
> 
> cpu  599904 33379482 34656795 68636319
> cpu0 0 0 64 68636186
> cpu1 599904 33379482 34656731 133
> 
> I interpret this to mean that everything is happening on cpu1 and cpu0 is
> just sitting idle.  Is this a bug, or am I doing something wrong?

sounds like a bug.
I've never looked at /proc/stat.


> Also, I am unable to build any kernels myself.  I get a bunch of depmod
> errors, like these
> 
> depmod: Unhandled relocation of type 74 for printk_Rsmp_dd132261
> depmod: Unhandled relocation of type 74 for usb_deregister_Rsmp_c6f994d5

I've seen this when CONFIG_PA20 is enabled but CONFIG_PARISC64 is not.
Don't know if that's your problem, but it's worth checking.

You don't need to enable CONFIG_PA20 in order to run a 32-bit kernel
on any system that will support 32-bit kernels (A500/L-class only
support 64-bit kernel).

grant
