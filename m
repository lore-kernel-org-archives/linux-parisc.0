From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Re: linux signal race fixes,
	patches against hppa tree, please te
Date: Thu, 2 Sep 2004 02:29:44 -0400
Message-ID: <20040902062944.GB32474@baldric.uwo.ca>
References: <200408310423.i7V4NXjb001644@hiauly1.hia.nrc.ca>
	<200408312043.i7VKhBDp005965@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James.Bottomley@steeleye.com,
 parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200408312043.i7VKhBDp005965@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Aug 31, 2004 at 04:43:11PM -0400, John David Anglin wrote:
> > I've been running this now for three days on hiauly6 with a 32-bit
> > 2.6.8.1-pa7 kernel (default c3000 config) doing almost continuous gcc
> > builds.  Things seem pretty promising.  No random SIGSEGVs and expect
> > seems to be behaving itself.
> 
> As usual, I have to eat my words.  The libjava "PR218 -O3 execution -
> source compiled test" hung in the libjava testsuite on the next gcc
> build.  Looking at libjava.log, I see that there is no "WARNING:
> program timed out." message for this test.  Thus, the alarm signal
> for this test somehow got lost.  The testsuite continued after I
> killed PR218.exe.

Losing signals under load is very bad, I don't see where or why this
might be happening. I don't really know what that test does, if it uses
compare_and_swap in any way then it's non-atomic and all sorts of bad
things could happen under load.

I'm still writing my paper, so I can't add the hooks in for this.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
