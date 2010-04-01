From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: parisc: Use of align_frame provides stack frame.
Date: Thu, 1 Apr 2010 14:44:24 -0400
Message-ID: <20100401184423.GA2126@hiauly1.hia.nrc.ca>
References: <p2k119aab441003311342q9e17c174u617cb75a1a4b9dc@mail.gmail.com> <20100331210901.A34455183@hiauly1.hia.nrc.ca> <v2x119aab441003311446h652aff9az2e568910a1854829@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, kyle@mcmartin.ca
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <v2x119aab441003311446h652aff9az2e568910a1854829@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 31 Mar 2010, Carlos O'Donell wrote:

> I'm still at a loss to explain how the kernel prevents a process,
> which has just called execve, from returning to the callers memory
> range.
> 
> My suspicion is this:
> * Parent calls vfork()
> * Child calls execve(), which uses start_thread to setup pt_regs.
> * Child returns from execve() via syscall_exit and does *not* restore
> space registers from pt_regs.
> * Child returns to parent's memory space and starts clobbering things.
> * Timer tick goes off and switch_to fixes child's space registers and
> PC values and child executes correctly.
> * Parent continues executing with some minor corruption.
> 
> The window exists between the child's return and the next tick, during
> that time the child runs free corrupting the parent.

I'm thinking we might have the same problem with fork (i.e., child
sometimes starts with wrong space registers depending on timer tick
timing).

What timer frequency are you using?  I've been using 250 Hz.  If your
theory is correct, I think the problem should be worse at 100 Hz.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
