Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8D5594829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 25 Jan 2003 22:09:53 -0700 (MST)
Message-Id: <200301260509.h0Q59ntl001762@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] new gcc-default for hppa
To: grundler@dsl2.external.hp.com (Grant Grundler)
Date: Sun, 26 Jan 2003 00:09:49 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: jsoe0708@tiscali.be, parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org
In-Reply-To: <20030126044656.GB6057@dsl2.external.hp.com> from "Grant Grundler" at Jan 25, 2003 09:46:56 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> Any advice on comparing .o's? or rather compare .S files?

You could try using "objdump -d" on the .o's, then diff'ing.  However
the diff might be large.  Probably, comparing .S files would be
best.  Don't use "-g".  However, if you find a difference that looks
suspicious, "-g" will help you locate the source line.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
