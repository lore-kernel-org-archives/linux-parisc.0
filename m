From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Re: Comments?
Date: Wed, 2 Mar 2005 21:45:52 -0500
Message-ID: <20050303024545.GR23803@baldric.uwo.ca>
References: <20050302213755.GQ23803@baldric.uwo.ca>
	<200503022238.j22Mcftt011620@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503022238.j22Mcftt011620@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Mar 02, 2005 at 05:38:41PM -0500, John David Anglin wrote:
> > To be truthful I'm only saving r28 because in the legacy code we saved
> > r28. I didn't know our toolchain used r28 for function entry or r29 for
> > function entry.
> 
> Yes, it uses both.  I now see that the code is saving and
> restoring r28.

Yes, I store/load it into/from the stack.  I like stwm since it
automatically adjusts the stack and gives you a free register to play
with.
 
> r28 is used to pass the return address for structures larger
> than 8 bytes.  Use of r29 on input is fairly rare.

Ok.
 
> GCC will clobber r28 and r29.  Thus, you need to save both.

Ok. I will save both.

> > What do I do about the floating point registers?
> 
> Hmmm, there is one circumstance where floating point registers
> can be used in integer code.  That's for the xmpyu instruction.
> Thus, you should either save the argument registers, or compile
> the code that does symbol resolution using -mdisable-fpregs,
> or with GCC 4.0 or later compile with -mfixed-range specifying
> the fp argument registers as fixed.  The latter will stop GCC
> from using the argument fp argument registers.  Since the path
> is only used once per function call, it's probably best to save
> all the possible argument registers.

There are a lot of files that do symbol resolution. I think I might just
save the fp argument registers, and thus allow gcc to do any sorts of
optimizations it wishes with therest of the code, knowing that the
arguments are all saved and restored on the initial function call.

Thanks.


I have to get all the LA patches added. Test that. Then add the cfi
directives and test Randolphs cfi patch.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
