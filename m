Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3DE59488A
	for <parisc-linux@parisc-linux.org>;
	Sat, 24 Jan 2004 14:15:49 -0700 (MST)
Message-Id: <200401242115.i0OLFjQ5009570@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] missing barrier in _raw_spin_lock?
To: soete.joel@tiscali.be (Joel Soete)
Date: Sat, 24 Jan 2004 16:15:44 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <4012DE98.9090605@tiscali.be> from "Joel Soete" at Jan 24,
	2004 09:07:36 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: arnd@arndb.de, parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> >> static int x;
> >> static spinlock_t lock;
> >>
> >> void test(void)
> >> {
> >>         if (x) {
> >>                 spin_lock(&lock);
> >>                 if (!x)
> >>                         x = 0x1234;
> >>                 spin_unlock(&lock);
> >>         }
> >> }

The test is wrong.  Static variables are initialized to 0.  So, the first
`if' is never true and the code will optimize to a return instruction.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
