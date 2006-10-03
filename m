From: Jeff Bailey <jbailey@raspberryginger.com>
Subject: [parisc-linux] check_ivt panic / binutils
Date: Mon, 02 Oct 2006 21:09:59 -0400
Message-ID: <1159837799.5737.7.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain;
  CHARSET=US-ASCII
To: parisc-linux@parisc-linux.org
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

I bisected the binutils CVS until I found the failure point.  It seems
that with 2006-04-30 I don't get the check_ivt failure (although the
kernel does die immediately after e100 is initialised), but at
2006-05-01, I get the check_ivt failure.

What's *really* annoying is that the only changes between the two appear
to be MIPS stuff.  http://people.ubuntu.com/~jbailey/binutils.patch or
"cvs diff -D 2006-04-30 -D 2006-05-01" to see what I mean.

My kernel config is at http://people.ubuntu.com/~jbailey/a500_config if
it's of any use.  I'm not sure what to look at next.

Tks,
Jeff Bailey

-- 
Although when you're in the situation that RMS is telling you that
you're being too ideological about freedom, maybe, just maybe, it's
true.
- Matthew Wilcox

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
