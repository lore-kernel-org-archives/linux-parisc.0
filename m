From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] J5000 LED LCD patch (take 2)
Date: Sat, 26 Mar 2005 00:13:49 -0700
Message-ID: <20050326071349.GB28972@colo.lackof.org>
References: <200503241848.57598.dmp@davidmpye.dyndns.org>
	<20050325062517.GH29361@colo.lackof.org>
	<200503251705.02441.dmp@davidmpye.dyndns.org>
	<200503252150.28207.dmp@davidmpye.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: David Pye <dmp@davidmpye.dyndns.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503252150.28207.dmp@davidmpye.dyndns.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Mar 25, 2005 at 09:50:26PM +0000, David Pye wrote:
> On Friday 25 March 2005 17:05, David Pye wrote:
> > > Why not just update every 10ms and ditch all the "minimum on time" stuff?
> > > Can someone tell if an LED/LCD came on 5ms later than it should have
> > > been?
> 
> Ah, I remember now.
> 
> That's 100mS, not 10mS for a start ;)  You can't make the whole update 
> interval 100mS, of course, or you'll miss the heartbeats completely.

Sorry, I wasn't clear. I meant check if LED/LCD status needs to change
every 10ms. The msleep would still let us bang out 8 register writes,
one per HZ. Ie make the "lets see if activity is different now" check
less frequent so LED/LCD is either on or off long enough to be visible.

100ms seems a bit longer than I would like. But if that works, go for it.

> > There is a reason for this, though there may be a better way of doing it.
> >
> > If you remove it, and set the update interval to 10mS, what tends to happen
> > is that because each time you flip a symbol on the lcd you have to wait 2
> > jiffies (once before cmd reg, once before writing data reg), and sometimes
> > more, because the kernel may put you to sleep a bit longer than the time
> > you asked for,  is that the heartbeat starts skipping beats when the io/lan
> > leds are changing on/off all the time.

My point was
1) don't update LED/LCD state again until the previous update has completed.
   ie all the register writes have been sent.

2) we shouldn't touch Heartbeat register for LCD unless heartbeat needs to be updated.

I'm still really not clear why there is "flutter".  THe only reasonable case I can think
of is flutter is an artifact of the CPU busy doing "real" work and not servicing the
LED/LCD wq. i.e. the stress test to excercise networking/disk activity is causing the
CPU to work on lots of other tasks and it's taking more than a few jiffies to get back
to the LED/LCD wq.

> 
> Having spent the evening trying that, I've found that the 100mS minimum 
> 'flutter stop' interval patch gives the most consistent heartbeat of the 
> ideas that I've tried. The solution I suggested above causes the heartbeat to 
> become uneven when LAN/DISK IO is present still.

Yeah, 100ms is well within someone noticing that LED/LCD activity isn't
sync'd with LEDs on NIC or Disk. But I'm ok with that. If they got the real
LED, the display panel can be ignored.

> If the 100mS minimum LED illumination bothers people who have 'real' LEDs as 
> opposed to LCD indicators, we can make it LCD only, of course.

Sure. throw another patch out there! You can enumerate them...this is #3 or #4...

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
