From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] pthread problems - test program
Date: Sun, 3 Apr 2005 16:24:33 -0400 (EDT)
Message-ID: <200504032024.j33KOXcu018402@hiauly1.hia.nrc.ca>
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

> The test program is in cvs in the userspace repository. It's called
> thread_test2.c. It creates threads one at a time, and uses condition
> variables for synchronization. On hppa the program will hang after some
> time, and ps shows a lot of zombie processes. On x86 the program runs as
> expected and there are no zombies.

I see threadfunc uses waitpid.  This is the same syscall that seems
to cause problems with expect (zombie expect child and parent waiting
for signal that never comes).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
