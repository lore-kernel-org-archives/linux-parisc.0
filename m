Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 429F3482D
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jun 2003 09:40:35 -0600 (MDT)
Message-Id: <200306191540.h5JFeWGN021982@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: g++ (3.3): ...Error: Field out of range
To: jsoe0708@tiscali.be (Joel Soete)
Date: Thu, 19 Jun 2003 11:40:32 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3ED70CF1000079C3@ocpmta2.freegates.net> from "Joel Soete" at Jun 19, 2003 03:27:33 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi Joel,

Putting me on the CC list of the PR would be appreciated.

> > I would suggest that the code being generated for this fuction
> > isn't going to be very good.  Whenever at function
> > exceeds 240KB in size, then GCC needs to generate long branches
> > for function calls and some internal branches.  These sequences
> > are much longer and less efficient.  You can tweak the parameter
> > of the GCC's inlining model and probably reduce the size of
> > the generated code.  The parameters are settable from the
> > command line and are documented in the manual, etc.
> 
> hmm I found well severall cmd line parameter concerning inline stuff and
> I was first tempted to test
> -finline-limit=225000 (doesn't help)
> -finline-limit=120000 (doesn't help more)
> too bad :-(

These are the options that provide detailed control for inlining:

  --param max-inline-insns-rtl=<value> The maximum number of instructions for the RTL inliner
  --param min-inline-insns=<value>     The number of instructions in a single functions still eligible to inlining after a lot recursive inlining
  --param max-inline-slope=<value>     The slope of the linear function throttling inlining after the recursive inlining limit has been reached is given by the negative reciprocal value of this parameter
  --param max-inline-insns=<value>     The maximum number of instructions by repeated inlining before gcc starts to throttle inlining
  --param max-inline-insns-auto=<value> The maximum number of instructions when automatically inlining
  --param max-inline-insns-single=<value> The maximum number of instructions in a single function eligible for inlining

The RTL is not used by C or C++ anymore.  Look in the GCC file params.def
for the defaults and discussion.  I think reducing PARAM_MAX_INLINE_INSNS
from its default of 600 to something in the range of 200-300, or less will
help.  You might also make the slope more aggressive.  I know that changes
are needed to build LyX (see <http://gcc.gnu.org/PR?10160>).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
