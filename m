From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Runing small structs from functions.
Date: Fri, 11 Mar 2005 10:39:38 -0500 (EST)
Message-ID: <200503111539.j2BFdcwL015273@hiauly1.hia.nrc.ca>
References: <20050311064850.GV4645@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050311064850.GV4645@tausq.org> from "Randolph Chung" at Mar 10,
	2005 10:48:51 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> gcc-3.3 also returns <=8 bytes structs in ret0/ret1. there are lots of
> gdb test cases to verify this.

Right, the ABI fix in the PA backend was made in 3.3.  I was referring
to earlier versions.  As noted in my previous message, there still
are issues with small structs in 3.3.  See this PR:
<http://gcc.gnu.org/bugzilla/show_bug.cgi?id=18956>.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
