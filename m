From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] pthread problems - test program
Date: Sun, 3 Apr 2005 15:07:32 -0400 (EDT)
Message-ID: <200504031907.j33J7Wba018023@hiauly1.hia.nrc.ca>
References: <20050403143246.GE8921@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050403143246.GE8921@tausq.org> from "Randolph Chung" at Apr 3,
	2005 07:32:46 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I don't know if this is related to some of the hanging problems Dave and
> doko have seen sometimes during gcc testing.... but our pthreads
> definitely seem to be a bit buggy :(

I was going to add Ada tasking to the list of pthread problems but
I just discovered that Ada hard codes signal numbers for linux and
some of our signal numbers are different from those used on x86.

I believe that our Java testsuite fails are probably pthread related.
I sometimes end up with Java programs that don't die when their
respective test completes.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
