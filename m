Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 298AD4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Apr 2003 11:45:44 -0600 (MDT)
Received: from sal.ucc.ie (sal.ucc.ie [143.239.201.201])
	by csmail.ucc.ie (8.11.3/8.11.3/SuSE Linux 8.11.1-0.5) with ESMTP id h3EHjh604455
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Apr 2003 18:45:43 +0100
Date: Mon, 14 Apr 2003 18:45:42 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] installation problems on RDI Precisionbook
In-Reply-To: <Pine.LNX.4.44.0304141801320.14551-100000@sal.ucc.ie>
Message-ID: <Pine.LNX.4.44.0304141843040.14551-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Mon, 14 Apr 2003, M. Grabert wrote:

> Hi PA,
>
> I using the net-install CD from EISEE
> (palinux-2.4.20-pa32-20030322-netinst.iso). It boots up (identifies the
> system correctly as a model 9000/778/B160L) and stops/hangs at the
> following line (at least it passes the 'Branching to kernel entry point'
> message):
>
> [...]
> LED display at f0190001 registered
> Kernel command line: ramdisk_size=8192 root=/dev/ram console=tty0 sti=8/24
>  sti_font=VGA8x16 TERM=linux palo_kernel=0/vmlinux
> Console: colour dummy device 160x64

(this error occurs when the internal LCD monitor (1024x768) is used).

A work-around:

I'm using now an external monitor (1280x1024), and it seems to work now.
However I also want to be able to use the LCD screen of the laptop if
possible ...


Thanks, Max
