From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Non-inline math, and inline math broken,
	GCC to blame? (1 hppa tls toolchain regression).
Date: Sat, 16 Jul 2005 15:48:10 -0400 (EDT)
Message-ID: <200507161948.j6GJmAvc010734@hiauly1.hia.nrc.ca>
References: <20050716191646.GH5314@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050716191646.GH5314@systemhalted.org> from "Carlos O'Donell"
	at Jul 16, 2005 03:16:46 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> What sort of dependancy on CCFP? Do you have an example somewhere?

No.

  If your assembler instruction can alter the condition code register, add
  @samp{cc} to the list of clobbered registers.  GCC on some machines
  represents the condition codes as a specific hardware register;
  @samp{cc} serves to name this register.  On other machines, the
  condition code is handled differently, and specifying @samp{cc} has no
  effect.  But it is valid no matter what the machine.

Thinking a little more, I believe specifying "r0" in the clobber list
of the asm will do the job.  Register 0 is used to hold condition codes
for both integer and floating point comparisons.  I don't think there's
a way to express that the register is only used.  There's no constraint
letter for r0, etc.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
