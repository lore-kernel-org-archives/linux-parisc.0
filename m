From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Some warning: ... cleanup; realy no interest?
Date: Fri, 3 Aug 2007 11:16:08 -0400 (EDT)
Message-ID: <200708031516.l73FG8jb002491__46609.0276641355$1416624425$gmane$org@hiauly1.hia.nrc.ca>
References: <JM78V2$461E14034C9C293D572DFA91ADC72793@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@scarlet.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <JM78V2$461E14034C9C293D572DFA91ADC72793@scarlet.be> from "Joel
	Soete" at Aug 3, 2007 03:16:14 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > > /CAD/linux-2.6.22-pa/drivers/parisc/dino.c: In function ?dino_bridge_init?:
> > > /CAD/linux-2.6.22-pa/drivers/parisc/dino.c:821: warning: format %lx
> expects type long unsigned int, but argument 4 has type 
> > > resource_size_t
> > > /CAD/linux-2.6.22-pa/drivers/parisc/dino.c:821: warning: format %lx
> expects type long unsigned int, but argument 5 has type 
> > > resource_size_t

>>>From linux/types.h:

#ifdef CONFIG_RESOURCES_64BIT
typedef u64 resource_size_t;
#else
typedef u32 resource_size_t;
#endif

%lx looks right for parisc.  This is ugly but you can kill the warning
by casting arguments 4 and 5 to unsigned long.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
