Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id 72734482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Jun 2002 09:33:25 -0600 (MDT)
Date: Thu, 6 Jun 2002 16:09:35 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] strange message with insmod
Message-ID: <20020606150935.GP25306@sleepie.demon.co.uk>
References: <3CFF72D7.30FA7556@admin.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3CFF72D7.30FA7556@admin.france.hp.com>
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

On Thu, Jun 06, 2002 at 04:33:59PM +0200, Bruno Vidal wrote:
> 	Hi
> I've compiled a new kernel (without LVM), everything seems okay.
> My dump driver compiled right...but when I use insmod:
> hpfrcw12:~# insmod dump
> Using /lib/modules/2.4.18-pa35/kernel/drivers/dump/dump.o
> r_info 0x29 not handled
> ...
> So it is not coming from my modules. The modules are loaded,
> everything seems okay, but what means this messages ?

Some relocation type used in your .o files that modutils doesn't know
how to handle.  Generally modutils only handles the relocation types
that I have seen in modules to date.  New types might crop up as a
result of tool chain changes, or different compiler options, or possibly
kernel code changes might cause the toolchain to generate some other
relocation.

Are you using the standard woody toolchain for hppa?  Can you send me
off list your scsi/st.o, incase I can't reproduce here?

Everything might seem ok, but it could be some code paths or data
accesses wont be handled properly.

Thanks,
  Richard
