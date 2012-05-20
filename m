From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Sun, 20 May 2012 17:25:50 -0400
Message-ID: <BLU0-SMTP33779E3F5B5087F47880C2971C0@phx.gbl>
References: <4FA9975C.5060708@bergerie>     <41786065.U2qKzXR3uX@donald.sf-tec.de> <4FAA9382.7040802@bell.net>     <4FAADE2A.9080803@bergerie>   <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl>   <4FAEE943.2030203@gmx.de>   <BLU0-SMTP93504AF1AF0414C90D1EFB971A0@phx.gbl>   <4FB182F8.2040403@gmx.de>   <BLU0-SMTP728EA90F4400504B2AF7A4971A0@phx.gbl>     <1337069366.3005.10.camel@dabdike.lan>    <1337073212.3005.12.camel@dabdike.lan> <4FB29F13.5070801@bell.net>    <4FB2A58A.9050706@gmx.de> <4FB2AD78.1020002@bell.net>    <4FB2B2A2.2020207@bell.net> <4FB2B5B1.7000604@gmx.de>    <4FB2B71B.7090602@bell.net> <4FB2BC5F.3080905@gmx.de>    <4FB2C129.90307@bell.net> <4FB550F1.7080104@gmx.de>   <1337328744.2938.5.camel@dabdike.int.hansenpartnership.com>   <4FB6BA76.6010101@gmx.de>  <1337508060.2682.13.came
 l@dabdike.int.hansenpartnership.com>  <4FB941EF.4060304@gmx.de> <1337544924.2682.21.camel@dabdike.int.hansenpartnership.com> <4FB95D75.1020705@gmx.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Vincent <vincent.stehle@laposte.net>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4FB95D75.1020705@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 20-May-12, at 5:09 PM, Helge Deller wrote:

> Just to make sure, I just wanted to build the same kernel now for  
> 64bit...
> Sadly hppa64-ld crashes for me...

Please file a bug report ;(

I haven't tested binutils for some time...

Suggest using 2.22 branch for now.

Dave
--
John David Anglin	dave.anglin@bell.net



