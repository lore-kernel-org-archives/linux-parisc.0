From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] A couple of minor patches for 2.6.7-pa1g
Date: Fri, 18 Jun 2004 20:33:12 -0400 (EDT)
Message-ID: <200406190033.i5J0XCSX001113@hiauly1.hia.nrc.ca>
References: <20040618212600.GB12572@engsoc.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: kyle@engsoc.org (Kyle McMartin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040618212600.GB12572@engsoc.org> from "Kyle McMartin" at Jun
	18, 2004 05:26:00 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Fri, Jun 18, 2004 at 11:42:13PM +0200, Andy Walker wrote:
> > -cflags-$(CONFIG_PA7300LC)	+= -march=1.1 -mschedule=7300
> > +cflags-$(CONFIG_PA7300LC)	+= -march=1.1 -mschedule=7100LC
> 
> Yes it does. Update your GCC.

It was introduced in 3.3.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
