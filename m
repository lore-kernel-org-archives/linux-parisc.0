Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 48493483B
	for <parisc-linux@lists.parisc-linux.org>; Sun, 17 Mar 2002 06:59:49 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16mbCO-0003D7-00; Sun, 17 Mar 2002 13:59:48 +0000
Date: Sun, 17 Mar 2002 13:59:48 +0000
From: Matthew Wilcox <willy@debian.org>
To: Tim Robb <hecubus3rd@yahoo.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Can I do 64 bit
Message-ID: <20020317135948.G21765@parcelfarce.linux.theplanet.co.uk>
References: <20020317084054.84462.qmail@web10504.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020317084054.84462.qmail@web10504.mail.yahoo.com>; from hecubus3rd@yahoo.com on Sun, Mar 17, 2002 at 12:40:54AM -0800
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

On Sun, Mar 17, 2002 at 12:40:54AM -0800, Tim Robb wrote:
> Hello, I recently aquired a HP C180XP here is the
> I am wondering if this system can run a 64 bit kernel?
>  Can anyone tell me if it can and how do I get it
> booted up in 64 bit mode if it can?

Let's get a FAQ entry for this:

15. Can I run a 64-bit kernel on my machine?

The answer to this is generally determined by the firmware your machine
runs.  Workstations up to and including the J2240 and C360 only have
32-bit firmware.  The normal 64-bit kernel will not run on these systems.
The A500 and L2000 server only have 64-bit firmware, and these machines
must run a 64-bit kernel.  The C3000 and similar workstations have both
32-bit and 64-bit firmware and can therefore run either kernel.

A more important question is: why do you want to run a 64-bit kernel?
Since we do not yet support 64-bit userspace, there is no advantage
to be gained running a 64-bit kernel on a machine with less than 3.5GB
of memory.

For those who do want to test 64-bit kernels on older machines, there is a
special configuration option `32-bit PDC' which will allow a 64-bit kernel
to work with 32-bit firmware.  We cannot enable this option by default
as the resulting kernel will not work on machines with 64-bit firmware.

-- 
Revolutions do not require corporate support.
