Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1A221482E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Mar 2003 07:23:15 -0700 (MST)
Date: Tue, 11 Mar 2003 07:23:14 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200303111423.HAA18107@udlkern.fc.hp.com>
To: Morten.Sickel@nrpa.no
Subject: Re: [parisc-linux] newbie which HP-UX binaries
Cc: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

>         # What binaries will PA-RISC Linux support?
>
>         We currently only support 32-bit ELF executables. Initial bringup
>         work was accomplished using HP-UX emulation, but that emulation
>         has not been maintained. Eventually, we hope to have support for
>         HP-UX 32-bit SOM executables working again, and add support for
>         64-bit ELF executables, both Linux & HP-UX.
>
>         We're not promising to get all HP-UX binaries running on Linux. In
>         particular those which are multithreaded are unlikely to ever
>         be supported.
>
> Does that answer all your questions?
>

Actually that is not completely correct.  There was some more work done,
including support for HP-UX shared libraries and some additional system
call support.  But there are still some big holes, and as is mentioned
above, there are things we will never support.

But, the last time this was worked on (October 2001), Nathan Neulinger got
a HP-UX flexlm binary working under parisc-linux.  We may very well have
broken it since then. :-)

John Marvin
jsm@fc.hp.com
