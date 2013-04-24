From: Jeroen Roovers <jer@gentoo.org>
Subject: Re: Bug#706050: logrotate: spurious "error: getting file ACL"
 messages
Date: Wed, 24 Apr 2013 19:11:27 +0200
Message-ID: <20130424191127.3e010f69@marga.jer-c2.orkz.net>
References: <20130424110157.GA24835@thinkpad.nowster.org.uk>
	<BLU0-SMTP185E1C91F553E01372591697B50@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP185E1C91F553E01372591697B50@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 24 Apr 2013 07:27:11 -0400
John David Anglin <dave.anglin@bell.net> wrote:

> > and your kernel is responding with ENOSYS instead.  This contradicts
> > the manpage acl_get_fd(3):

Looks like [1], notified upstream at [2]. We shouldn't be issuing
ENOSYS at all here.


     jer


[1] https://bugs.gentoo.org/show_bug.cgi?id=460702
[2] http://lists.nongnu.org/archive/html/acl-devel/2012-12/msg00000.html
