Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail14.speakeasy.net [216.254.0.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id 109844833
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Jun 2002 09:24:35 -0600 (MDT)
Date: Mon, 10 Jun 2002 08:24:28 -0700
From: Randolph Chung <randolph@tausq.org>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Pb with ioctl and 64bits
Message-ID: <20020610152428.GB5876@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3D04BD42.446D930@admin.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D04BD42.446D930@admin.france.hp.com>
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

> I'm loosing my nerves. I'm stuck with it since two days, and I don't understand :-(
> My ioctls are running fine with 32bits kernel. I thought I've done everything fine,
> but when compiling it with 64 bits kernel it fail with:
> sys32_ioctl: Unknown cmd fd(3) cmd(80047001) arg(00000803)
> So my question is: what is the difference between 32bits and 64bits kernel about
> the ioctls ? 

as you discovered, there's some translation that is needed for 64-bit
kernels because userspace is always 32-bits. So when running a 64-bit
kernel, some ioctls need to be translated via the logic in ioctl32.c.
The situation is similar to sparc32/sparc64.

> I think that arch/parisc/kernel/ioctl32.c is used with 64bits and not with 32bits, right ?

yes.

> If yes, what I need to do more than:
> #if defined(CONFIG_DUMP) || defined(CONFIG_DUMP_MODULE)
> COMPATIBLE_IOCTL(DIOSDUMPDEV);
> COMPATIBLE_IOCTL(DIOGDUMPDEV);
> COMPATIBLE_IOCTL(DIOSDUMPLEVEL);
> COMPATIBLE_IOCTL(DIOGDUMPLEVEL);
> COMPATIBLE_IOCTL(DIOSDUMPFLAGS);
> COMPATIBLE_IOCTL(DIOGDUMPFLAGS);
> COMPATIBLE_IOCTL(DIOSDUMPCOMPRESS);
> COMPATIBLE_IOCTL(DIOGDUMPCOMPRESS);
> COMPATIBLE_IOCTL(DIOGDINDEX);
> #endif /* DUMP */

what are the ioctl definitions used by the dump driver? (the _IO{,R,W,RW}
values). From the output you pasted:

> sys32_ioctl: Unknown cmd fd(3) cmd(80047001) arg(00000803)

that ioctl seems to be _IOW('p', 1, int) (or unsigned int or so)?

randolph
