Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA06461
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Dec 2000 21:12:47 -0700
Message-Id: <200012060415.XAA19968@hiauly1.hia.nrc.ca>
Subject: Re: testcase for hppa64 gcc bug
To: law@redhat.com
Date: Tue, 5 Dec 2000 23:14:59 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, gcc-bugs@gcc.gnu.org, gcc-patches@gcc.gnu.org,
        parisc-linux@thepuffingroup.com
In-Reply-To: <17409.976075966@upchuck> from "Jeffrey A Law" at Dec 5, 2000 09:12:46 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

>   > 2000-11-07  John David Anglin  <dave@hiauly1.hia.nrc.ca>
>   > 
>   > 	* pa-linux64.h (ARG_POINTER_INVARIANT): Define even when the
>   > 	arg_pointer is being eliminated.
>   > 	(ELIMINABLE_REGS): Enable elimination of the arg_pointer.
>   > 	(INITIAL_ELIMINATION_OFFSET): Revise offsets for arg_pointer.
>   > 	* pa.md (mulsi3, divsi3, udivsi3, modsi3, umodsi3 and
>   > 	canonicalize_funcptr_for_compare): Put "(reg:SI 26)" inside
>   > 	unspec to prevent elimination.
>   > 	(call, call_value): Always USE the arg_pointer for TARGET_64BIT.
>   > 	Use the new addmovdi3 insn to load the arg_pointer register.
>   > 	(addmovdi3 and mov_from_r29_si): New insn and expand which prevent
>   > 	r29 from being eliminated in call setups and millicode returns.
> I haven't followed this discussion too closely.  Is this patch still needed
> after some of the recent changes in how we compute liveness for the argument
> pointer?

I think this needs to be reexamined.  Allan's ARG_POINTER_INVARIANT patch
might not be needed now.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
