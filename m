Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Stephan Trajkoff <stephan@itp.bg>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] k210/819 Zalon driver 
In-Reply-To: Message from Stephan Trajkoff <stephan@itp.bg>
   of "Tue, 09 Jul 2002 14:23:41 +0300." <3D2AC7BD.5060707@itp.bg>
References: <3D2A9711.4030207@itp.bg> <20020709072916.GH6681@sleepie.demon.co.uk>  <3D2AC7BD.5060707@itp.bg> 
Date: Tue, 09 Jul 2002 12:48:32 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020709184832.CF0A54841@dsl2.external.hp.com>
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

Stephan Trajkoff wrote:
> T think that my HP K210 don't have any PCIs or EISAs...
> dmesg don't show me that I have any PCIs or EISAs...
> and I have ncr53c720 not 8xx

Right. It's confusing. Please send a patch that either corrects
the problem or gives a useful error. I don't expect it to be that
hard to do but it does take time. I'm more interested in working
on SMP-Interrupt issues (per-CPU statistics and IRQ regions,
Interrupt distribution).

thanks,
grant
