From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Expect defunct, kill -9 panics kernel?
Date: Sun, 11 Feb 2007 12:17:08 -0500 (EST)
Message-ID: <200702111717.l1BHH8dB023568__34888.6876753115$1416624284$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440702110909r2018a297k98b4f1baed54821a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: James.Bottomley@steeleye.com,
 dave.anglin@nrc.ca,
 parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702110909r2018a297k98b4f1baed54821a@mail.gmail.com>
	from "Carlos O'Donell" at Feb 11, 2007 12:09:24 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On 2/10/07, James Bottomley <James.Bottomley@steeleye.com> wrote:
> > On Sat, 2007-02-10 at 14:37 -0500, John David Anglin wrote:
> > > > 0x10 looks to be curr->func implying curr is NULL and thus the queue
> > > > task_list is corrupt.
> > >
> > > Do you think it help to add a check in __wake_up for a NULL pointer?
> >
> > I suppose so ... I'd really like someone to validate my guess though,
> > although an additional BUG_ON() can't hurt.
> 
> How do I validate your guess? Look for a null or bogus curr->func when
> scheduling?

I'm trying the change below.  Hasn't triggered yet.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

diff --git a/kernel/sched.c b/kernel/sched.c
index cca93cc..277e426 100644
--- a/kernel/sched.c
+++ b/kernel/sched.c
@@ -3703,6 +3703,7 @@ void fastcall __wake_up(wait_queue_head_t *q, unsigned int mode,
 {
 	unsigned long flags;
 
+	BUG_ON(!q);
 	spin_lock_irqsave(&q->lock, flags);
 	__wake_up_common(q, mode, nr_exclusive, 0, key);
 	spin_unlock_irqrestore(&q->lock, flags);
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
