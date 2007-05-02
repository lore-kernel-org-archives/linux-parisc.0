From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] unaligned access using bash on glibc 2.5
Date: Wed, 2 May 2007 11:16:12 -0400 (EDT)
Message-ID: <200705021516.l42FGCMT015600__23869.1013576046$1416624343$gmane$org@hiauly1.hia.nrc.ca>
References: <20070502101342.GA27108@farad.aurel32.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: aurelien@aurel32.net (Aurelien Jarno)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070502101342.GA27108@farad.aurel32.net> from "Aurelien Jarno"
	at May 2, 2007 12:13:42 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Wed, May 02, 2007 at 11:38:51AM +0200, Aurelien Jarno wrote:
> > Please find the reduced testcase below. When the value is assigned to
> > __libc_errno, the value of r19 has been overrided by the call to free().
> > 
> 
> And a smaller one:
> 
> 
> extern __thread int __libc_errno __attribute__ ((tls_model ("initial-exec")));

This is a bug in __attribute__ ((tls_model ("initial-exec"))).  It
doesn't express that it uses r19.  As a result, GCC is free to optimize
the save and restore of r19 across the call to free away.

The same is true of the asm.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
