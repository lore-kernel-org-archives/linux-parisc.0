From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 2.6.14-rc1 [Was: 2.6.13-pa1 + mm1 relayfs +
Date: Tue, 13 Sep 2005 18:40:47 -0400 (EDT)
Message-ID: <200509132240.j8DMelH6005528@hiauly1.hia.nrc.ca>
References: <200509131508.j8DF8i72016209@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200509131508.j8DF8i72016209@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Sep 13, 2005 11:08:44 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I tried the prebuilt binary on my c3k yesterday evening.  It hung
> within an hour or so running the GCC 4.1 testsuite.

Based on the TOC dump, this hang appears to have been caused by
a loop in do_page_fault.  The code was in find_vma_prev ().

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
