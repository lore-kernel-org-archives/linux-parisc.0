From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] fix comment in Light-weight-syscall code
Date: Fri, 11 Jul 2008 14:33:02 -0400
Message-ID: <20080711183302.GD31987@phobos.i.cabal.ca>
References: <200807102204.15886.deller@gmx.de> <119aab440807111002i2ed7079cu7a7c096b241784b7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>, kyle@mcmartin.ca,
	linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440807111002i2ed7079cu7a7c096b241784b7@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jul 11, 2008 at 01:02:10PM -0400, Carlos O'Donell wrote:
> On Thu, Jul 10, 2008 at 4:04 PM, Helge Deller <deller@gmx.de> wrote:
> > The comment for the lws-atomic system call userspace helper
> > function mentions r22 and r23 as input registers, but I couldn't
> > find any usage of those registers in the code.
> > This patch fixes this and corrects another small typo as well.
> 
> That's the LWS syscall ABI. It has 5 argument registers, 1 return
> register, 1 error code register, and 1 lws number register.
> 

Yeah, but I think what Helge is asking is, if there's no plans to ever
add more, or more arguments, can he change it to be 3 args?

r, Kyle
