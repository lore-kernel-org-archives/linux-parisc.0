Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "Michael S. Zick" <mszick@goquest.com>
Cc: parisc-linux@lists.parisc-linux.org, mszick@MoreThan.org
Subject: Re: [parisc-linux] 2.4.18-pa35 SMP process hangs on a J200 
In-Reply-To: Message from Michael S.Zick <mszick@goquest.com>
   of "Wed, 12 Jun 2002 08:45:40 CDT." <02061208454000.00732@localhost.localdomain>
References: <5BA66B90-7D12-11D6-B01F-0030656F07A2@esiee.fr> <20020611145848.GA2796@tausq.org> <02061113393800.04435@localhost.localdomain>  <02061208454000.00732@localhost.localdomain> 
Date: Thu, 13 Jun 2002 15:52:46 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020613215246.3B1864848@dsl2.external.hp.com>
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

Michael S. Zick wrote:
> Sirs...
> I now have a definate lead for the x86-SMP case, which might 
> aid the troubleshooters in the pa-risc branch (diff's attached).

ok - thanks. I'll take a look.

But I can tell you now that very little of the code between
x86 and parisc is shared in this area. I doubt it's as helpful
as you might think.

> Additional note: On the HP models with the worst of the problems;
> is the physical_cpu_id and the logical_cpu_id a 1:1 mapping as
> it is on x86 systems?

Yes. parisc didn't have a concept of physical CPU ID until
PAT PDC (eg A500, N-class, etc). When we want to support
CPU addition and removal, we can add physical/logical
mappings and it will no longer be 1:1.

grant
