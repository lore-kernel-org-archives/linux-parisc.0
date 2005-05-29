From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] c3k panics
Date: Sat, 28 May 2005 21:41:40 -0400 (EDT)
Message-ID: <200505290141.j4T1ffhI006449@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
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

I can panic my c3750 very consistently running the binutils testsuite
(cvs source as of 20050526).  I've tried many of the default kernels
to see if I could isolate when the problem was introduced.  The last
kernel that seems unaffected is 2.6.8.1-pa11.  The problem is present
in 2.6.12-rc5-pa0 and 2.6.11-pa4.

The sad part is that panic is also broken and no error messages are
produced when the fault occurs.  Before adding panic=180 to the command
line, pressing TOC just yielded a register dump for panic itself.  That's
not too useful.  In my testing, the last working panic dump was with
2.6.9-pa1 which faulted with a HPMC during boot.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
