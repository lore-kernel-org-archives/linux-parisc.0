From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] pthread_attr_getstack(): SEGV using ptr
	stack_addr - stack_size
Date: Sun, 16 Sep 2007 12:36:41 -0400 (EDT)
Message-ID: <200709161636.l8GGagbF025937__41765.7079328366$1416624442$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440709160917q1451a561i3e7724edfa89fedc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440709160917q1451a561i3e7724edfa89fedc@mail.gmail.com>
	from "Carlos O'Donell" at Sep 16, 2007 12:17:13 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I will look into this. Thanks Dave. Would you like a patch against the
> current debian glibc? The  patch I checkin upstream won't be much use
> for you :-)

Yes, please.

Something changed a couple of days ago to trigger this.  There might
be a kernel issue.  The two systems that I'm seeing this on are running
2.6.22.6.  gsyprf11 running 2.6.22.1 seems unaffected so far.  However,
the problem appeared sometime after updating to 2.6.22.6.  All systems
are running debian lenny.

Thanks,
Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
