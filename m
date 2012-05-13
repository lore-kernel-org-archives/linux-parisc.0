From: Jeroen Roovers <jer@gentoo.org>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Sun, 13 May 2012 16:32:20 +0200
Message-ID: <20120513163220.0537f384@epia.jer-c2.orkz.net>
References: <4FA9975C.5060708@bergerie>
	<4FAADE2A.9080803@bergerie>
	<BLU0-SMTP65CF901B170B044925E85897160@phx.gbl>
	<2075347.T446pQRFvO@donald.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
	John David Anglin <dave.anglin@bell.net>,
	Vincent <vincent.stehle@laposte.net>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <2075347.T446pQRFvO@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 10 May 2012 08:41:50 +0200
Rolf Eike Beer <eike-kernel@sf-tec.de> wrote:

> I think Guy Martin has the cache patch running on at least one of his 
> machines.

I have the patched code running on a C3650 (kernel 3.2.12) and a C8000
(kernel 3.3.5). Looks stable so far, after a few days of heavy use. I
can't say it's actually running faster on either system because I
simply didn't test for that change.


     jer
