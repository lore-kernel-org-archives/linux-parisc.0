Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA15745
	for <parisc-linux@puffin.external.hp.com>; Sat, 30 Dec 2000 12:02:59 -0700
Message-Id: <200012301905.OAA19130@hiauly1.hia.nrc.ca>
Subject: Re: pa reload problem
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Sat, 30 Dec 2000 14:05:50 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: rth@redhat.com, alan@linuxcare.com.au, law@cygnus.com,
        rhirst@linuxcare.com, parisc-linux@thepuffingroup.com,
        gcc-bugs@gcc.gnu.org
In-Reply-To: <200012221721.MAA00889@hiauly1.hia.nrc.ca> from "John David Anglin" at Dec 22, 2000 12:21:54 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > Your GO_IF_LEGITIMATE_ADDRESS will accept the UNSPEC?
> > The mind boggles.  Why, then, is this strange beast its own insn?
> 
> I have done some more testing.

As I do more work trying to build the pa port under hpux 10.20 with
`-fPIC -O3', I have begun to understand why this strange beast is its
own insn.  The machine definition which I am testing currently has
the UNSPEC integrated with other move_operands.  However, in doing this,
I have encountered another reload problem.

Here is the relevant rtl from the lreg pass:

;; Function init_all_optabs

...

(note 223 107 225 ("insn-opinit.c") 48 -1347440721)

(insn 225 223 1961 (set (reg/f:SI 611)
        (plus:SI (reg:SI 19 %r19)
            (high:SI (symbol_ref:SI ("target_flags"))))) 80 {*pa.md:2326} (nil)
    (nil))

...

(note 1063 1013 1067 ("insn-opinit.c") 130 -1347440721)

(insn 1067 1063 2002 (set (reg/f:SI 403)
        (mem/u:SI (lo_sum:SI (reg/f:SI 611)
                (unspec:SI[ 
                        (symbol_ref:SI ("target_flags"))
                    ]  0)) 0)) 69 {*pa.md:2099} (nil)
    (expr_list:REG_EQUIV (mem/u:SI (lo_sum:SI (reg/f:SI 611)
                (unspec:SI[ 
                        (symbol_ref:SI ("target_flags"))
                    ]  0)) 0)
        (expr_list:REG_DEAD (reg/f:SI 611)
            (nil))))

...

(note 2006 1059 1069 ("insn-opinit.c") 130 -1347440721)

(insn 1069 2006 2007 (set (reg:SI 404)
        (mem/f:SI (reg/f:SI 403) 4)) 69 {*pa.md:2099} (insn_list 1067 (nil))
    (expr_list:REG_EQUIV (mem/f:SI (reg/f:SI 403) 4)
        (nil)))

...

(note 1085 1926 1091 ("insn-opinit.c") 132 -1347440721)

(insn 1091 1085 1094 (set (reg:SI 411)
        (mem/f:SI (reg/f:SI 403) 4)) 69 {*pa.md:2099} (nil)
    (expr_list:REG_EQUIV (mem/f:SI (reg/f:SI 403) 4)
        (nil)))

...

(note 2168 1597 1607 ("insn-opinit.c") 194 -1347440721)

(insn 1607 2168 2169 (set (reg:SI 538)
        (mem/f:SI (reg/f:SI 403) 4)) 69 {*pa.md:2099} (insn_list:REG_DEP_ANTI 1497 (nil))
    (expr_list:REG_EQUIV (mem/f:SI (reg/f:SI 403) 4)
        (nil)))

...

(note 1621 1931 1627 ("insn-opinit.c") 196 -1347440721)

(insn 1627 1621 1630 (set (reg:SI 544)
        (mem/f:SI (reg/f:SI 403) 4)) 69 {*pa.md:2099} (nil)
    (expr_list:REG_DEAD (reg/f:SI 403)
        (nil)))

Note that register 611 is dead at insn 1067.  However, we still have REG_EQUIV
notes which implicitly use register 611 on insns 1091 and 1607 (not sure
why there isn't a note on 1627).  This leads to disaster at insn 1607
when the hard register assigned to 611 gets reused for other purposes
in the intervening code.

Is the REG_DEAD note for register 611 in the right place?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
