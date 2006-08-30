From: "Joel Soete" <soete.joel@scarlet.be>
Subject: Re:[parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Wed, 30 Aug 2006 18:38:19 +0200
Message-ID: <J4TKVV$8AA4E9E98C79A1A2778C0CBF8A96F048@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: willy <willy@debian.org>,
 "James.Bottomley" <James.Bottomley@steeleye.com>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "carlos" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> A review of 'arch/parisc/kernel/time.c' and in particular
> 'timer_interrupt' and 'gettimeoffset'  show that this code has a
> couple of design flaws.
> 
> 1. cr16 is treated as signed.
> 2. No attempt is made to handle cr16 wrapping.
> 3. jiffies vs. wall_jiffies adjustment is incorrect.
> 
> I have rewritten 'timer_interrupt'.
> 
> A. cr16 is treated as an unsigned long.
> B. The following 3 scenarios exist.
> 
> 1. The timer interrupt fires, and 'now' comes after 'next_tick'
mmm (just a thought) what's up if now comes after next_tick but cr16 has
already wrap 1, 2, ... times?

> 2. The timer interrupt fires, and 'now' has wrapped and is before 'next=
_tick'
> 3. The timer interrupt fires, and 'now' is *just* before 'next_tick'
> 
> In theory 99% of the time we should be in scenario 1. On occasion we
> may miss a timer interrupt, end up close to wrapping, and we get
> scenario 2. Scenario 3 is just plain wrong and for now I will BUG() if
> the timer fires before we intended.
> 
> I have adjusted 'gettimeoffset' in the following fashion:
> 
> A. cr16 is treated as an unsigned long.
> B. Never ever ever return a negative adjustment.
> C. (jiffies - wall_jiffies) adjustment is always positive and added to =
usec.
> D. The 3 timer scenarios (same as above), exist.
> 
> I assert that 'gettimeoffset' should never return a negative value. It
> represents the postive adjustment accounting for the fact that we are
> *part* of the way through a tick.
> 
> The patch is attached. Please review. I booted this on my a500 without
> any problems. I don't really know how to look for problems so I ran
> the glibc testsuite and didn't get any extra regressions.
> 
> The real test will be to run this on a 715/50 and look for Guy's
> reported problems. Guy, would you mind patching your kernel with this
> patch and testing again?
> 
Make sense to me but patch doesn't works for me on b2k 32bit kernel ;-(
it was hanging (no error msg on lcd display) just after "Memory: 262144k
available" then I have to force reboot power off/on cycle.

Thanks,
    Joel

 
> Cheers,
> Carlos.
> 
> =0A=0A----------=0AClub Scarlet : Tout le monde gagne! Si vous devenez =
aujourd'hui Scarlet One grace a un client existant de Scarlet, vous recev=
ez tous les deux un cadeau d'une valeur de 50 euros! Surfez vite sur http=
://www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
