From: Lee Revell <rlrevell@joe-job.com>
Subject: Re: [parisc-linux] [Alsa-devel] [PATCH] Support for AD1889 PCI
	Soundchip
Date: Thu, 18 Aug 2005 13:12:34 -0400
Message-ID: <1124385155.5973.20.camel__10715.4370438822$1416623907$gmane$org@mindpipe>
References: <Pine.HPX.4.33n.0508171249360.19860-200000@studcom.urz.uni-halle.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: kyle@parisc-linux.org,
 alsa-devel@lists.sourceforge.net,
 parisc-linux@lists.parisc-linux.org,
 Thibaut VARENE <T-Bone@parisc-linux.org>
To: Clemens Ladisch <clemens@ladisch.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.HPX.4.33n.0508171249360.19860-200000@studcom.urz.uni-halle.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, 2005-08-18 at 17:35 +0200, Clemens Ladisch wrote:
> > > +/* keep track of some hw registers */
> > >  struct ad1889_register_state {
> > >     u16 reg;        /* reg setup */
> > >     u32 addr;       /* dma base address */
> > > -   u16 rate;       /* sample rate */
> > > -   unsigned long pos;      /* last recorded DMA buffer position
> */
> > > -   unsigned long buf;      /* period # */
> > >     unsigned long size;     /* DMA buffer size */
> > > -   unsigned long count;    /* period size, aka nb bytes sent in
> the current DMA transfer */
> >
> > reading the patch through webmail doesn't help a lot getting a grasp
> > of its whole but i wonder if we could still find some debugging
> > purposes for these values. Remember this driver is work in
> progress ;)
> 
> Those fields just aren't used anymore; anything interesting is in the
> chip's registers. 

Isn't it still useful to maintain a cached copy of the register state
for suspend/resume purposes?

Lee

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
