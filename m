Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 00E4E482C
	for <parisc-linux@parisc-linux.org>; Sun,  6 Jan 2002 14:32:35 -0700 (MST)
Message-Id: <200201062132.g06LWWbv027708@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] PIC assembly
To: randolph@tausq.org
Date: Sun, 6 Jan 2002 16:32:32 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20020106172619.GD14884@tausq.org> from "Randolph Chung" at Jan 6, 2002 09:26:19 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> I'ved filed a possible patch for this in the bug report, but I'm not
> 100% convinced I understand this correctly. Can someone please take a
> look and let me know? 

The patch needs to be revised.  You can't use r19 as a scratch register
in PIC mode.  There are several places where it is used in the routine.
Maybe you use can use r1 in its place.

> --- udiv-qrnnd.S.orig	Thu May 31 03:14:12 2001
> +++ udiv-qrnnd.S	Sat Jan  5 23:27:02 2002
> @@ -51,8 +51,11 @@
>  
>  	stws		%r25,-16(0,%r30)	; n_hi
>  	stws		%r24,-12(0,%r30)	; n_lo
> -	ldil		L'L$0000,%r19           ; '
> -	ldo		R'L$0000(%r19),%r19     ; '
> +
> +	stw             %r19,-32(%r30)
> +	addil		LT%L$0000,%r19
> +	ldw		RT%L$0000(%r1),%r1

Change following fldds insn to use r1, or change destination register in
the above to some other caller saved register and the fldds insn to match.

> +	ldw		0(%r1), %r19

Wrong.  This would load 0x43f00000 into r19.

Finally, you should put the data in the data section.  There might be a
problem accessing data in the code section with LT% (RT%) because LT%
is "LR% value offset of data linkage slots from linkage table pointer (r19)".

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
