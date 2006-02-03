From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [patch 12/44] generic sched_find_first_bit()
Date: Thu, 2 Feb 2006 20:58:22 -0700
Message-ID: <20060203035822.GA12539__40484.688364859$1416624583$gmane$org@colo.lackof.org>
References: <20060201090224.536581000@localhost.localdomain>
	<20060201090325.497639000@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: linux-mips@linux-mips.org,
 linux-ia64@vger.kernel.org,
 Ian Molton <spyro@f2s.com>,
 Andi Kleen <ak@suse.de>,
 David Howells <dhowells@redhat.com>,
 linuxppc-dev@ozlabs.org,
 Greg Ungerer <gerg@uclinux.org>,
 sparclinux@vger.kernel.org,
 Miles Bader <uclinux-v850@lsi.nec.co.jp>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Hirokazu Takata <takata@linux-m32r.org>,
 linuxsh-shmedia-dev@lists.sourceforge.net,
 Linus Torvalds <torvalds@osdl.org>,
 Chris Zankel <chris@zankel.net>,
 dev-etrax@axis.com,
 ultralinux@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org,
 linuxsh-dev@lists.sourceforge.net,
 linux390@de.ibm.com,
 Russell King <rmk@arm.linux.org.uk>,
 parisc-linux@parisc-linux.org
To: Akinobu Mita <mita@miraclelinux.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060201090325.497639000@localhost.localdomain>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Feb 01, 2006 at 06:02:36PM +0900, Akinobu Mita wrote:
> This patch introduces the C-language equivalent of the function:
> int sched_find_first_bit(const unsigned long *b);

Akinobu, would you prefer this is a slightly cleaner way?
(Not compile tested)

static inline int sched_find_first_bit(const unsigned long *b)
{
	if (unlikely(b[0]))
		return __ffs(b[0]);
	if (unlikely(b[1]))
		return __ffs(b[1]) + BITS_PER_LONG;
#if BITS_PER_LONG == 32
	if (unlikely(b[2]))
		return __ffs(b[2]) + 64;
	if (b[3])
		return __ffs(b[3]) + 96;
#endif
	return __ffs(b[128/BITS_PER_LONG]) + 128;
}

If BITS_PER_LONG isn't defined, the link step will fail and point
at a some unknown .o as the offender. But it's the responsibility
of the header file to make sure it's including the BITS_PER_LONG
definition, not the code that calls sched_find_first_bit().

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
