From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: parisc: Use of align_frame provides stack frame.
Date: Wed, 31 Mar 2010 17:46:27 -0400
Message-ID: <v2x119aab441003311446h652aff9az2e568910a1854829@mail.gmail.com>
References: <p2k119aab441003311342q9e17c174u617cb75a1a4b9dc@mail.gmail.com>
	 <20100331210901.A34455183@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org, kyle@mcmartin.ca
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100331210901.A34455183@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Mar 31, 2010 at 5:09 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> Any assembly constant generated with the use of
>> align_frame includes size for a full stack frame.
>
> Does this fix fork?

Which fork breakage are you talking about? The vfork/execve problem I'm seeing?

The patch is simply additional comments. It fixes my constant
confusion that *_SZ_ALGN constants also includes a size for a frame.

I have several "Clenaup/Add documentation" patches in my tree which I
will push out as I review our *.S files. There were some tricky
assembly instructions that I didn't know what they did, so I added
comments, that sort of stuff e.g. or,=,n

I'm still at a loss to explain how the kernel prevents a process,
which has just called execve, from returning to the callers memory
range.

My suspicion is this:
* Parent calls vfork()
* Child calls execve(), which uses start_thread to setup pt_regs.
* Child returns from execve() via syscall_exit and does *not* restore
space registers from pt_regs.
* Child returns to parent's memory space and starts clobbering things.
* Timer tick goes off and switch_to fixes child's space registers and
PC values and child executes correctly.
* Parent continues executing with some minor corruption.

The window exists between the child's return and the next tick, during
that time the child runs free corrupting the parent.

Cheers,
Carlos.
