From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: PA8800 Status (Happy New Year)
Date: Tue, 2 Jan 2007 20:55:49 -0500 (EST)
Message-ID: <200701030155.l031tnmO019463__48514.5686580383$1416624247$gmane$org@hiauly1.hia.nrc.ca>
References: <200701030141.l031fgxn019232@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200701030141.l031fgxn019232@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Jan 2, 2007 08:41:42 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

>     4031104c:   4a 9c 01 e8     ldw f4(r20),ret0
> 
> It seems like there must be some way to get to 4031104c avoiding the
> on r20/ret0.  Don't see any branches to the region between 40311024
> and 40311044 in the function, or any other direct branches to 4031104c.

Sorry, I was thinking this was a null pointer deref.  Actually, it would
appear to be a misaligned load.  r20 contains 0x3c353e25733a2046.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
