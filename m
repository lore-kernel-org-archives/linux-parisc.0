Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "J.Steindlberger" <j@steindlberger.de>
Cc: moritz@freesources.org, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ide controller 
In-Reply-To: Message from "J.Steindlberger" <j@steindlberger.de>
   of "Thu, 19 Sep 2002 14:50:45 +0200." <20020919125032.50BB0482A@dsl2.external.hp.com>
References: <20020916043004.B27754829@dsl2.external.hp.com> <28859.1032424874@www2.gmx.net> <1032430004.26669.1.camel@irongate.swansea.linux.org.uk>  <20020919125032.50BB0482A@dsl2.external.hp.com> 
Date: Thu, 19 Sep 2002 17:02:07 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020919230207.6835D4829@dsl2.external.hp.com>
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

"J.Steindlberger" wrote:
> The kernel crashed alike. Do You have any ideas to get more debug output?

If the crash was an "HPMC", then "ser pim" at PDC prompt will
tell you machine state and why it crashed. If the crash
was a regular panic, the console output will tell the reason, where,
and give a register dump. Post either or both of those here
and we can try to decode it for you.

grant
