From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Wed, 22 Jun 2005 23:23:20 -0400 (EDT)
Message-ID: <200506230323.j5N3NKB9019108@hiauly1.hia.nrc.ca>
References: <42B9C20E.3090409@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42B9C20E.3090409@tiscali.be> from "Joel Soete" at Jun 22,
	2005 07:54:54 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Sorry to come back so late with this question but what would be the range of fp registers?
> or how may I try to define it as accurately as possible?
> (I objdump a operating 2.6.12-rc.-pa. 64bit to grep some 'fr[12][0..9]' and all of them seems to be used?
> Do I have to look elsewhere; tausq also spoke about: sic
> [...]One proposal that has been talked about before is if we can
> compile a version of the millicode lib that uses limited fpregs range
> and compile the kernel using this new option that Dave is talking about,
> then we will be able to get by using a (much) smaller subset of fp regs
> and we won't have to save/restore them in the kernel. )

/* Parse the -mfixed-range= option string.  */

static void
fix_range (const char *const_str)
{
  int i, first, last;
  char *str, *dash, *comma;

  /* str must be of the form REG1'-'REG2{,REG1'-'REG} where REG1 and
  REG2 are either register names or register numbers.  The effect
  of this option is to mark the registers in the range from REG1 to
  REG2 as ``fixed'' so they won't be used by the compiler.  This is
  used, e.g., to ensure that kernel mode code doesn't use f32-f127.  */

You are probably best to use register names.  There are 28 fp registers
starting at fr4.  The number for fr4 is 32.  I see there is a typo
in the comment regarding the range, "f32-f127".  This is a cut and
paste error.

The millicode routines don't use the fp regs.  However, libgcc does
and the kernel is linked against libgcc.  Thus, for this to work, you
will need to build both a kernel build version of gcc and the kernel
with the -mfixed-range option.  You probably want to leave about four
fp registers unfixed for integer multiplcation.  This is essential on
hppa64 as we don't have millicode support for 64-bit integer
multiplication.  This support is provided by libgcc routines.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
