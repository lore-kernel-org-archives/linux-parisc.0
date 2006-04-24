From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Mon, 24 Apr 2006 18:40:45 -0400 (EDT)
Message-ID: <200604242240.k3OMejvf000119@hiauly1.hia.nrc.ca>
References: <200604241657.19464.mszick@morethan.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: mszick@morethan.org (Michael S. Zick)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604241657.19464.mszick@morethan.org> from "Michael S. Zick"
	at Apr 24, 2006 04:57:19 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Now overlay tables 6-7, 6-8, and 6-9 and note the relationship of cc=01 in all
> three tables.
> 
> ldw cc=01 <reserved>
> stw cc=01 <stw,bc >
> ldcw cc=01 <ldcw,co >
> 
> This is not an accident, in the days this cpu was designed, silicon did not
> grow on trees.
> 
> Read thee the paragraphs between table 6-8, and 6-9 - note the special
> significance of cache line byte[0] for stw,bc.

See.

> But finding that specificly for ldcw,co - even in en_HP - is beyond my
> abilities.

Possibly, you saw this in an ERS.

> I think I will go fishing with Joel,
> I am too old to stand for my orals now.

I thought I was the old guy here!

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
