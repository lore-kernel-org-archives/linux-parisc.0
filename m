Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id DE79C4872
	for <parisc-linux@lists.parisc-linux.org>; Wed, 27 Nov 2002 09:44:58 -0700 (MST)
Message-Id: <200211271644.gARGiqeA027151@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Disk problems
To: james@compusmithllc.com (James Smith)
Date: Wed, 27 Nov 2002 11:44:52 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: jsoe0708@tiscali.be, parisc-linux@lists.parisc-linux.org
In-Reply-To: <1038415115.469.5.camel@seventy> from "James Smith" at Nov 27, 2002 11:38:34 am
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

> the cable length is less than 4ft & every other disk worked, including
> some of the same model

Have you tried reading with dd from raw device?  Try with a large bs and
count=1.  This should detect a funny block size.  You could also try building
the driver with debugging enabled.  This should give some idea as to
what's happening.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
