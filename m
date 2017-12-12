From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Have my PA8800 back online...
Date: Tue, 12 Dec 2017 10:59:09 -0500
Message-ID: <c02fe6c5-9564-21ab-3012-a0a5d0509fc4@bell.net>
References: <2ADB5C8A-DFEB-4CA5-92BA-96E459A3575E@bell.net>
 <8314a5d6-7df7-3282-0d91-a9b414a122e0@web.de>
 <526274E4-88D8-4DF8-8F74-5B775186BBEC@bell.net>
 <cc22ee64-e9f3-aeb4-a9a0-a503f20f9634@web.de>
 <48320506-f7fa-822b-fb45-40eab1dbda02@bell.net>
 <17707adb-4f71-1d66-2a19-3cdfaff047f3@gmx.de>
 <53815372-58e8-70e2-bab4-1777e848cf5e@web.de>
 <79c110ec-2975-a827-4b9d-1351ab77779b@gmx.de>
 <d3c1e035-6486-c0b5-e87a-22d26c0c95f5@bell.net>
 <ccca0165-6c4a-97f3-2e0b-00657948c775@gmx.de>
 <897B27DE-04A1-4906-8DF2-C037393139C3@bell.net>
 <c7d0ee9d-0926-09a7-3a6d-22daf0c05a32@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Cc: Frank Scheiner <frank.scheiner@web.de>,
        debian-hppa@lists.debian.org,
        linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <c7d0ee9d-0926-09a7-3a6d-22daf0c05a32@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-12-11 9:46 AM, Helge Deller wrote:
> Strange. The attached patch does work for me on panama up until boot.
> Haven't tested what lspci reports afterwards...
Yes, it also works for me applied to v4.13.16.  ttyS1 is now ttyS0. 
Haven't tried boot
without console argument yet.

lspci still sees the hidden devices which I think is good.

I removed period from one of the dev_info strings.  We probably don't 
need printk's
that I added.

Dave

-- 
John David Anglin  dave.anglin@bell.net

