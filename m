Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id DDBDC4829
	for <parisc-linux@parisc-linux.org>; Sat, 11 Jan 2003 11:32:01 -0700 (MST)
Message-Id: <200301111831.h0BIVwZS006398@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: floating point exception error
To: randolph@tausq.org
Date: Sat, 11 Jan 2003 13:31:58 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: jim.hull@hp.com, parisc-linux@parisc-linux.org
In-Reply-To: <20030111061638.GH31470@tausq.org> from "Randolph Chung" at Jan 10, 2003 10:16:38 pm
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

> I think i found it....
> 
> for class 1 ops (fcnv) pa20 has a 3-bit subop field, pa11 has a 2-bit
> subop field, which determines the source/target formats. our code is not
> correctly determining pa11 vs pa20, so it defaults to pa11 and uses
> subop==1 instead of subop==5
> 
> now, the tricky part is how to get it to detect the right type. the code
> looks like this:
> 
> fpu_type_flags=fpregs[FPU_TYPE_FLAG_POS];  /* get fpu type flags */
> if  (fpu_type_flags & PA2_0_FPU_FLAG)
>     subop = get_subop1_PA2_0(ir);
> else
>     subop = get_subop1_PA1_1(ir);

I think that you probably should always use a 3-bit extract.  If the
value is greater than 3 on a PA 1.1 FPU, then the operation is undefined.
4 is also undefined for PA 2.0.

The above assumes that the kernel doesn't provide PA 2.0 emulation
on PA 1.1 machines.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
