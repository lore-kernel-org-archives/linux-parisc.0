From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] [RFC] Non-executable stack?
Date: Tue, 14 Sep 2004 15:56:22 -0400
Message-ID: <20040914195621.GL9763@baldric.uwo.ca>
References: <20040912161009.GQ28659@tausq.org>
	<200409141936.i8EJa1Yq021565@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200409141936.i8EJa1Yq021565@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> While a non-executable stack can be used on hpux, it's not the default.
> 
> GCC currently needs an executable stack for calling nested functions
> on both linux and hpux.  See the trampoline macros in pa.h.

Moving signal return trampolines off the stack is a first step at
getting a working non-executable stack.

The idea of having a vDSO is very cool IMO, especially since it solves
our problems with having to detect LWS CAS... which normally crashes the
old kernels. One could also define a new sysconf() variable and rely on 
that.

Opinions?

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
