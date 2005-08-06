From: dann frazier <dannf@hp.com>
Subject: Re: [parisc-linux] paer.debian.org crash in ext3_write_inode()
Date: Sat, 06 Aug 2005 09:21:49 -0600
Message-ID: <1123341709.10768.1.camel@localhost>
References: <1123204638.3628.132.camel@krebs.dannf>
	<20050805195306.GS9703@systemhalted.org>
	<1123274838.9036.57.camel@krebs.dannf>
	<20050806051432.GA21031@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Carlos O'Donell <carlos@systemhalted.org>,
 parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050806051432.GA21031@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, 2005-08-05 at 23:14 -0600, Grant Grundler wrote:
> On Fri, Aug 05, 2005 at 02:47:18PM -0600, dann frazier wrote:
> > > No register dump? That is the most interesting and usefull piece of
> > > information :(
> > 
> > Yeah; we really should be logging the console while its acting up...
> > I'll try to set that up.
> 
> pear is an a500?
> 
> If so, "cl" from the GSP will dump the last couple hundred lines
> of console output.

right, that output is in my first message.


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
