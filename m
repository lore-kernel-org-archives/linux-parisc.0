From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Sun, 23 Apr 2006 11:18:51 -0500
Message-ID: <200604231118.51833.mszick@morethan.org>
References: <200604221648.k3MGm2MW010955@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604221648.k3MGm2MW010955@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat April 22 2006 11:48, John David Anglin wrote:
> > On Fri, Apr 21, 2006 at 04:30:08PM -0400, John David Anglin wrote:
> > > >     101112c4:   e8 1f 1f df     b,l,n 101112b8 <_read_lock+0x8>,r0
> > > >     101112c8:   0f 48 10 9c     ldw 4(r26),ret0  <== exception here
> > > > 
> > > > r26 contains 0x105d62a8 according to Joel's message.  There isn't
> > > > a branch in the delay slot.  The exception just occurs in the delay
> > > > slot of a branch.  It's not obvious to me what caused the exception.
> > > 
> > > Correction, r26 contained 0x000000001051d040.  I also just noticed
> > > that the branch is nullified (N=1 in PSW).  Just guessing, but I think
> > > this is a timer interruption (soft lockup).
> > >
> > 
> > This crashed palinux last night... Same IIR/IASQIAOQ... 
> 
> Actually, it's probably just a nice place to crash for the night ;)
> 
> Any info on the interruption and what was going on? In Joel's case,
> the call was from here:
> 
> int
> send_group_sig_info(int sig, struct siginfo *info, struct task_struct *p)
> {
>         int ret;
> 	read_lock(&tasklist_lock);
> 	ret = group_send_sig_info(sig, info, p);
> 	read_unlock(&tasklist_lock);
> 	return ret;
> }
> 
> tasklist_lock is used in a lot of places.  send_group_sig_info only
> seems to be called in one place from kernel/itimer.c.  It would seem
> like there's some situation where the lock isn't getting unlocked,
> or it's very highly contended.
> 
Or the routine is not coded to make the lock instruction observable
by all processors:

> This the read lock I see in vmlinux-2.6.15-rc2-pa1:
>
> 00000000101112b0 <_read_lock>:
>
> 101112b0: 0f 40 15 dc ldcw,co 0(r26),ret0
    <format 5 instruction:  0000011 11010 00000 00 0 1 01 0111 0 11100>
    a==0,s==0,b==26,t==28
    cc==01 Coherent Operation, not a hint but required[1];
           Processor may operate on line in cache rather than update memory[2];

<quote [3]>
If a cache control hint is specified, the semaphore operation may be handled
as if a cache control hint had not been specified, or, preferably, the addressed
word is zero extended and copied into GR t and then the addressed word is set to
zero in the cache. The cleared word need not be flushed to memory.
</quote>;

<quote [4]>
if (cache line is present and dirty || coherent_system || cc != 0) {
    GR[t] <- mem_load(space,offset,0,63,NO_HINT);
    mem_store(space,offset,0,63,NO_HINT,0);
} else {
    Dcache_flush(space,offset);
    GR[t] <- mem_load(space,offset,0,63,NO_HINT);
    store_in_memory(space,offset,0,63,NO_HINT,0);
}
</quote>;

Note that the first block is selected by ((cc == 01) != 00)

The first block describes the operation required for semaphores used
by multiple execution paths on a single processor.

The second block (after the else) describes the operation required
for execution paths on multiple processors.

    [1]: http://h21007.www2.hp.com/dspp/tech/tech_TechDocumentDetailPage_IDX/1,1701,5310,00.html
    [2]: http://h21007.www2.hp.com/dspp/files/unprotected/parisc20/PA_6_inst_overview.pdf; page 13 and table 6-9
    [3]: http://h21007.www2.hp.com/dspp/files/unprotected/parisc20/PA_7_inst_descriptions.pdf; page 74 and 75
    [4]: ibid. 'indivisible', page 75

Next question.

Mike
> Dave
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
