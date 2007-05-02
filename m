From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] unaligned access using bash on glibc 2.5
Date: Wed, 2 May 2007 13:17:01 -0400 (EDT)
Message-ID: <200705021717.l42HH2Mk017727__39060.3173910224$1416624344$gmane$org@hiauly1.hia.nrc.ca>
References: <4638B005.60902@aurel32.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: aurelien@aurel32.net (Aurelien Jarno)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4638B005.60902@aurel32.net> from "Aurelien Jarno" at May 2,
	2007 05:36:37 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > This is a bug in __attribute__ ((tls_model ("initial-exec"))).  It
> > doesn't express that it uses r19.  As a result, GCC is free to optimize
> > the save and restore of r19 across the call to free away.
> > 
> > The same is true of the asm.
> 
> What would be the correct way to express that?

As far as the tls_model attribute goes, I can see that the TLS patterns
in pa.md (e.g., tgd_load) don't express their dependence on r19 and r27.
I think the simplest fix is to use expanders and separate patterns for
pic and non-pic.  This will allow different rtl for the two cases.

Asms that use the pic register need to express that dependence in their
list of input operands.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
