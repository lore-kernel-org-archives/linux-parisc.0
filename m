From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
Date: Thu, 20 Mar 2003 13:23:23 -0500 (EST)
Message-ID: <200303201823.h2KINN1w007420__6552.72595254264$1416622313$gmane$org@hiauly1.hia.nrc.ca>
References: <200303201813.h2KIDn3P007214@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: jsoe0708@tiscali.be, tausq@debian.org, b.gunreben@web.de,
	willy@debian.org, doko@cs.tu-berlin.de, debian-hppa@lists.debian.org,
	debian-gcc@lists.debian.org, parisc-linux@lists.parisc-linux.org,
	kuznet@ms2.inr.ac.ru, linux-net@vger.kernel.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <200303201813.h2KIDn3P007214@hiauly1.hia.nrc.ca> from "John David Anglin" at Mar 20, 2003 01:13:49 pm
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> No, don't do that.  SIG_DFL, SIG_IGN and SIG_ERR expand to compound
> literals.

Sorry, that part is wrong.  Anyway, just leave the macro defines as
is and cast them where used to void *.  This causes the conversion
of the other operand to void * and function pointer conicalization
won't be done (6.5.9, paragraph 5).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
