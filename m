From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: 64-bit long double support.
Date: Fri, 17 Nov 2006 00:35:56 -0500
Message-ID: <20061117053556.GA694@hiauly1.hia.nrc.ca>
References: <119aab440611161731p47779d1hdc7e7dbd336eb23c@mail.gmail.com>
	<200611170148.kAH1moG4028180@hiauly1.hia.nrc.ca>
	<119aab440611161948w5005d083ma170b013409c93c6@mail.gmail.com>
	<200611162310.03845.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: dave.anglin@nrc.ca,
 parisc-linux@lists.parisc-linux.org
To: Mike Frysinger <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200611162310.03845.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> http://gcc.gnu.org/PR29114

This has nothing to do with the discussion about long double support.

>>>From the PR, this only occurs in a cross from 64-bit host to 32-bit target.
There's no 64-bit parisc-linux host...

It would appear that the adddi3 expander in pa.md isn't used for some
reason in the initial code expansion as it would reject the insn.  You
are in the best position to determine where the insn is being emitted from.
It could be being emitted from the generic code or the PA backend.  Try
breaks on emit_move_sequence, emit_insn, emit_insn_after or emit_insn_before
and see if you can find where the insn is being emitted.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
