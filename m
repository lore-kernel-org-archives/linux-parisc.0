From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 2.6.10-rc1-pa15 panic after 21 kernel build loop
	:-(
Date: Fri, 26 Nov 2004 08:27:13 +0100
Message-ID: <418A80E800007D80@mail-6-bnl.tiscali.it>
References: <20041125181832.GA12264@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041125181832.GA12264@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> -- Original Message --
> Date: Thu, 25 Nov 2004 11:18:32 -0700
> From: Grant Grundler <grundler@parisc-linux.org>
> To: Joel Soete <soete.joel@tiscali.be>
> Cc: parisc-linux@lists.parisc-linux.org
> Subject: Re: [parisc-linux] 2.6.10-rc1-pa15 panic after 21 kernel build=

loop
> :-(
> 
> 
> On Fri, Nov 19, 2004 at 09:15:21AM +0100, Joel Soete wrote:
> > Press Q/q to quit, Enter to continue:
> >  [<000000001016a910>] update_process_times+0x50/0x90
> >  [<00000000101269b8>] smp_do_timer+0x78/0x80
> >  [<000000001011b120>] timer_interrupt+0xd8/0x2f0
> >  [<000000001011bed8>] do_irq+0xd8/0x1e8
> >  [<000000001011c0c8>] do_cpu_irq_mask+0xe0/0x150
> >  [<0000000010107074>] intr_return+0x0/0x24
> 
> FYI, the same stack trace/fault just occurred on gsyprf11 (a500-65).
> 
Yes should occure on smp systems (mmm curious to see if the pb occures al=
so
on a up system runing a smp kernel?)

Thanks for feedback,
     Joel


-------------------------------------------------------------------------=
--
Tiscali vous offre 3 mois d'ADSL et 3 mois de DVD gratuits...profitez-en.=
..
http://reg.tiscali.be/adsl/default.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
