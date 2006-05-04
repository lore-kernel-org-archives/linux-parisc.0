From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: hppa64-...-gcc-4.1 annoying pb?
Date: Thu, 4 May 2006 13:54:55 -0400 (EDT)
Message-ID: <200605041754.k44HstIl013281@hiauly1.hia.nrc.ca>
References: <20060504171043.GA1344@skunkworks.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: soete.joel@tiscali.be,
 parisc-linux@lists.parisc-linux.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060504171043.GA1344@skunkworks.cabal.ca> from "Kyle McMartin"
	at May 4, 2006 01:10:43 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Thu, May 04, 2006 at 12:35:32PM -0400, John David Anglin wrote:
> > Suggests that 4.1 has gone wild inlining.  To some extent, inlining
> > depends on the amount of memory present in the build machine.
> >
> 
> This is kind of a ridiculous assumption to make... Is there a way to
> disable it? 

Maybe, but I've seen it before.  With the default inline limits, the
program took more than 24 hours to compile.  With reduced limits, the
time was about 60 seconds.  Given that the complilation actually
succeeded, there's little else that can change compilation time in
such a dramatic manner.  If it's not inlining, there are various
other optimizations that can be disabled (e.g., -fno-loop-optimize).

It possible to get an indication as to where the problem lies by
running cc1 without -quiet.  This shows the elapsed time for each
pass at the end of the compilation.   You can see how to run cc1
for the compilation in question by using the -v option with gcc.

There's various options that change inlining behavior.

  -finline-limit=<number> Limits the size of inlined functions to <number>
  -finline-functions      Integrate simple functions into their callers

Inlining can be turned off using -fno-inline-functions.

The following change the model used for inlining:

  --param max-inline-insns-rtl=<value> The maximum number of instructions for the RTL inliner
  --param min-inline-insns=<value>     The number of instructions in a single functions still eligible to inlining after a lot recursive inlining
  --param max-inline-slope=<value>     The slope of the linear function throttling inlining after the recursive inlining limit has been reached is given by the negative reciprocal value of this parameter
  --param max-inline-insns=<value>     The maximum number of instructions by repeated inlining before gcc starts to throttle inlining
  --param max-inline-insns-auto=<value> The maximum number of instructions when automatically inlining
  --param max-inline-insns-single=<value> The maximum number of instructions in a single function eligible for inlining

In the above, the number of instructions refers to RTL instructions
rather than machine instructions.  The default settings are in the manual.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
