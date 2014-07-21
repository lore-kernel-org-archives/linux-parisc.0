From: "Helge Deller" <deller@gmx.de>
Subject: Re: struct sigaction sa_restorer field
Date: Mon, 21 Jul 2014 10:25:46 +0200
Message-ID: <trinity-72a99ebc-405d-44c1-8c8b-0a04a9b401b3-1405931146850@3capp-gmx-bs43>
References: <BLU436-SMTP205700FFA476092032AE8BA97F30@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: "linux-parisc List" <linux-parisc@vger.kernel.org>
To: "John David Anglin" <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU436-SMTP205700FFA476092032AE8BA97F30@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Dave,

> The sa_restorer field is obsolete and not in the hppa struct  
> sigaction, but we still define SA_RESTORER.  What should be done?

Basically to not break userspace we can't (and shouldn't) add the sa_restorer struct member.
So, the only option would be to drop the SA_RESTORER #define, right?
But I have no idea how and if this will break some builds, since the major arches seem to define SA_RESTORER...

Helge
