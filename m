From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Remove __ldcw_align for PA-RISC 2.0 processors
Date: Thu, 9 Jun 2005 10:29:24 -0400 (EDT)
Message-ID: <200506091429.j59ETPwv008987@hiauly1.hia.nrc.ca>
References: <20050609054700.GA9450@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: kyle@fattire.cabal.ca,
 parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050609054700.GA9450@colo.lackof.org> from "Grant Grundler" at
	Jun 8, 2005 11:47:00 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Just need to add ",co" to __ldcw() and we should be good.
> That might need to be "ifdef CONFIG_PA20" as well...it's been
> a while since we've had this conversion on parisc-linux mailing list.

Yes, you need ",co" to get rid of the 16-byte alignment requirement.
This causes the operation to be done in cache which is a performance
win.  I think this is safe for SMP.  While the ",co" completer was
added in PA 1.1, it wasn't required that it be supported.  Thus,
I think we are stuck with 16-byte alignment on PA 1.1.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
