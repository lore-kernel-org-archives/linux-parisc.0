Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3A246484E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Jun 2002 09:26:12 -0600 (MDT)
Message-Id: <200206111504.g5BF41vN021790@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 2.4.18-pa35 SMP process hangs on a J200
To: randolph@tausq.org
Date: Tue, 11 Jun 2002 11:04:01 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: mszick@goquest.com, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020611145848.GA2796@tausq.org> from "Randolph Chung" at Jun 11, 2002 07:58:48 am
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

> It's interesting to note that even with a UP kernel on the rp2470, the
> kernel doesn't seem to be very stable (though better than SMP).... I
> think we are looking at multiple bugs here.....

Quite likely.  The A500 seemed more stable.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
