Return-Path: <xam@cs.ucc.ie>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5637F4843
	for <parisc-linux@lists.parisc-linux.org>;
	Thu,  6 May 2004 03:33:42 -0600 (MDT)
Date: Thu, 6 May 2004 10:33:22 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
In-Reply-To: <20040506050521.GW3965@tausq.org>
Message-ID: <Pine.LNX.4.58.0405061029520.32526@sal.ucc.ie>
References: <20040505204811.27F0C4945E4@palinux.hppa>
	<1083790244.2201.462.camel@mulgrave>
	<20040506050521.GW3965@tausq.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: James Bottomley <James.Bottomley@steeleye.com>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, 5 May 2004, Randolph Chung wrote:

> > > Move to 8 byte Page Table Entries for 32 bit kernels.  This allows us
> > > to recover sixteen flag bits (the sixteen bits at the top of the pte for
> > > 64 bit - 48 address bits is pretty unlikely to be hit soon) on both 32
> > > and 64 bits.
>
> jejb, this seems to have broken the kernel for me. On my c3750, -pa9
> doesn't boot (-pa7 is ok). With -pa9 the machine HPMC's very early
> during boot (i have early debug turned on, but there was no console
> output).

I tried -pa8 yesterday (32bit) on my C3000, and it also HPMCs straight
after the 'if this is the last message ...' output.

At first I thought it was related to the palo-1.4 bug, so I reinstalled
palo-1.3, but this didn't solve the problem.

> perhaps this is sensitive to amount of physical memory in the system? i
> have 1.5GB in my system.

1GB here.


Thanks,
  Max
