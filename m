From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH RESEND] fix WARNING: at kernel/cpu/idle.c:96
Date: Fri, 14 Jun 2013 12:13:12 -0700
Message-ID: <1371237192.2726.46.camel@dabdike>
References: <1371236142.2726.43.camel@dabdike> <51BB6AE3.8030903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: Parisc List <linux-parisc@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
To: David Daney <ddaney.cavm@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51BB6AE3.8030903@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2013-06-14 at 12:11 -0700, David Daney wrote:
> On 06/14/2013 11:55 AM, James Bottomley wrote:
> >>From 48bbf44a96676ce6f520a408378730c976e9a11e Mon Sep 17 00:00:00 2001
> > From: James Bottomley <JBottomley@Parallels.com>
> > Date: Wed, 8 May 2013 14:05:34 -0700
> > Subject: [PATCH] [PARISC] fix WARNING: at kernel/cpu/idle.c:96
> >
> > On PA-RISC (and presumably any other arch that doesn't implement its own
> > arch_cpu_idle), we get this spurious boot warning.  The problem is that the
> > way the idle task is selected initially using the weak arch_cpu_idle() in
> > idle.c causes us to enter this place once with interrupts enabled.  Fix this
> > by disabling interrupts in the weak arch_cpu_idle() code.
> 
> Is this changelog correct?  It looks to me like you are enabling 
> interrupts down there.

Yes, obvious typo, sorry.  The WARN_ON check is for disabled interrupts
the fix is to enable them.

James


