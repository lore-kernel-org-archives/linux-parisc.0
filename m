From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [RFC] using 64bit wide registers with 32bit kernel
Date: Sun, 14 May 2006 00:27:17 -0600
Message-ID: <20060514062717.GA25973@colo.lackof.org>
References: <7d01f9f00605131543p1458c0c9l55863d71f1a039d8@mail.gmail.com>
	<200605132335.k4DNZmAY002050@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 Thibaut VARENE <T-Bone@parisc-linux.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200605132335.k4DNZmAY002050@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, May 13, 2006 at 07:35:48PM -0400, John David Anglin wrote:
> > Are you trying to say that userspace code shouldn't be using the full
> > registers width when running a 32bit (narrow) kernel?
> 
> I don't believe that it's impossible to support the full register width
> with a 32bit (narrow) kernel.  However, hpux to my knowledge doesn't
> support 64-bit registers when using a narrow kernel.

I believe later 10.20 updates/patches to support PA2.0 processors did
in fact support saving/restoring 64-bits. But it's been a _long_
time since I've look at that.

> I think this
> reflects the historical development of hpux.  The first PA 2.0 kernels
> were narrow and based on the 32-bit PA 1.1 implementation.

Correct. Mostly in the form of 10.20 patches.

> Wide kernels were introduced with HP-UX 11.

Trivia: 10.30 was a T600/customer specific release that
provided 64-bit support before 11.00 was ready.

...
> Personally, I think the wide register support is most important
> when running a 64-bit kernel and that's the place it would be
> easiest to implement.  I can see that there are situations where
> it would be nice to use 64-bit registers on a narrow kernel but
> this would change the size of register files, the context passed
> to signal handlers, etc.

Oh..good point. I'm really not willing to tolerate an ABI event
for this kind of perf optimization. I'd much rather start advocating
use of 64-bit kernels in order to enable use of MAX insns.

Until HP 24-bit color gfx PCI cards work on pa2.0, I don't
see a good reason to implement this. Maybe 8-bit color with
a private color map is sufficient...


thanks,
grant

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
