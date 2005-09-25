From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Space registers and how to use them
Date: Sun, 25 Sep 2005 14:03:55 -0400 (EDT)
Message-ID: <200509251803.j8PI3tLI014517@hiauly1.hia.nrc.ca>
References: <20050925173513.GA22786@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050925173513.GA22786@colo.lackof.org> from "Grant Grundler" at
	Sep 25, 2005 11:35:13 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> John was just saying it doesn't matter since parisc-linux uses
> the same value in all four (sr4-7) space registers.

It's possible for user code to mess with sr4.  It's not a
privileged register.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
