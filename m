Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA22475
	for <parisc-linux@puffin.external.hp.com>; Thu, 14 Dec 2000 09:37:56 -0700
Message-Id: <200012141640.LAA03285@hiauly1.hia.nrc.ca>
Subject: Re: pa reload problem
To: law@redhat.com
Date: Thu, 14 Dec 2000 11:40:04 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: rth@redhat.com, alan@linuxcare.com.au, rhirst@linuxcare.com,
        parisc-linux@thepuffingroup.com, gcc-bugs@gcc.gnu.org
In-Reply-To: <20289.976765412@upchuck> from "Jeffrey A Law" at Dec 13, 2000 08:43:32 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

>   In message <200012140048.TAA02603@hiauly1.hia.nrc.ca>you write:
>   > I have made some progress in locating this bug but still don't have a
>   > complete understanding of the problem.  The problem is that a code_label
>   > insn is "incorrectly" deleted in the loop pass.  Here is the rtl from
>   > the gcse pass:
>   > 
>   > [snip]
>   > 
>   > (code_label 1158 1268 1439 124 "" "" [3 uses])
>   > 
>   > (note 1439 1158 262 [bb 12] NOTE_INSN_BASIC_BLOCK -1347440721)
>   > 
>   > (note 262 1439 1159 85 NOTE_INSN_EH_REGION_END -1347440721)
>   > 
>   > [snip]
>   > 
>   > (insn 788 787 789 (set (reg/f:SI 209)
>   >         (high:SI (label_ref:SI 1158))) 87 {*pa.md:2435} (nil)
>   >     (expr_list:REG_EQUAL (high:SI (label_ref:SI 1158))
>   >         (insn_list:REG_LABEL 1158 (nil))))
>   > 
>   > (insn 789 788 791 (set (reg/f:SI 208)
>   >         (lo_sum:SI (reg/f:SI 209)
>   >             (label_ref:SI 1158))) 90 {*pa.md:2467} (nil)
>   >     (insn_list:REG_LABEL 1158 (expr_list:REG_EQUAL (label_ref:SI 1158)
>   >             (nil))))
>   > 
>   > Here is the rtl after loop:
>   > 
>   > Loop from 576 to 1288: 105 real insns.
>   > Continue at insn 1278.
>   > 
>   > [snip]
>   > 
>   > Insn 788: regno 209 (life 2), move-insn savings 2  moved to 1530
>   > Insn 789: regno 208 (life 1), move-insn forces 788 savings 1  moved to 1532
>   > 
>   > [snip]
>   > 
>   > (insn 1531 1528 1532 (set (reg/f:SI 337)
>   >         (high:SI (label_ref:SI 1158))) -1 (nil)
>   >     (expr_list:REG_LABEL (code_label/v 1158 1268 1439 124 "" "" [0 uses])
>   >         (nil)))
>   > 
>   > (insn 1532 1531 1535 (set (reg/f:SI 208)
>   >         (lo_sum:SI (reg/f:SI 337)
>   >             (label_ref:SI 1158))) -1 (nil)
>   >     (expr_list:REG_EQUAL (label_ref:SI 1158)
>   >         (expr_list:REG_LABEL (code_label/v 1158 1268 1439 124 "" "" [0 uses
>   > ])
>   >             (nil))))
>   > 
>   > The code_label 1158 is deleted by delete_trivially_dead_insns apparently 
>   > because the preceding call to loop_optimize in toplev.c has reduced the
>   > number of uses to 1.  Maybe somebody can see how this occurs.
> Seems to me we have a reference counting problem.  There is clearly 
> a reference to label 1158 (insn 1531/1532), but it's reference count
> is zero.

That's what I thought.  It would appear to occur when the above two insns
get moved out of a loop.  The count gets decremented when the old insns
are deleted but not incremented when the new insns are created.  The puzzle
is why the count is zero rather than 1.  Maybe what happens is the two
insns in the loop are deleted first, then the label is deleted?  Notice
that insn 788 is moved to insn 1530.  However, the insn becomes 1531 and
the reg changes to 337 from 208.

I will try to step through the code later.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
