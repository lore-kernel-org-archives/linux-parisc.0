Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA31057
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Dec 2000 12:40:28 -0700
Message-Id: <200012051942.OAA24760@hiauly1.hia.nrc.ca>
Subject: Re: pa reload problem
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Tue, 5 Dec 2000 14:42:50 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, law@cygnus.com, rhirst@linuxcare.com,
        parisc-linux@thepuffingroup.com
In-Reply-To: <200012022328.SAA04574@hiauly1.hia.nrc.ca> from "John David Anglin" at Dec 2, 2000 06:28:16 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> I reverted the pic patch that I was testing and still get the same build
> failure when building with "-g -O3 -fPIC".
...
> stage1/xgcc -Bstage1/ -B/usr/local/hppa1.1-hp-hpux10.20/bin/ -c  -DIN_GCC    -g -O3 -fPIC -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wtraditional -pedantic -Wno-long-long  -DHAVE_CONFIG_H    -I. -I. -I../../gcc -I../../gcc/. -I../../gcc/config -I../../gcc/../include ../../gcc/c-typeck.c -o c-typeck.o
> ../../gcc/c-typeck.c: In function `really_start_incremental_init':
> ../../gcc/c-typeck.c:5180: output_operand: invalid expression as operand
> ../../gcc/c-typeck.c:5180: Internal compiler error in output_operand_lossage, at final.c:3397
> confused by earlier errors, bailing out

This error results from the following substitution which occurs in the
"lreg" pass.  Here is the "lreg" rtl:

(insn 67 926 927 (set (reg/f:SI 107)
        (mem/u:SI (lo_sum:SI (reg/f:SI 309)
                (unspec:SI[
                        (symbol_ref:SI ("constructor_max_index"))
		    ]  0)) 0)) 82 {*pa.md:2352} (insn_list 65 (nil))
    (expr_list:REG_EQUIV (mem/u:SI (lo_sum:SI (reg/f:SI 309)
		(unspec:SI[
			(symbol_ref:SI ("constructor_max_index"))
		    ]  0)) 0)
        (expr_list:REG_DEAD (reg/f:SI 309)
            (nil))))

...

(insn 569 619 627 (set (reg/f:SI 232)
        (reg/f:SI 107)) 69 {*pa.md:2099} (nil)
    (expr_list:REG_DEAD (reg/f:SI 107)
        (nil)))

Then, after the "greg" pass we get for insn 569:

(insn 569 619 627 (set (reg/f:SI 21 %r21)
        (mem/u:SI (lo_sum:SI (reg/f:SI 8 %r8)
		(unspec:SI[
			(symbol_ref:SI ("constructor_max_index"))
		    ]  0)) 0)) 69 {*pa.md:2099} (nil)
    (nil))

The "mem" apparently satisfies the RQ constraint for the "ldw%M1 %1,%0"
code of the insn {*pa.md:2099} but this operand can't be printed printed.
Thus, either we need to improve the printing of pic symbol references or
disallow MEMs of this type in the Q constraint.  Any thoughts on this?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
