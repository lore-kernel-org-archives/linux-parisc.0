Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA06113
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Dec 2000 21:08:32 -0700
Received: from upchuck.cygnus.com (taarna.cygnus.com [205.180.230.102])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id UAA01151
	for <parisc-linux@thepuffingroup.com>; Tue, 5 Dec 2000 20:11:06 -0800 (PST)
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
cc: alan@linuxcare.com.au, gcc-bugs@gcc.gnu.org, gcc-patches@gcc.gnu.org,
        parisc-linux@thepuffingroup.com
Subject: Re: testcase for hppa64 gcc bug 
Reply-To: law@redhat.com
In-reply-to: Your message of Thu, 09 Nov 2000 12:39:57 EST.
             <200011091739.MAA07483@hiauly1.hia.nrc.ca>
From: Jeffrey A Law <law@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 05 Dec 2000 21:12:46 -0700
Message-ID: <17409.976075966@upchuck>
Sender: law@cygnus.com
List-ID: <linux-parisc.vger.kernel.org>


  In message <200011091739.MAA07483@hiauly1.hia.nrc.ca>you write:
  > For the record, here is my final patch regarding making the arg_pointer
  > eliminable for TARGET_64BIT.  I think the code it generates is correct but
  > it hasn't been extensively tested.  However, I don't recommend it for
  > installation since in comparing the assembler code generated with and
  > without elimination for a couple of test cases, I didn't observe any
  > significant improvement in the code with the patch.  Possibly, the patch
  > implicitly disables elimination when the arg_pointer is needed.
  > 
  > I do find that Alan Modra's ARG_POINTER_INVARIANT patch needs to be install
  > ed
  > to get correct code with his test case.
  > 
  > There is one part of the patch below which I think needs to be installed.
  > That is
  > 
  > 	(call, call_value): Always USE the arg_pointer for TARGET_64BIT.
  > 
  > The use for the arg_pointer needs to be pulled out of the `if (flag_pic)'.
  > 
  > Dave
  > -- 
  > J. David Anglin                                  dave.anglin@nrc.ca
  > National Research Council of Canada              (613) 990-0752 (FAX: 952-6
  > 605)
  > 
  > 2000-11-07  John David Anglin  <dave@hiauly1.hia.nrc.ca>
  > 
  > 	* pa-linux64.h (ARG_POINTER_INVARIANT): Define even when the
  > 	arg_pointer is being eliminated.
  > 	(ELIMINABLE_REGS): Enable elimination of the arg_pointer.
  > 	(INITIAL_ELIMINATION_OFFSET): Revise offsets for arg_pointer.
  > 	* pa.md (mulsi3, divsi3, udivsi3, modsi3, umodsi3 and
  > 	canonicalize_funcptr_for_compare): Put "(reg:SI 26)" inside
  > 	unspec to prevent elimination.
  > 	(call, call_value): Always USE the arg_pointer for TARGET_64BIT.
  > 	Use the new addmovdi3 insn to load the arg_pointer register.
  > 	(addmovdi3 and mov_from_r29_si): New insn and expand which prevent
  > 	r29 from being eliminated in call setups and millicode returns.
I haven't followed this discussion too closely.  Is this patch still needed
after some of the recent changes in how we compute liveness for the argument
pointer?
jeff
