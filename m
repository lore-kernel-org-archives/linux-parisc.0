From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] J5000 LED LCD patch (take 2)
Date: Sun, 27 Mar 2005 19:13:10 -0700
Message-ID: <20050328021310.GC30963@colo.lackof.org>
References: <200503241848.57598.dmp@davidmpye.dyndns.org>
	<200503261514.43287.dmp@davidmpye.dyndns.org>
	<20050327085330.GA17602@colo.lackof.org>
	<200503271038.42434.dmp@davidmpye.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: David Pye <dmp@davidmpye.dyndns.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503271038.42434.dmp@davidmpye.dyndns.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Mar 27, 2005 at 09:38:38AM +0000, David Pye wrote:
> > I think I would be ok with it implemented inside the led_get*
> > activity routines. They have access to lastleds and jiffies and
> > that should be enough to figure out how long an LED should stay
> > on if it's already on.  The main routine can stay simple/readable.
> 
> Yep, I hadn't really thought of doing it in there - I'll have a play with it 
> and maybe annoy everyone with another patch in a bit.   Downside is that it's 
> not really the right place to put it *if* you want it to be lcd-only.

I don't really care if it's LCD only.
LCD clearly has different response times than LED.

> The only other way to do it which you might not find as ugly is to move this 
> into the drivers.  ie the drivers would need to be given the responsibility 
> of deciding whether they need to update anything (ie each of them has to 
> store currentleds rather than the generic calculator function). That way, 
> they'll get called each time the work runs, but can decide for themselves 
> whether to actually do anything.  It's only a couple of lines to add to the 
> other functions e.g. lasi.   How does that sound?

Yeah - having the LCD_driver regulate minimum on probably makes just as
much sense since LED really doesn't need it.

Implementing it in led_get* routines was just my first thought.
led_get* controls state of the LEDs and could avoid extra calculations
if it knows about minimum-on time. 
Maybe minimum-on time should be a parameter that's different for LED/LCD
if a hardcoded value isn't acceptable for both.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
