From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH] hppa-linux-gas binutils patch
Date: Thu, 30 Nov 2006 10:46:33 -0500 (EST)
Message-ID: <200611301546.kAUFkXkZ003953__45492.6423299641$1416624224$gmane$org@hiauly1.hia.nrc.ca>
References: <200611282020.26412.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: dave.anglin@nrc.ca,
 parisc-linux@lists.parisc-linux.org
To: deller@gmx.de (Helge Deller)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200611282020.26412.deller@gmx.de> from "Helge Deller" at Nov 28, 2006 08:20:26 pm
List-ID: <linux-parisc.vger.kernel.org>

> It will only allow the case of:
> 		.equ VAR,VALUE
> which was printing an error message before.
> So, it doesn't change any currently existing behavior. 

It adds new behavior which was previously invalid.  The above syntax
isn't valid using HP as and previously gas syntax mirrored the HP
syntax.  So, you have to convince the binutils maintainers that the
above extension is compatible with what exists now.  For example,

LABEL:	.equ VALUE
	.equ VAR,VALUE
LABEL1: .equ VAR,VALUE	; ???

Do these all work correctly?

> As a background story:
> Originally I wanted to add support for
> VAR		.equ  VALUE
> as it's e.g. documented here: http://docs.hp.com/en/92432-90012/ch02.html
> (JAN   .equ  1).
> But this is in contrast to what gas (in as.info) states, since it does not end with a colon:
> "  For HPPA targets, labels need not be immediately followed by a
> "colon, but the definition of a label must begin in column zero.  This
> "also implies that only one label may be defined on each line.
> "    label:     .directive    followed by something
> ...
> Sadly I until now failed to get  this working as well :-(

I believe the labels must be followed by followed by a colon on linux.
On hpux, the colon is optional.  HP as wants no colon.  Note that labels
don't have to be on the same line as the directive.  Thus, I believe that

label:	.equ	VALUE

should work on linux.

I'm not sure the in comment in as.info about only one label per line
is correct.  There's a line termination character that allows multiple
directives per line.  It's useful in macros.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
