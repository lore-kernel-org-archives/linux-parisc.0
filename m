From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] ccio-dma 64bit debug_init info
Date: Fri, 13 May 2005 08:47:55 +0200
Message-ID: <4282FEEC000007BE@mail-4-bnl.tiscali.it>
References: <20050513055734.GC8675@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050513055734.GC8675@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> 
> On Fri, May 13, 2005 at 07:50:05AM +0200, Joel Soete wrote:
> > Ah I thought (too quickly) that it could be the reason why:
> > ...
> > ccio-dma.c: failed to claim CCIO bus address space (ffffffff00000000,=
ffffffffffffffff)
> 
> That's a completely different issue.
> It would be interesting to know why it's asking for that range.
> Where are the values of that range coming from?
> (ie what is the origin of ffffffff00000000 value)
> 
Ah ok I will check...

btw 32 claimed are:
Setting cache flush threshold to 40 (1 CPUs online)
Found U2 at 0xfff88000
ccio_init_resource: claim CCIO bus address space (f1000000,f17fffff)
ccio_init_resource: claim CCIO bus address space (fc000000,fff7ffff)
Found U2 at 0xfff8a000
ccio_init_resource: claim CCIO bus address space (f1800000,f1ffffff)

(just added printk at the end of ccio_init :-)

Thanks,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
