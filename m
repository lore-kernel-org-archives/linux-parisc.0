From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] HCRX-24 and missing consoles on my C200
Date: Mon, 19 Dec 2005 16:39:43 +0100
Message-ID: <200512191639.44027.deller__44830.519174184$1416624576$gmane$org@gmx.de>
References: <43971676.1010009@gmail.com> <1354.193.160.141.5.1134039392.squirrel@www.puszczka.com> <20051208173922.GA2515@ntlworld.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: Stuart Brady <sdbrady@ntlworld.com>,
 Andy Walker <andy@puszczka.com>,
 parisc-linux@parisc-linux.org
To: debian-hppa@lists.debian.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <20051208173922.GA2515@ntlworld.com>
Resent-Message-ID: <Kc7ORD.A.pvE._QtpDB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

Hi all,

On Thursday 08 December 2005 18:39, Stuart Brady wrote:
> On Thu, Dec 08, 2005 at 11:56:32AM +0100, Andy Walker wrote:
> > Note that the A4071B/HCRX24 gets detected just fine. Its set in PDC as
> > the console path, and also via the sti=8/8 parameter.
> > 
> > Nothing crashes, but the console is unusable. Most of the output is
> > black on black, though I get bits of text in magenta, yellow and green
> > depending on the intended colour. Tux has a bright green background and
> > is otherwise pretty psychedelic. Back to Vis-EG for the time being.
> 
> Have you tried running X, and then switching back to the console?  That
> at least gets it working for me...  I wonder which devices are affected
> by this?  What about the A4071A?

Hi all,

I just committed a patch to stifb in kernel 2.6.15-rc6-pa1.
Could you please try this one? It works for me... :-)

Stuart's hint with starting X and then switching back again pointed to a bug in the palette handling of stifb, which I hopefully fixed now.

X11 still only shows me 3/4 of the screen, but this seems to be another problem....

Regards,
Helge


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
