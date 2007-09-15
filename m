From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] pthread_attr_getstack(): SEGV using ptr stack_addr -
	stack_size
Date: Sat, 15 Sep 2007 14:32:31 -0400 (EDT)
Message-ID: <200709151832.l8FIWWBw007130__4877.285360317$1416624442$gmane$org@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Carlos,

We have a problem with libjava.  The details are here:
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=33442

The problem seems to be pthread_attr_getstack.  It looks like
we aren't rounding the returned stack_addr value correctly to
ensure that stack_addr - stack_size is equal to or larger than
the stack base for a thread.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
