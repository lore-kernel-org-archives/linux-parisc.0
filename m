From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] J5000 LED LCD patch (take 2)
Date: Sat, 26 Mar 2005 09:33:56 -0600
Message-ID: <1111851236.5711.17.camel@mulgrave>
References: <200503241848.57598.dmp@davidmpye.dyndns.org>
	<200503252150.28207.dmp@davidmpye.dyndns.org>
	<20050326071349.GB28972@colo.lackof.org>
	<200503261514.43287.dmp@davidmpye.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: dmp@davidmpye.dyndns.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503261514.43287.dmp@davidmpye.dyndns.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 2005-03-26 at 15:14 +0000, David Pye wrote:
> > I'm still really not clear why there is "flutter".  THe only reasonable
> > case I can think of is flutter is an artifact of the CPU busy doing "real"
> > work and not servicing the LED/LCD wq. i.e. the stress test to excercise
> > networking/disk activity is causing the CPU to work on lots of other tasks
> > and it's taking more than a few jiffies to get back to the LED/LCD wq.
> 
> Yeah, it's a little mysterious. What I think is happening is that when we ask 
> to msleep between the writes, because we're not busy-waiting, we might be put 
> to sleep for far longer than we asked for.  Ditto again, for when we ask to 
> be requeued - we ask to run every 10mS but we might end up waiting for far 
> longer than that.  That's about the best explanation I've come up with so 
> far.  By ensuring that we do not update the io/net symbols more often than 
> necessary, we can save ourselves some of these sleeps, so giving the kernel 
> less opportunity to put us to sleep!

This is a natural consequence of converting from a tasklet to a
workqueue.  workqueues and msleep are controlled by the scheduler.  The
guarantee is not that the task will be awoken at the specified interval,
but that the task will be marked ready to run at the specified interval.
When it actually runs is within the gift of the scheduler and depends
entirely on how many other runnable tasks there are and what priorities
they have.

If you want absolute control of the timings then you have to use a
tasklet or timer (as per the original implementation)

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
