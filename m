Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id DAB2C4829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  1 Nov 2002 14:47:36 -0700 (MST)
Message-Id: <200211012130.gA1LUof4014759@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Branch Prediction
To: grundler@dsl2.external.hp.com (Grant Grundler)
Date: Fri, 1 Nov 2002 16:30:49 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021027012303.7B576484E@dsl2.external.hp.com> from "Grant Grundler" at Oct 26, 2002 07:23:03 pm
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

> "John David Anglin" wrote:
> > I wonder if the PA-8700 in the rp2470 has it?
> 
> gsyprf11 is a 650Mhz PA8700. please try it.

I gave it a whirl.  As far as I can tell based on a small amount of testing,
there isn't any difference in performance using the branch target stack to
"accelerate" call returns.

So it may be that this feature like quad precision is not implemented.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
