From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Comments?
Date: Wed, 2 Mar 2005 14:21:17 -0500
Message-ID: <20050302192111.GN23803@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org,
 John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
 Randolph Chung <tausq@debian.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


jda, tausq,

Comments on the assembly? 

I'm cleaning up the libc trampoline routines that are called during lazy
symbol resolution. We need to make changes to the profile version in
order to support library auditing.

The complete mechanics of this function call aren't that important, I'm
looking for comments on any ABI bits I missed.

For those that like to know mechanics:

a. In early ELF setup code we know we are going to use _dl_fixup from
   a particular shared object, so we plunk down the ltp for that code
   into the PLT.

b. Then when you call a function that hasn't been resolved you get
   bounced through the PLT to the trampoline, and not the function.
   This is lazy resolution. At startup we didn't bother to bind all
   the symbols, instead we filled the PLT with bounces to the trampoline
   routine (and eventually this leads to symbol resolution).

c. The bounce from the PLT to the trampoline is a bit of code at the
   end of the PLT. It loads up the following parameters and calls the
   trampoline with a non-standard non-abi function call (it doesn't 
   make a stack/frame or use the proper registers).

   Trampoline parameters:
	r19 = Relocation offset.
	r20 = Somwhere in the GOT (used to get your own link_map)
	r21 = _dl_fixup's PIC register value (ltp)

   Trampoline calls _dl_fixup with:
	r26 = got[1] (your own link_map)
	r25 = relocation offset

   If you are profiling:
	r24 = contains your rp.
	The stack has all the library auditing parameters.

d. _dl_fixup uses the relocation offset, and the link_map to find the
   symbol you need. Then it sets up the PLT so this doesn't happen
   again and then returns. 

   If we are profiling, there is the posibility that the code can call
   one of two functions PLTENTER or PLTEXIT. That is a user can register
   a set of functions to be called as you enter the PLT and as you exit 
   the PLT. This allows user code to audit the loading process.

   TODO: Working on this last bit, hence the note in the assemble.

e. Walking the bottom half of the trampoline restores the users
   arguments they were passing to the function in the first place
   and continues execution.

---

/* PLT trampolines. hppa version.
   Copyright (C) 2005 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

#include <sysdep.h>

/* This code gets called via the .plt stub, and is used in
   dl-runtime.c to call the `_dl_fixup' function and then redirect 
   to the    address it returns. `_dl_fixup' takes two
   arguments, however `_dl_profile_fixup' takes a number of 
   parameters for use with library auditing (LA).
   
   WARNING: This template is also used by gcc's __cffc, and expects
   that the "bl" for _dl_runtime_resolve exist at a particular offset.
   Do not change this template without changing gcc, while the prefix
   "bl" should fix everything so gcc finds the right spot, it will
   slow down __cffc when it attempts to call fixup to resolve function
   descriptor references. Please refer to gcc/gcc/config/pa/fptr.c
   
   Enter with r19 = reloc offset, r20 = got-8, r21 = fixup ltp.  */

	/* FAKE bl to provide gcc's __cffc with fixup loc. */
	.text
	bl	_dl_fixup, %r2
        .text
        .align 4
        .global _dl_runtime_resolve
        .type _dl_runtime_resolve,@function
_dl_runtime_resolve:
        .PROC
        .CALLINFO FRAME=64,CALLS,SAVE_RP,ENTRY_GR=3
        .ENTRY
        /* SAVE_RP says we do */
        stw %rp, -20(%sr0,%sp)

 	/* Save argument registers in the call stack frame. */
	stw	%r26,-36(%sp)
	stw	%r25,-40(%sp)
	stw	%r24,-44(%sp)
	stw	%r23,-48(%sp)

	/* Build a call frame, and save structure pointer. */
	copy	%sp, %r26	/* Copy previous sp */
	stwm	%r28,64(%sp)

	/* Fillin some frame info to follow ABI */
	stw	%rp,-20(%sp)	/* Set a reasonable rp */
	stw	%r26,-4(%sp)	/* Save previous sp */

 	/* Set up args to fixup func, needs only two arguments  */
	ldw	8+4(%r20),%r26		/* (1) got[1] == struct link_map */
	copy	%r19,%r25		/* (2) reloc offset  */

 	/* Call the real address resolver. */
	bl	_dl_fixup,%r2
	copy	%r21,%r19		/* set fixup func ltp */

	/* Load up the returned func ptr */
	ldw	0(%ret0),%r22		
	ldw	4(%ret0),%r19

	/* Adjust the stack */
	ldwm	-64(%sp),%r28

	/* Reload arguments. */
	ldw	-36(%sp),%r26
	ldw	-40(%sp),%r25
	ldw	-44(%sp),%r24
	ldw	-48(%sp),%r23

	/* Return */
	bv	%r0(%r22)
	ldw	-20(%sp),%r2
        .EXIT
        .PROCEND
	.size   _dl_runtime_resolve, . - _dl_runtime_resolve


	/* FIXME:
		Need to largely rewrite the bottom half of
		this code in order to save and restore the
		LA struct from the stack along with
		interpreted parameters.
	*/
        .text
        .align 4
        .global _dl_runtime_profile
        .type _dl_runtime_profile,@function
_dl_runtime_profile:
        .PROC
        .CALLINFO FRAME=64,CALLS,SAVE_RP,ENTRY_GR=3
        .ENTRY
        /* SAVE_RP says we do */
        stw %rp, -20(%sr0,%sp)

 	/* Save argument registers in the call stack frame. */
	stw	%r26,-36(%sp)
	stw	%r25,-40(%sp)
	stw	%r24,-44(%sp)
	stw	%r23,-48(%sp)

	/* Build a call frame, and save structure pointer. */
	copy	%sp, %r26	/* Copy previous sp */
	stwm	%r28,64(%sp)

	/* Fillin some frame info to follow ABI */
	stw	%rp,-20(%sp)	/* Set a reasonable rp */
	stw	%r26,-4(%sp)	/* Save previous sp */

 	/* Set up args to fixup func, needs three arguments  */
	ldw	8+4(%r20),%r26		/* (1) got[1] == struct link_map */
	copy	%r19,%r25		/* (2) reloc offset  */
	copy    %rp,%r24		/* (3) profile_fixup needs rp */

 	/* Call the real address resolver. */
	bl	_dl_profile_fixup,%rp
	copy	%r21,%r19		/* set profile_fixup func ltp */

	/* Load up the returned func ptr */
	ldw	0(%ret0),%r22		
	ldw	4(%ret0),%r19

	/* Adjust the stack */
	ldwm	-64(%sp),%r28

	/* Reload arguments. */
	ldw	-36(%sp),%r26
	ldw	-40(%sp),%r25
	ldw	-44(%sp),%r24
	ldw	-48(%sp),%r23

	/* Return */
	bv	%r0(%r22)
	ldw	-20(%sp),%r2
        .EXIT
        .PROCEND
	.size   _dl_runtime_profile, . - _dl_runtime_profile



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
