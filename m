From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] paer.debian.org crash in ext3_write_inode()
Date: Sat, 6 Aug 2005 11:56:01 -0600
Message-ID: <20050806175601.GA12272@colo.lackof.org>
References: <1123204638.3628.132.camel@krebs.dannf>
	<20050805195306.GS9703@systemhalted.org>
	<1123274838.9036.57.camel@krebs.dannf>
	<20050806051432.GA21031@colo.lackof.org>
	<1123341709.10768.1.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: dann frazier <dannf@hp.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1123341709.10768.1.camel@localhost>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Aug 06, 2005 at 09:21:49AM -0600, dann frazier wrote:
> > > Yeah; we really should be logging the console while its acting up...
> > > I'll try to set that up.
> > 
> > pear is an a500?
> > 
> > If so, "cl" from the GSP will dump the last couple hundred lines
> > of console output.
> 
> right, that output is in my first message.

Ok..then the missing register dump isn't something logging
the console will fix. Not unless you want to make the
console log available from the internet...not something I'd
be real comfortable with.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
