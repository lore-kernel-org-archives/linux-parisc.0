From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] -pie is broken on hppa
Date: Sat, 30 Jun 2007 13:51:49 -0400 (EDT)
Message-ID: <200706301751.l5UHpnrw011062__1000.03481279618$1416624404$gmane$org@hiauly1.hia.nrc.ca>
References: <20070630165455.GA465@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: matthew@wil.cx,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070630165455.GA465@fattire.cabal.ca> from "Kyle McMartin" at
	Jun 30, 2007 12:54:55 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Sat, Jun 30, 2007 at 11:44:13AM -0400, John David Anglin wrote:
> > > Could you try this patch?
> > 
> > I installed it last night.  svn works, gcc bootstraps and I haven't
> > seen any other problems.  There was a problem building libjava with
> > the getdents bug.
> >
> 
> OK. I'll try to build a HEAD kernel and boot with an old glibc to see if
> it fucks up. Is there a really easy testcase I can try to reproduce
> this?

I phrased my response badly.  I haven't seen any new problems and
the change fixes the libjava build problem.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
