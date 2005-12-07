From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] HCRX-24 and missing consoles on my C200
Date: Wed, 7 Dec 2005 13:29:13 -0500
Message-ID: <20051207182913.GB32168__10719.6857141846$1416624571$gmane$org@quicksilver.road.mcmartin.ca>
References: <43971676.1010009@gmail.com>
	<20051207180130.GB11417@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: debian-hppa@lists.debian.org,
 parisc-linux@parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051207180130.GB11417@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Dec 07, 2005 at 11:01:30AM -0700, Grant Grundler wrote:
> > STI GSC/PCI core graphics driver Version 0.9a
> >     id 2bcb015a-9a02587, conforms to spec rev. 8.04
> > STI init_graph failed (ret -1, errno 258)
> > sti: probe of 10:8 failed with error 1
>

Someone should probably turn on debugging. Edit
drivers/video/sticore.h and change the initial #if 0 to #if 1 and
rebuild and boot.

As far as I know, this is failing the initial call to STI init_graph,
I suspect either it doesn't like the default init values, or something
is not quite right when setting up the glob_cfg. As I understand it,
we set up the glob_cfg structures with nothing but the region pointers,
and then call init_graph to set up the rest of the context which is passed
between every further called STI function.

Or the STI rom is completely broken on this card and HP-UX uses software
instead of the firmware routines.

I think I have a HCRX here (A4070 with A4072), I can try and fix this
but not until at least January.

Cheers,
	Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
