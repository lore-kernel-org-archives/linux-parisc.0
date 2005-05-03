From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: yet another ssm/rsm/rfi question [Was: [parisc-linux] head.S: a
Date: Tue, 3 May 2005 13:40:06 -0400 (EDT)
Message-ID: <200505031740.j43He6jI005240@hiauly1.hia.nrc.ca>
References: <20050503172353.GA23515@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050503172353.GA23515@colo.lackof.org> from "Grant Grundler" at
	May 3, 2005 11:23:53 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > but I am surprised to not find the 8 nops between rfi and label.
> 
> AFAICT, the NOPs are pointless. The RFI better not return or we
> have more serious problems (e.g. HW failure).

Same here.  On the otherhand, the might have been added to avoid
problems with the instruction pipeline when executing an rfi.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
