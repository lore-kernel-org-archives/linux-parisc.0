From: Michel Lespinasse <walken@google.com>
Subject: Re: possible virtual aliasing issues on parisc ?
Date: Sun, 4 Nov 2012 17:54:03 -0800
Message-ID: <CANN689GfUiECXxCkQUo42OmLfg5yhziQ2YrD+xn7eWzZSWwk_Q@mail.gmail.com>
References: <CANN689E4p3woSkdLavyyPA2gZUmVvOAW4w0R6fo9exRPQDa=JA@mail.gmail.com>
	<1351848864.2439.18.camel@dabdike.int.hansenpartnership.com>
	<1351854504.2439.20.camel@dabdike.int.hansenpartnership.com>
	<CANN689HPeQhYCDcFenTH35iBL8zV7vpHvsQUJQOD=Vz3Z9D3bQ@mail.gmail.com>
	<1351859453.2439.24.camel@dabdike.int.hansenpartnership.com>
	<BLU0-SMTP69F46452FE3E7DDDF6109997640@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP69F46452FE3E7DDDF6109997640@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Nov 4, 2012 at 4:29 PM, John David Anglin <dave.anglin@bell.net> wrote:
> I have the sense that this may fix
> http://thread.gmane.org/gmane.linux.ports.parisc/4027/focus=4278
> as I haven't seen the problem since I added the above change to my
> patch list.

I don't have parisc machines myself to test on; however if you could
confirm that this workload does cause arch_get_unmapped_area() to be
called with (flags & MAP_SHARED) set and (pgoff % 1024) != 0, I think
this would be a good enough smoking gun to blame the bug on this.

Regarding fixes: I'm going to try and send my vma gap finder patchset
this week for possible integration into andrew's -mm tree. There will
be one parisc patch in that set which will include the fix for this
coloring issue. Of course, feel free to apply James's minimal fix
before then; I am just sending this heads up as we're likely to end up
with a conflict between both fixes in -next if we go that way :)

-- 
Michel "Walken" Lespinasse
A program is never fully debugged until the last user dies.
