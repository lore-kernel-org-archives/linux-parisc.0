Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 29 Apr 2003 23:18:06 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: "Boehm, Hans" <hans_boehm@hp.com>,
	"'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Program counter from sigcontext, constructurs and -fPIC
Message-ID: <20030430051806.GA27050@dsl2.external.hp.com>
References: <75A9FEBA25015040A761C1F74975667D01442066@hplex4.hpl.hp.com> <20030429213027.GB12492@systemhalted> <20030429221357.GD17313@dsl2.external.hp.com> <20030430003106.GC12492@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030430003106.GC12492@systemhalted>
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

On Tue, Apr 29, 2003 at 08:31:06PM -0400, Carlos O'Donell wrote:
...
> /* We will add more stuff here as it becomes necessary, until we know
>    it works. */
> struct sigcontext {
>         unsigned long sc_flags;
>         unsigned long sc_gr[32]; /* PSW in sc_gr[0] */
...

yes. exactly matches.

...
> Don't touch -17, the _Unwind_Find_FDE code broke and it's doing damage
> to things like 'vi' ... *sigh* I haven't even looked into this (looks
> like gcc/glibc clashes again).

ok. thanks for the warning.

Looks things are as good as they are going to get on that box for
the time being then.

thanks,
grant
