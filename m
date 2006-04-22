From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Sat, 22 Apr 2006 12:48:02 -0400 (EDT)
Message-ID: <200604221648.k3MGm2MW010955@hiauly1.hia.nrc.ca>
References: <20060422154641.GC10514@quicksilver.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060422154641.GC10514@quicksilver.road.mcmartin.ca> from "Kyle
	McMartin" at Apr 22, 2006 11:46:41 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Fri, Apr 21, 2006 at 04:30:08PM -0400, John David Anglin wrote:
> > >     101112c4:   e8 1f 1f df     b,l,n 101112b8 <_read_lock+0x8>,r0
> > >     101112c8:   0f 48 10 9c     ldw 4(r26),ret0  <== exception here
> > > 
> > > r26 contains 0x105d62a8 according to Joel's message.  There isn't
> > > a branch in the delay slot.  The exception just occurs in the delay
> > > slot of a branch.  It's not obvious to me what caused the exception.
> > 
> > Correction, r26 contained 0x000000001051d040.  I also just noticed
> > that the branch is nullified (N=1 in PSW).  Just guessing, but I think
> > this is a timer interruption (soft lockup).
> >
> 
> This crashed palinux last night... Same IIR/IASQIAOQ... 

Actually, it's probably just a nice place to crash for the night ;)

Any info on the interruption and what was going on? In Joel's case,
the call was from here:

int
send_group_sig_info(int sig, struct siginfo *info, struct task_struct *p)
{
        int ret;
	read_lock(&tasklist_lock);
	ret = group_send_sig_info(sig, info, p);
	read_unlock(&tasklist_lock);
	return ret;
}

tasklist_lock is used in a lot of places.  send_group_sig_info only
seems to be called in one place from kernel/itimer.c.  It would seem
like there's some situation where the lock isn't getting unlocked,
or it's very highly contended.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
