From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: linux signal race fixes,
	patches against hppa tree, please te
Date: Tue, 31 Aug 2004 16:43:11 -0400 (EDT)
Message-ID: <200408312043.i7VKhBDp005965@hiauly1.hia.nrc.ca>
References: <200408310423.i7V4NXjb001644@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: James.Bottomley@steeleye.com,
 parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200408310423.i7V4NXjb001644@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Aug 31, 2004 00:23:33 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I've been running this now for three days on hiauly6 with a 32-bit
> 2.6.8.1-pa7 kernel (default c3000 config) doing almost continuous gcc
> builds.  Things seem pretty promising.  No random SIGSEGVs and expect
> seems to be behaving itself.

As usual, I have to eat my words.  The libjava "PR218 -O3 execution -
source compiled test" hung in the libjava testsuite on the next gcc
build.  Looking at libjava.log, I see that there is no "WARNING:
program timed out." message for this test.  Thus, the alarm signal
for this test somehow got lost.  The testsuite continued after I
killed PR218.exe.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
