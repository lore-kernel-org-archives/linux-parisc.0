From: Colin Watson <cjwatson@debian.org>
Subject: [parisc-linux] Re: Bug#254073: tc1 fail on hppa
Date: Sun, 13 Jun 2004 18:24:50 +0100
Message-ID: <20040613172450.GA24029__25298.0978032157$1416623471$gmane$org@riva.ucam.org>
References: <20040612193756.GA351@mcmartin.ca>
	<20040613122501.GH31518@riva.ucam.org>
	<20040613164147.GC351@mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: 254073@bugs.debian.org,
 parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@debian.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040613164147.GC351@mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jun 13, 2004 at 12:41:47PM -0400, Kyle McMartin wrote:
> On Sun, Jun 13, 2004 at 01:25:01PM +0100, Colin Watson wrote:
> > base-installer has no intelligence about hppa, and it should. How would
> > one go about detecting whether the 32-bit or the 64-bit kernel is
> > appropriate? Is it OK to install SMP kernels regardless, or do we need
> > to detect UP vs. SMP too?
> 
> Hmm. It's a problem because the firmware of some machines will only
> boot 64-bit kernels, some will only boot 32-bit, and some will boot
> either.
> 
> The best thing to do, would be to always install 32bit by default. As
> when a person tries to boot on a machine that only has 64-bit firmware,
> they will have to manually edit the PALO commandline to use vmlinux64, which
> will result in them having a parisc64 uname -m entry. So I'd think 
> install based on the uname -m entry would work.

OK, that's something we can do. I'm buried in base-installer at the
moment anyway, so I'll have a go at this.

> There's no problem, afaik, booting SMP on UP machines, so that should be
> fine.

Good. That matches some other architectures.

> I'm going to copy the parisc-linux list with this, for comments.

Note that I don't read this list, so please be sure to copy
254073@bugs.debian.org on replies.

Thanks,

-- 
Colin Watson                                  [cjwatson@flatline.org.uk]
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
