From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: Userland relocation problems resolved (was:
	kernel module relocat
Date: Thu, 2 Dec 2004 17:51:58 -0500 (EST)
Message-ID: <200412022251.iB2Mpwk6006738@hiauly1.hia.nrc.ca>
References: <200412022154.iB2Ls8ci007096@arbas.nms.ulrich-teichert.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: krypton@ulrich-teichert.org (Ulrich Teichert)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200412022154.iB2Ls8ci007096@arbas.nms.ulrich-teichert.org> from
	"Ulrich Teichert" at Dec 2, 2004 04:54:07 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I too have the problem of hanging 'expect' processes - now that I have =
> a
> new compiler, I should go for a newer kernel as well, I suppose ;-)

dave@hiauly6:~$ runtest --version
WARNING: Couldn't find the global config file.
Expect version is       5.42.1
Tcl version is          8.3
Framework version is    1.4.4

This is the most reliable configuration that I have found.  Tcl 8.4
is substantially worse.  Expect SEGVs on recent 64-bit SMP kernels in
the GCC testsuite.  I don't see the problem on 32-bit non-SMP kernels.
Sometimes java processes don't terminate although the testsuite
completes.  There is an issue with dejagnu asking tcl to trap SEGVs.
This causes tcl to try to restart expect after a SEGV.  The behavior
of signal is undefined in this situation and may cause the SEGV to
be repeated in an infinite loop.  You can fix this by editing dejagnu.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
