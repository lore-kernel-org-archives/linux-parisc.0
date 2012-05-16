From: Helge Deller <deller@gmx.de>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Wed, 16 May 2012 21:07:54 +0200
Message-ID: <4FB3FB0A.4070208@gmx.de>
References: <4FA9975C.5060708@bergerie>	 <41786065.U2qKzXR3uX@donald.sf-tec.de> <4FAA9382.7040802@bell.net>	 <4FAADE2A.9080803@bergerie> <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl>	 <4FAEE943.2030203@gmx.de> <BLU0-SMTP93504AF1AF0414C90D1EFB971A0@phx.gbl>	 <4FB182F8.2040403@gmx.de> <BLU0-SMTP728EA90F4400504B2AF7A4971A0@phx.gbl>	 <1337069366.3005.10.camel@dabdike.lan> <1337073212.3005.12.camel@dabdike.lan> <4FB2C411.4020408@bergerie>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: Vincent <vincent.stehle@laposte.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4FB2C411.4020408@bergerie>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 05/15/2012 11:01 PM, Vincent wrote:
> On 05/15/2012 11:13 AM, James Bottomley wrote:
> (..)
>> OK, I think this is the problem.  We have a depd instruction in do_alias
>> which is now in the _11 fault paths.
>>
>> This should be the fix, if someone wants to test it before I can get
>> around to building it.
> Hi James,
>
> This makes my hp712 boot now; congrats!
>
> Works for me with v3.4-rc6 and v3.4-rc7, with the following "patches pile":
>
> depd patch     (http://www.spinics.net/lists/linux-parisc/msg04169.html)
> sections patch (http://www.spinics.net/lists/linux-parisc/msg04091.html)
> cache patch    (http://www.spinics.net/lists/linux-parisc/msg04120.html)
> v3.4-rc7
I can confirm that the "sections patch" mentioned above is needed for my 
B160L as well.
It probably happens since I build a monolithic kernel with all needed 
modules built-in.

@James: Any chance to include this patch (or a similar one) into your 
fixes branch?

BTW, I still have issues with the B160L hanging after starting crond.... 
looking into it now...

Helge


