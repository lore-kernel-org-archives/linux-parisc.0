From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] Re: [PATCH] Common compat_sys_sysinfo
Date: Sun, 7 Jan 2007 10:22:13 -0500
Message-ID: <20070107152213.GC3207__21347.6005163558$1416624256$gmane$org@athena.road.mcmartin.ca>
References: <20070107144850.GB3207@athena.road.mcmartin.ca>
	<20070107151319.GA23478@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: Christoph Hellwig <hch@infradead.org>,
 Kyle McMartin <kyle@parisc-linux.org>,
 akpm@osdl.org,
 linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070107151319.GA23478@infradead.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jan 07, 2007 at 03:13:19PM +0000, Christoph Hellwig wrote:
> > +compat_sys_sysinfo(struct compat_sysinfo __user *info)
> > +{
> > +	extern int do_sysinfo(struct sysinfo *info);
> 
> Please always put prototypes for functions with external linkage in
> header files.
> 

Ah, crud, I stuck that there to reduce the number of patched files when I let
Thibaut test it, but forgot to remove it from the final patch.

> > +int do_sysinfo(struct sysinfo *info)
> >  {
> > -	struct sysinfo val;
> >  	unsigned long mem_total, sav_total;
> >  	unsigned int mem_unit, bitcount;
> >  	unsigned long seq;
> >  
> > -	memset((char *)&val, 0, sizeof(struct sysinfo));
> > +	memset((char *)info, 0, sizeof(struct sysinfo));
> 
> No need for the cast here.
>

Ok.

> 
> 
> Btw, in case you have some spare time there are some other syscalls
> that want similar treatment.  sendfile(64) come to mind as these
> could use a do_sendfile helper aswell, the various stat and readdir/getdents
> variants could do with some unification, the various timing calls
> like alarm and get/settimeofday are common across architectures,
> sysctl should be the same everywhere, the uid/git related syscalls
> should be consolidated, sched_rr_get_interval looks trivial,
> and last but not least we probably want a unified mechanisms to deal
> with the 64bit arguments that are broken up into two 32bit ones (not just
> for emulation but also for 32it BE architectures)
> 

I can definitely look into this.

> Okay, okay - we should probably put this into a Wiki somewhere :)
> 

Heh. :)

Cheers,
	Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
