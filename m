Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id UAA14407
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 20:16:17 -0700
Sender: drepper@cygnus.com
To: Alan Modra <alan@linuxcare.com.au>
Cc: "H . J . Lu" <hjl@valinux.com>, John Marvin <jsm@udlkern.fc.hp.com>,
        parisc-linux@puffin.external.hp.com, parisc-linux@thepuffingroup.com,
        binutils@sourceware.cygnus.com
Subject: Re: [parisc-linux] Use of the EI_OSABI field
References: <Pine.LNX.4.21.0011221258270.16860-100000@front.linuxcare.com.au>
Reply-To: drepper@cygnus.com (Ulrich Drepper)
From: Ulrich Drepper <drepper@redhat.com>
Date: 21 Nov 2000 19:18:21 -0800
In-Reply-To: Alan Modra's message of "Wed, 22 Nov 2000 14:03:07 +1100 (EST)"
Message-ID: <m3aeasitj6.fsf@otr.mynet.cygnus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra <alan@linuxcare.com.au> writes:

>   "The e_ident[EI_OSABI] value identifies the operating system and ABI to
>    which the object is targeted"
> 
> Granted, this is only in a processor specific ABI, but it does flatly
> contradict your assertions that the purpose of EI_OSABI is to flag the
> presense of ELF extensions.

The meaning of the field changed over time.  Or better said, some
people initially understood it differently.

-- 
---------------.                          ,-.   1325 Chesapeake Terrace
Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
Red Hat          `--' drepper at redhat.com   `------------------------
