From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Tue, 15 May 2012 17:08:08 -0400
Message-ID: <4FB2C5B8.80907@bell.net>
References: <4FA9975C.5060708@bergerie>  <41786065.U2qKzXR3uX@donald.sf-tec.de> <4FAA9382.7040802@bell.net>  <4FAADE2A.9080803@bergerie> <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl>  <4FAEE943.2030203@gmx.de> <BLU0-SMTP93504AF1AF0414C90D1EFB971A0@phx.gbl>  <4FB182F8.2040403@gmx.de> <BLU0-SMTP728EA90F4400504B2AF7A4971A0@phx.gbl>  <1337069366.3005.10.camel@dabdike.lan> <1337073212.3005.12.camel@dabdike.lan> <4FB29F13.5070801@bell.net> <4FB2A58A.9050706@gmx.de> <4FB2AD78.1020002@bell.net> <4FB2B2A2.2020207@bell.net> <4FB2B5B1.7000604@gmx.de> <4FB2B71B.7090602@bell.net> <4FB2BC5F.3080905@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Vincent <vincent.stehle@laposte.net>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4FB2BC5F.3080905@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 5/15/2012 4:28 PM, Helge Deller wrote:
> %sr2 does not work since it becomes a value unequal to zero later in 
> the boot process.

I think my cache patch is broken sr2 isn't always 0.  The only code that 
plays with sr2
seems to be in lib/memcpy.c.

Dave

-- 
John David Anglin    dave.anglin@bell.net

