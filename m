From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Let's Try Something New(tm)
Date: Sat, 17 Feb 2007 23:24:56 +0100
Message-ID: <200702172324.57167.deller__12373.1494335972$1416624296$gmane$org@gmx.de>
References: <20070217064648.GA2880@athena.road.mcmartin.ca>
	<20070217103018.GD26273@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070217103018.GD26273@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Kyle,

On Saturday 17 February 2007, Grant Grundler wrote:
> On Sat, Feb 17, 2007 at 01:46:48AM -0500, kyle mcmartin wrote:
> > And, well, I'm kind of getting sick of it. I propose for at least the next
> > few months, instead of everyone being able to pollute the shared tree, they
> > keep all their work in branches. Instead of merging or pushing, or whatever,
> > you can send the patches to the list for review. This will work more or less
> > like linux-kernel does, hopefully. 
> 
> Ok. Fair enough. Well said. 

Fine with me as well.

Thanks for the merging Kyle !

Helge


> Can someone with more git experience than I 
> have share a recipe for creating and committing to a git branch?
> Maybe post that on one of the existing HOW-TO web pages or a new wiki page?
> 
> And yes, the fact that SMP is broken bothers me too.
> I've spent some time looking at the cpu_possible_map patch pointed
> out by james bottomly (IIRC) and I haven't figure out why that
> has the impact that it does.
> 
> I also haven't had time to dig more into why the schedule is
> only running things on CPU 0.
> 
> thanks,
> grant
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
