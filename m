From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Heavy Iron Reference Docs
Date: Tue, 2 May 2006 11:41:46 -0400 (EDT)
Message-ID: <200605021541.k42Ffk5c000458@hiauly1.hia.nrc.ca>
References: <20060502151345.GD6958@skunkworks.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060502151345.GD6958@skunkworks.cabal.ca> from "Kyle McMartin"
	at May 2, 2006 11:13:45 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Tue, May 02, 2006 at 11:10:51AM -0400, John David Anglin wrote:
> > Are there any PA 2.0 machines for which the value of coherent_system
> > is 0?  If so, which ones?
> >
> 
> I'll cook a patch which dumps more cache info.
> 
> struct pdc_cache_cf {           /* for PDC_CACHE  (I/D-caches) */
> 	[...]
>                 cc_cst  : 3,    /* 0 = incoherent D-cache, 1=coherent D-cache */
> 	[...]
> };
> 
> Should tell us what we need to know. 

Excellent.  Could this go into show_cache_info() so that
"cat /proc/cpuinfo" will show more cache data?  There's also
some stuff in the cache init routine that doesn't print
because of "#if 0".

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
