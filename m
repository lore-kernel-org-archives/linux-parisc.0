From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Wed, 16 May 2012 15:59:26 +0100
Message-ID: <1337180366.2985.81.camel@dabdike.int.hansenpartnership.com>
References: <4FA9975C.5060708@bergerie>
	  <41786065.U2qKzXR3uX@donald.sf-tec.de> <4FAA9382.7040802@bell.net>
	  <4FAADE2A.9080803@bergerie> <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl>
	  <4FAEE943.2030203@gmx.de> <BLU0-SMTP93504AF1AF0414C90D1EFB971A0@phx.gbl>
	  <4FB182F8.2040403@gmx.de> <BLU0-SMTP728EA90F4400504B2AF7A4971A0@phx.gbl>
	  <1337069366.3005.10.camel@dabdike.lan>
	 <1337073212.3005.12.camel@dabdike.lan> <4FB29F13.5070801@bell.net>
	 <4FB2A58A.9050706@gmx.de> <4FB2AD78.1020002@bell.net>
	 <4FB2B2A2.2020207@bell.net> <4FB2B5B1.7000604@gmx.de>
	 <4FB2B71B.7090602@bell.net> <4FB2BC5F.3080905@gmx.de>
	 <4FB2C129.90307@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Helge Deller <deller@gmx.de>, Vincent <vincent.stehle@laposte.net>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4FB2C129.90307@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2012-05-15 at 16:48 -0400, John David Anglin wrote:
> On 5/15/2012 4:28 PM, Helge Deller wrote:
> > Will you send your patches to Linus as he requested in the other mail?
> You have the diff for the two PA 1.1 changes.  Suggest you send them.
> I think these should go to stable as well as soon as it is verified that all
> targets boot.
> 
> I think my cache-2 is more appropriate for linux-next.  There are a number
> of subtle issues with it.  I am pleased that the users that have tried 
> it have
> been generally happy with it.

So to be a patch for the linux kernel, it really needs to be divided up
into its components.  It looks like cache-2 is a combination of five or
six separate things, and each one needs a change long.

James


