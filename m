From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Random crashes when calling git
Date: Tue, 08 Jan 2013 09:54:06 -0500
Message-ID: <50EC330E.7040603@bell.net>
References: <4882058.deuBGYmI4J@donald.sf-tec.de> <BLU0-SMTP552A5EEA5FEF5F4C363ADC97380@phx.gbl> <3563905.2dklDXemHT@donald.sf-tec.de> <BLU0-SMTP22C3BF8F11ED2FBDDA8BE6973C0@phx.gbl> <c1bad8b168dc885f7fe9aafa5712ece5@sf-mail.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Cc: linux-parisc@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <c1bad8b168dc885f7fe9aafa5712ece5@sf-mail.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 1/8/2013 9:30 AM, Rolf Eike Beer wrote:
> I was now able to run the CMake git test for more than a dozen times 
> in a row without a single failure and also the git testsuite is now in 
> the range of the 6000 with it's tests, which is far beyond anything it 
> was able to reach until now. So I think that your patch indeed makes 
> things better.
I have have built git several times and run the full testsuite successfully.
>
> Time to split it up and submit it upstream ;)
>
Helge has recently setup a new parisc-linux git tree on kernel.org and 
is going to help with
pushing patches upstream.  So, there is hope :-)

Dave

-- 
John David Anglin    dave.anglin@bell.net

