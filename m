From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH] hppa-linux-gas binutils patch
Date: Sun, 26 Nov 2006 20:34:02 -0500 (EST)
Message-ID: <200611270134.kAR1Y2k0025862@hiauly1.hia.nrc.ca>
References: <119aab440611261406t3b221212seec90894cd57c63d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: deller@gmx.de,
 dave.anglin@nrc.ca,
 parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <119aab440611261406t3b221212seec90894cd57c63d@mail.gmail.com> from "Carlos O'Donell" at Nov 26, 2006 05:06:04 pm
List-ID: <linux-parisc.vger.kernel.org>

> The GAS manual says:
> ---
> .equ symbol, expression
> This directive sets the value of symbol to expression. It is
> synonymous with `.set'; see section .set symbol, expression.
> The syntax for equ on the HPPA is `symbol .equ expression'.
> ---
> 
> This should be updated.
> 
> Have you considered the implications of your patch to porting HPUX assembly?
> Does the HPUX assembler have an .equ directive? Dave can probably
> answer that so I'll CC him.
> 
> ---
> label .reg expr
>     Synonym for .equ; define label with the absolute expression expr
> as its value.
> ---
> 
> In summary... if you provide a documentation patch I'll test this and
> submit upstream. When upstreams gives the green flag I'll check this
> into binutils head.

This needs testing on hpux.  I believe there may be problems.
The current implementation reflects the syntax for .equ using HP as.

The HP assembler only allows an integer expression which evalutes
to an absolute value.  The HP assembler prohibits the use of
relocatable labels and imported symbols as a component of a
.equ expression.  This reflected the capabilites of HP ld at
one time.  This may not reflect current capabilites.  There may
be differences between the 32 and 64-bit linkers.  I'm cautious
here as I know .set which has no HP assembler equivalent works
most of the time, but the capabilities of HP ld aren't well
documented and there are subtle issues in assigning aliases.
There are some uses of .set in the gas testsuite which run under
hpux and they seem to work at basic level.  However, the weak
alias stuff isn't useful under hpux because of the way HP ld
handles "weak" symbols.

On the otherhand, more latitude on the expression is allowed when
GNU ld is being used.  .equ is effectively a synonym for .set.  
Because of this, I haven't been too concerned about the syntax
for .equ.  There are various other directives that also follow the
HP syntax.  In summary, these probably should be changed to follow
the standard behavior under linux, etc; but I think the current
behavior should be retained under hpux.

Sorry, I haven't had a chance to look at the details of your change.
I've been busy and a few GCC targets are broken...

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
