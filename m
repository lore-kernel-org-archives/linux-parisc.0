Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2B2D0482D
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jun 2003 11:27:31 -0600 (MDT)
Date: Thu, 19 Jun 2003 19:27:25 +0200
Message-ID: <3ED70CF100007B7A@ocpmta2.freegates.net>
In-Reply-To: <200306191540.h5JFeWGN021982@hiauly1.hia.nrc.ca>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Re: g++ (3.3): ...Error: Field out of range
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hey Dave,

> Putting me on the CC list of the PR would be appreciated.

May be have you already recieved this:
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=11254


[...]
> These are the options that provide detailed control for inlining:
>
>   --param max-inline-insns-rtl=<value> The maximum number of instructions
for
> the RTL inliner
>   --param min-inline-insns=<value>     The number of instructions in a
single
> functions still eligible to inlining after a lot recursive inlining
>   --param max-inline-slope=<value>     The slope of the linear function

> throttling inlining after the recursive inlining limit has been reached
is 
> given by the negative reciprocal value of this parameter
>   --param max-inline-insns=<value>     The maximum number of instructions
by
>  repeated inlining before gcc starts to throttle inlining
>   --param max-inline-insns-auto=<value> The maximum number of instructions
>  when automatically inlining
>   --param max-inline-insns-single=<value> The maximum number of instructions
>  in a single function eligible for inlining

> The RTL is not used by C or C++ anymore.  Look in the GCC file params.def
> for the defaults and discussion.  I think reducing PARAM_MAX_INLINE_INSNS
> from its default of 600 to something in the range of 200-300, or less will
> help.  You might also make the slope more aggressive.  I know that changes
> are needed to build LyX (see <http://gcc/gnu.org/PR?10160>).

Ah, in fact I well read it also but do not figure out because of man comment:
"max-inline-insns
    If an function contains more than this many instructions, it
    will not be inlined.  This option is precisely equivalent to
    -finline-limit.
"

Anyway, I try 300, 200, 100 and stop at 50 without any more success :-(
(I can still try lower?)

Thanks again for all,
    Joel


---------------------------------
Tiscali ADSL: 19,50 euros/mois...abonnez-vous sur www.tiscali.be
