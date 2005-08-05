From: dann frazier <dannf@hp.com>
Subject: Re: [parisc-linux] paer.debian.org crash in ext3_write_inode()
Date: Fri, 05 Aug 2005 14:47:18 -0600
Message-ID: <1123274838.9036.57.camel@krebs.dannf>
References: <1123204638.3628.132.camel@krebs.dannf>
	<20050805195306.GS9703@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050805195306.GS9703@systemhalted.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, 2005-08-05 at 15:53 -0400, Carlos O'Donell wrote:
> On Thu, Aug 04, 2005 at 07:17:18PM -0600, dann frazier wrote:
> > fyi, paer.debian.org was reported down.  The GSP's console log
> > follows.  
> > 
> > dannf@paer:~$ uname -a
> > Linux paer 2.6.8-2-64 #1 Tue Feb 8 05:54:00 EST 2005 parisc64 GNU/Linux
> 
> No register dump? That is the most interesting and usefull piece of
> information :(

Yeah; we really should be logging the console while its acting up...
I'll try to set that up.


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
