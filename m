From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: [parisc-linux] Ubuntu hppa status
Date: Mon, 25 Apr 2005 00:35:35 +0200
Message-ID: <20050425003535.7d4496a6@Tatooine.r3z0>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: LaMont Jones <lamont.jones@ubuntu.com>
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

Hi pa-ckers

A quick "sounder" notice to let those of you who don't already know, that
LaMont Jones and myself are working in our spare time on porting Ubuntu
Linux (www.ubuntulinux.org) to hppa.

There's an unofficial website at http://ubuntu-hppa.pateam.org/ with some
data on the progress of that port.

Currently we have finished to (partially) build Hoary (almost all of
main, and most of universe, all in all we're approx 95% up-to-date), and
it's available for download. There are some installation instructions as
well since we don't have yet an installer, of course, these instructions
are reserved to "developers", knowledgeable people willing to
test/help/debug;)

We are now moving forward to get Breezy in shape, that implies in
particular fixing the installer, as well as a few other things (such as
bootstraping gcc-4.0, since Breezy will be built against gcc-4.0), and
fixing firefox (dies during post-install).

We should sort out an updated TODO list pretty soon (the one on the
website needs some refreshing :), so stay tuned.

Anyway, I just wanted to let you know that something was underway, and
that we might need some help in the near future ;)

Greetings

T-Bone
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
