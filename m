From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: parisc: Use of align_frame provides stack frame.
Date: Wed, 31 Mar 2010 20:58:21 -0400
Message-ID: <20100401005820.GA27145@hiauly1.hia.nrc.ca>
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

> On Wed, Mar 31, 2010 at 5:09 PM, John David Anglin
> <dave@hiauly1.hia.nrc.ca> wrote:
> >> Any assembly constant generated with the use of
> >> align_frame includes size for a full stack frame.
> >
> > Does this fix fork?
> 
> Which fork breakage are you talking about? The vfork/execve problem I'm seeing?

There seem to be a lot of them...

I have been looking at another one today.  There were three instances
today running the gcc testsuite.  It seems the parent dies exiting from
fork, returning to location 0.

0x405a378c <fork+700>:  copy r9,ret0
0x405a3790 <fork+704>:  ldw -14(r3),rp
0x405a3794 <fork+708>:  ldw 10(r3),r10
0x405a3798 <fork+712>:  ldw 14(r3),r9
0x405a379c <fork+716>:  ldw 18(r3),r8
0x405a37a0 <fork+720>:  ldw 1c(r3),r7
0x405a37a4 <fork+724>:  ldw 20(r3),r6
0x405a37a8 <fork+728>:  ldw 24(r3),r5
0x405a37ac <fork+732>:  ldw 28(r3),r4
0x405a37b0 <fork+736>:  ldo 40(r3),sp
0x405a37b4 <fork+740>:  bv r0(rp)
0x405a37b8 <fork+744>:  ldw,mb -40(sp),(gdb) x/x $sp
0xfe001a40:     0xfe0018cc
(gdb) x/16x $sp
0xfe001a40:     0xfe0018cc      0x000e9408      0xffffffff      0x000e6c54
0xfe001a50:     0x00000000      0x00000000      0x00104d88      0x000c36f4
0xfe001a60:     0x00000001      0x00000000      0xfe00194c      0x000e9560
0xfe001a70:     0x4092c000      0x00000000      0x00000001      0xf4000000
(gdb) x/16x $sp - 0x20
0xfe001a20:     0x000e9410      0x000e9408      0x0004771b      0x0004e727
0xfe001a30:     0x00000000      0x00000000      0x000fed68      0x000fedc8
0xfe001a40:     0xfe0018cc      0x000e9408      0xffffffff      0x000e6c54
0xfe001a50:     0x00000000      0x00000000      0x00104d88      0x000c36f4
(gdb) info reg
flags          0x4ff0f  327439
r1             0x0      0
rp             0x0      0
r3             0xfe0018cc       4261419212
r4             0xfe00194c       4261419340
r5             0x0      0
r6             0x1      1
r7             0xc36f4  800500
r8             0x104d88 1068424
r9             0x0      0
r10            0x0      0
(gdb) p/x $ret0
$3 = 0x2776

Registers ret0 and rp seem corrupt.  Registers r3 through r10 contain
the same values as the stack.  The rp value on the stack is 0x0004e727.

(gdb) disass 0x0004e700 0x0004e734
Dump of assembler code from 0x4e700 to 0x4e734:
0x0004e700 <make_child+128>:    cmpib,>= 0,r26,0x4e714 <make_child+148>
0x0004e704 <make_child+132>:    ldil L%c3000,r7
0x0004e708 <make_child+136>:    b,l 0x62c1c <sync_buffered_stream>,rp
0x0004e70c <make_child+140>:    nop
0x0004e710 <make_child+144>:    ldil L%c3000,r7
0x0004e714 <make_child+148>:    ldi 1,r6
0x0004e718 <make_child+152>:    ldo 6f4(r7),r7
0x0004e71c <make_child+156>:    b,l 0x34d60,rp
0x0004e720 <make_child+160>:    nop
0x0004e724 <make_child+164>:    movb,>= ret0,r3,0x4e930 <make_child+688>
0x0004e728 <make_child+168>:    addil L%6800,dp,r1

I believe from looking at the bash code that the call at <make_child+156>
is to fork().

So, the $64 question is how did ret0 and rp get corrupted?

> 
> The patch is simply additional comments. It fixes my constant
> confusion that *_SZ_ALGN constants also includes a size for a frame.
> 
> I have several "Clenaup/Add documentation" patches in my tree which I
> will push out as I review our *.S files. There were some tricky
> assembly instructions that I didn't know what they did, so I added
> comments, that sort of stuff e.g. or,=,n
> 
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

I'll think about it.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
