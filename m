From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] linux32 personality & config.guess
Date: Mon, 10 Sep 2007 19:07:02 -0400 (EDT)
Message-ID: <200709102307.l8AN726l019057__48603.5232003362$1416624439$gmane$org@hiauly1.hia.nrc.ca>
References: <20070910190052.GA1818@mix.mmjgroup.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: lamont@mmjgroup.com (LaMont Jones)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070910190052.GA1818@mix.mmjgroup.com> from "LaMont Jones" at
	Sep 10, 2007 01:00:52 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Thu, Sep 06, 2007 at 03:11:37PM -0400, Mike Frysinger wrote:
> > i'm not terribly familiar with the breadth of the parisc family, but isnt 
> > 64bit only available with 2.0 ?  so it'd be pretty clean on Linux to say: 
> > hppa64-*-linux-* means 64bit userland, everything else is 32bit
> 
> Also, with the current config.guess, personality is totally ignored in
> favor of looking at the processor model in /proc/cpuinfo.  Not a good
> answer.

Probably, something similar to that done on hpux is needed.  However,
maybe this should wait until the toolchain merging issues are clear
for linux.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
