Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sat, 11 Jan 2003 00:10:05 -0700
To: Randolph Chung <randolph@tausq.org>
Cc: Jim Hull <jim.hull@hp.com>,
	'John David Anglin' <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: floating point exception error
Message-ID: <20030111071005.GA2326@dsl2.external.hp.com>
References: <200301101848.h0AImToB004181@hiauly1.hia.nrc.ca> <005c01c2b8f7$e79cc8c0$6763f40f@cup.hp.com> <20030111061638.GH31470@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030111061638.GH31470@tausq.org>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Fri, Jan 10, 2003 at 10:16:38PM -0800, Randolph Chung wrote:
> so, i wonder:
> 1) why those numbers? (where is it documented?)

no clue - PDC calls don't document that?

> 2) is there a special way to read that fpu type from the fpu?

yes. PDC can tell you the FPU model. I'll have to look up the call.
I had the impression it was better to use FP info to identify the CPU model
than the other PDC info - but what we have seems to work.

> or do we use boot_cpu_data.cpu_type?
Maybe the same call returns both CPU and FPU identifiers.
Don't recall offhand. If someone doesn't know offhand,
I'll look it up.

grant
