From: John David Anglin <dave.anglin@bell.net>
Subject: Re: HP-UX for C8000
Date: Thu, 2 Nov 2017 13:45:56 -0400
Message-ID: <046a3593-c5af-e3ae-0901-a0c5d6f55a75@bell.net>
References: <D582C6C6-78B5-44F4-9705-B4723B651D8E@bell.net>
 <45425BF6-26D1-4232-957D-F3F057A8966A@bell.net>
 <d6efa26f-9daf-a42f-c4e8-a2f050faf322@gmx.de>
 <8A61C252-CA15-44AB-9225-EAA6C259E872@bell.net>
 <20171009174146.GA21988@alpha.franken.de>
 <7521862C-4EC7-47F5-AFF9-41A44775CFAB@bell.net>
 <20171010184621.GA18582@alpha.franken.de>
 <5CF7B86C-F92C-4CED-8A90-A11ABCFBE6B4@bell.net>
 <945027596.2687.1509587833744.JavaMail.zimbra@basstech.net>
 <9774ee1b-850d-bba3-774c-ee923fa76f64@bell.net>
 <20171102163831.GA14357@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: Brendan Horan <brendanhoran@basstech.net>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: Tom Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20171102163831.GA14357@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-11-02 12:38 PM, Tom Bogendoerfer wrote:
> in fact I've made some progress today. I now have a loadable module,
> which dumps whatever I want, when it's loaded. And the first thing
> I've detected is that I'm missing a package named Graphics Technical
> Computing Environment and that a radeon 7000 card will not use
> DMA over AGP (which means I have to install a firegl in my test machine).
That's excellent news.  It looks as if one can download it if one 
creates an HPE account:
https://h20392.www2.hpe.com/portal/swdepot/displayProductInfo.do?productNumber=B6268AA

Dave

-- 
John David Anglin  dave.anglin@bell.net

