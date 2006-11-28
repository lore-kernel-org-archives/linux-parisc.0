From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] [PATCH] hppa-linux-gas binutils patch
Date: Tue, 28 Nov 2006 20:20:26 +0100
Message-ID: <200611282020.26412.deller@gmx.de>
References: <200611270134.kAR1Y2k0025862@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: dave.anglin@nrc.ca,
 parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200611270134.kAR1Y2k0025862@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Dave,
Hi Carlos,

Somehow I lost Carlos answer to my mail, so I'll wind his questions and my answers in here:

Carlos> Out of curiosity do you have a copyright assignment for binutils? 
Carlos> If not, then that is OK, I can submit your patch upstream
Carlos> and check it in aswell.

I'm right now in the process to get this assignment done.
Since I think this will take some time, I'd prefer if you could submit 
it upstream (if everyone agrees).


On Monday 27 November 2006 02:34, John David Anglin wrote:
> > The GAS manual says:
> > ---
> > .equ symbol, expression
> > This directive sets the value of symbol to expression. It is
> > synonymous with `.set'; see section .set symbol, expression.
> > The syntax for equ on the HPPA is `symbol .equ expression'.
> > ---
> > 
> > This should be updated.

Sure.
I'll send an updated patch soon.

> > Have you considered the implications of your patch to porting HPUX assembly?
> > Does the HPUX assembler have an .equ directive? Dave can probably
> > answer that so I'll CC him.
> > 
> > ---
> > label .reg expr
> >     Synonym for .equ; define label with the absolute expression expr
> > as its value.
> > ---
> > 
> This needs testing on hpux.  I believe there may be problems.
> The current implementation reflects the syntax for .equ using HP as.
> 
> The HP assembler only allows an integer expression which evalutes
> to an absolute value.  The HP assembler prohibits the use of
> relocatable labels and imported symbols as a component of a
> .equ expression.  This reflected the capabilites of HP ld at
> one time.  This may not reflect current capabilites.  There may
> be differences between the 32 and 64-bit linkers.  I'm cautious
> here as I know .set which has no HP assembler equivalent works
> most of the time, but the capabilities of HP ld aren't well
> documented and there are subtle issues in assigning aliases.
> There are some uses of .set in the gas testsuite which run under
> hpux and they seem to work at basic level.  However, the weak
> alias stuff isn't useful under hpux because of the way HP ld
> handles "weak" symbols.
> 
> On the otherhand, more latitude on the expression is allowed when
> GNU ld is being used.  .equ is effectively a synonym for .set.  
> Because of this, I haven't been too concerned about the syntax
> for .equ.  There are various other directives that also follow the
> HP syntax.  In summary, these probably should be changed to follow
> the standard behavior under linux, etc; but I think the current
> behavior should be retained under hpux.
> 
> Sorry, I haven't had a chance to look at the details of your change.
> I've been busy and a few GCC targets are broken...

The patch only affects the .equ directive. It does not change .set in any way.
It will only allow the case of:
		.equ VAR,VALUE
which was printing an error message before.
So, it doesn't change any currently existing behavior. 
Instead it's only adding a "new way" to use the .equ directive in a typical "gas" way.

As a background story:
Originally I wanted to add support for
VAR		.equ  VALUE
as it's e.g. documented here: http://docs.hp.com/en/92432-90012/ch02.html
(JAN   .equ  1).
But this is in contrast to what gas (in as.info) states, since it does not end with a colon:
"  For HPPA targets, labels need not be immediately followed by a
"colon, but the definition of a label must begin in column zero.  This
"also implies that only one label may be defined on each line.
"    label:     .directive    followed by something
...
Sadly I until now failed to get  this working as well :-(

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
