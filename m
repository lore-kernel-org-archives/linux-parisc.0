Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id UAA14647
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Jan 2001 20:51:16 -0700
Message-Id: <200101170354.WAA09043@hiauly1.hia.nrc.ca>
Subject: Re: Oust HPPA PIC_OFFSET_TABLE_REGNUM_SAVED
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Tue, 16 Jan 2001 22:54:45 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, rth@redhat.com, law@redhat.com,
        gcc-patches@gcc.gnu.org, parisc-linux@puffin.external.hp.com
In-Reply-To: <200101170323.WAA08747@hiauly1.hia.nrc.ca> from "John David Anglin" at Jan 16, 2001 10:23:57 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> ../../gcc/libgcc2.c:1043: warning: ICE: would have deleted prologue/epilogue ins
> n
> (insn 372 370 373 (set (reg:SI 4 %r4 [94])
>         (reg:SI 19 %r19)) -1 (nil)
>     (nil))

The patch has problems:

__floatditf
	.PROC
	.CALLINFO FRAME=192,CALLS,SAVE_RP,ENTRY_GR=4
	.ENTRY
...
	stw %r4,-72(%r30)
...
	copy %r19,%r4
...
	bl _U_Qfadd,%r2
	stw %r19,-32(%r30)
	copy %r3,%r28
...
	ldw -212(%r30),%r2
	ldw -72(%r30),%r4
	ldw -68(%r30),%r3
	bv %r0(%r2)
	ldo -192(%r30),%r30
	.EXIT
	.PROCEND

The restoration of r19 after the call to _U_Qfadd is deleted in the flow2
pass.  When this happens, the prologue save to r4 isn't needed leading to
the ICE warning.  However, the restoration of r19 after the call shouldn't
be deleted because r19 is needed for the return (previous discussion).
We need a "use" in the return to prevent this.

The save of r19 to the stack looks extraneous but I think it is mandated
by the ABI.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
