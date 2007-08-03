From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Some warning: ... cleanup; realy no interest?
Date: Fri, 3 Aug 2007 11:39:09 -0400
Message-ID: <20070803153909.GA7812__21299.0292501219$1416624425$gmane$org@fattire.cabal.ca>
References: <JM78V2$461E14034C9C293D572DFA91ADC72793@scarlet.be>
	<200708031516.l73FG8jb002491@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Joel Soete <soete.joel@scarlet.be>,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200708031516.l73FG8jb002491@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Aug 03, 2007 at 11:16:08AM -0400, John David Anglin wrote:
> > > > /CAD/linux-2.6.22-pa/drivers/parisc/dino.c: In function ?dino_bridge_init?:
> > > > /CAD/linux-2.6.22-pa/drivers/parisc/dino.c:821: warning: format %lx
> > expects type long unsigned int, but argument 4 has type 
> > > > resource_size_t
> > > > /CAD/linux-2.6.22-pa/drivers/parisc/dino.c:821: warning: format %lx
> > expects type long unsigned int, but argument 5 has type 
> > > > resource_size_t
> 
> >From linux/types.h:
> 
> #ifdef CONFIG_RESOURCES_64BIT
> typedef u64 resource_size_t;
> #else
> typedef u32 resource_size_t;
> #endif
> 
> %lx looks right for parisc.  This is ugly but you can kill the warning
> by casting arguments 4 and 5 to unsigned long.
> 

We're "supposed" to use %llx and cast to a ULL, this is because of
CONFIG_RESOURCES_64BIT which is for crap architectures which have
32-bit registers, but the possibility of bigger physical addresses,
(think i386 with 36-bit PAE addressing.)

--Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
