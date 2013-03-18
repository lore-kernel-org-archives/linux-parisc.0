From: Jeroen Roovers <jer@gentoo.org>
Subject: Re: PA8800 with 3.9.0-rc1-JeR-10942-g6dbe51c : WARNING: at
 lib/timerqueue.c:74
Date: Mon, 18 Mar 2013 13:58:31 +0100
Message-ID: <20130318135831.7c14b6e7@marga.jer-c2.orkz.net>
References: <20130315152226.46ad0993@marga.jer-c2.orkz.net>
	<BLU0-SMTP3801FFE58A0BCC9C8836A597EE0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP3801FFE58A0BCC9C8836A597EE0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 16 Mar 2013 18:34:17 -0400
John David Anglin <dave.anglin@bell.net> wrote:

> On 15-Mar-13, at 10:22 AM, Jeroen Roovers wrote:
> 
> > [    7.912000] WARNING: at lib/timerqueue.c:74
> 
> Is this reproducible?  I have seen the occasional RB issue but I've
> never been able to reproduce them.

Yes. Every time I boot this kernel with Helge's patches, built with
the previously attached config, it trips on this very same issue.


     jer
