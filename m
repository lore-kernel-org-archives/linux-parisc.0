From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Sun, 13 May 2012 20:52:09 -0400
Message-ID: <BLU0-SMTP37F9217C99E15B1D9EF026971A0@phx.gbl>
References: <4FA9975C.5060708@bergerie> <4FAADE2A.9080803@bergerie> <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl> <2075347.T446pQRFvO@donald.sf-tec.de> <20120513163220.0537f384@epia.jer-c2.orkz.net>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: linux-parisc@vger.kernel.org,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	Vincent <vincent.stehle@laposte.net>
To: Jeroen Roovers <jer@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20120513163220.0537f384@epia.jer-c2.orkz.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 13-May-12, at 10:32 AM, Jeroen Roovers wrote:

> I
> can't say it's actually running faster on either system because I
> simply didn't test for that change.

You will only see a significant performance improvement on PA8800/PA8900
machines with the 32 MB cache.

I believe other machines will see an improvement in thread support.   
However,
there is still more to fix in this area.

Dave
--
John David Anglin	dave.anglin@bell.net



