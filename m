Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Jeremy Drake <jeremyd@apptechsys.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Building cvs 2.4.18 
In-Reply-To: Message from Grant Grundler <grundler@dsl2.external.hp.com>
   of "Mon, 25 Mar 2002 23:32:17 MST." <20020326063217.50AB1482C@dsl2.external.hp.com>
References: <Pine.LNX.4.33L2.0203251403190.13376-100000@eiger.apptechsys.com>  <20020326063217.50AB1482C@dsl2.external.hp.com> 
Date: Mon, 25 Mar 2002 23:45:03 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020326064503.72DCE482C@dsl2.external.hp.com>
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

Grant Grundler wrote:
> hmm...this must have recently broke since I've built plenty
> of SMP kernels with iptables enabled.

Sorry - I checked and my SMP builds had iptables statically linked in.
My non-SMP builds had iptables as a module. This should be easy to
fix (add missing EXPORT_SYMS to arch/parisc/kernel/parisc_ksyms.c).
If no one beats me to it, I'll do that tomorrow.

grant
