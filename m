From: Stuart Brady <sdbrady@ntlworld.com>
Subject: Re: [parisc-linux] HCRX-24 and missing consoles on my C200
Date: Thu, 8 Dec 2005 17:39:22 +0000
Message-ID: <20051208173922.GA2515__35530.4849138067$1416624574$gmane$org@ntlworld.com>
References: <43971676.1010009@gmail.com> <20051207180130.GB11417@colo.lackof.org> <20051207182913.GB32168@quicksilver.road.mcmartin.ca> <1354.193.160.141.5.1134039392.squirrel@www.puszczka.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: Andy Walker <andy@puszczka.com>,
 parisc-linux@parisc-linux.org,
 debian-hppa@lists.debian.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <1354.193.160.141.5.1134039392.squirrel@www.puszczka.com>
Resent-Message-ID: <1b2AgB.A.mSG.S_GmDB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Thu, Dec 08, 2005 at 11:56:32AM +0100, Andy Walker wrote:
> Note that the A4071B/HCRX24 gets detected just fine. Its set in PDC as
> the console path, and also via the sti=8/8 parameter.
> 
> Nothing crashes, but the console is unusable. Most of the output is
> black on black, though I get bits of text in magenta, yellow and green
> depending on the intended colour. Tux has a bright green background and
> is otherwise pretty psychedelic. Back to Vis-EG for the time being.

Have you tried running X, and then switching back to the console?  That
at least gets it working for me...  I wonder which devices are affected
by this?  What about the A4071A?

I've tried reading the stifb source but I'm quite baffled by it. :-(
-- 
Stuart Brady


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
