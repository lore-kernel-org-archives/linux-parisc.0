Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 30 Apr 2003 22:09:31 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: "Boehm, Hans" <hans_boehm@hp.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>,
	'Carlos O'Donell' <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] Program counter from sigcontext, constructurs and -fPIC
Message-ID: <20030501040931.GA21495@dsl2.external.hp.com>
References: <75A9FEBA25015040A761C1F74975667D01442066@hplex4.hpl.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <75A9FEBA25015040A761C1F74975667D01442066@hplex4.hpl.hp.com>
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

On Tue, Apr 29, 2003 at 02:17:32PM -0700, Boehm, Hans wrote:
> 3) Adding 24 bytes to the struct sigcontext pointer (?) passed
>    as a third argument to the signal handler. (!)
...
> Is the third argument to a signal handler really not a pointer to sigcontext?

Yes - that seems to be the case.
Randolph found most of the answer in "Single Unix Specification"
(IEEE 1033.1-2001).  Third argument is "ucontext_t".

We counted 20 bytes (not 24) before the "struct sigcontext uc_mcontext;"
and thus still don't have a full explanation. Our best guess is some
misc padding is involved.

hth,
grant
