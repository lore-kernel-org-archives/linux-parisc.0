Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA08185
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 23:10:14 -0700
Message-Id: <200012010612.BAA17871@hiauly1.hia.nrc.ca>
Subject: Re: pa reload problem
To: alan@linuxcare.com.au (Alan Modra)
Date: Fri, 1 Dec 2000 01:12:26 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: law@cygnus.com, rhirst@linuxcare.com, parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.LNX.4.21.0012011102290.2814-100000@front.linuxcare.com.au> from "Alan Modra" at Dec 1, 2000 11:23:42 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

>         b,l foo,%r2
>         copy %r27,%r4
>         addil LT'cpu_hz,%r4	! know r27 trashed in call, so use r4
>         ldd RT'cpu_hz(%r1),%r1
>         ldd -144(%r30),%r2
>         ldw 0(%r1),%r19
>         addil LT'L$C0000,%r27	! oops, should be using r4
>         ldd RT'L$C0000(%r1),%r1

It looks to me like this happens because the register life analysis in
pass 13 decides that r27 (dp) is dead.  This causes combine to delete the
insn that restores r27 after the call to foo and use the value saved
in r4 as a proxy for dp.

(insn 16 14 21 (set (reg:DI 27 %r27)
        (reg:DI 4 %r4)) 123 {movstrsi_internal+11} (nil)
    (expr_list:REG_DEAD (reg:DI 4 %r4)
	(nil)))

(insn 21 16 23 (set (reg:DI 68)
	(plus:DI (reg:DI 27 %r27)
	    (high:DI (symbol_ref:DI ("cpu_hz"))))) 81 {post_std+3} (insn_list 16 (nil))
     (expr_list:REG_DEAD (reg:DI 27 %r27)
	(nil)))

The const_int's which follow haven't been expanded at this point.  Thus,
the life analysis can't tell that r27 is still needed.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
