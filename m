From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: Comments?
Date: Wed, 2 Mar 2005 17:38:41 -0500 (EST)
Message-ID: <200503022238.j22Mcftt011620@hiauly1.hia.nrc.ca>
References: <20050302213755.GQ23803@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050302213755.GQ23803@baldric.uwo.ca> from "Carlos O'Donell" at
	Mar 2, 2005 04:37:55 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Wed, Mar 02, 2005 at 02:41:44PM -0500, John David Anglin wrote:
> > > 	/* Build a call frame, and save structure pointer. */
> > > 	copy	%sp, %r26	/* Copy previous sp */
> > > 	stwm	%r28,64(%sp)
> > 
> > r28?  I'm thinking that the static chain (r29) and struct value
> > (r28) registers need to be saved as well as r23-r26.
> 
> To be truthful I'm only saving r28 because in the legacy code we saved
> r28. I didn't know our toolchain used r28 for function entry or r29 for
> function entry.

Yes, it uses both.  I now see that the code is saving and
restoring r28.

> Are you suggesting this because we could use them in the future?
> 
> I know that r29 is the "static link register" for entry.
> I don't understand the full purpose of r28 which is the "function result
> address" on entry.

r28 is used to pass the return address for structures larger
than 8 bytes.  Use of r29 on input is fairly rare.

GCC will clobber r28 and r29.  Thus, you need to save both.

> What do I do about the floating point registers?

Hmmm, there is one circumstance where floating point registers
can be used in integer code.  That's for the xmpyu instruction.
Thus, you should either save the argument registers, or compile
the code that does symbol resolution using -mdisable-fpregs,
or with GCC 4.0 or later compile with -mfixed-range specifying
the fp argument registers as fixed.  The latter will stop GCC
from using the argument fp argument registers.  Since the path
is only used once per function call, it's probably best to save
all the possible argument registers.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
