Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id B45C6489B
	for <parisc-linux@lists.parisc-linux.org>; Sun, 28 Sep 2003 11:13:40 -0600 (MDT)
Message-ID: <3F7716BE.8030008@tiscali.be>
Date: Sun, 28 Sep 2003 17:13:34 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org,
	James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] Re: zalon/ncr53c720 (linux-2.6.0-test5-pa22) broken
 on C110
References: <3F76A312.8090603@tiscali.be> <20030928122414.GF24824@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20030928122414.GF24824@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Matthew Wilcox wrote:

>On Sun, Sep 28, 2003 at 09:00:02AM +0000, Joel Soete wrote:
>  
>
>>I am sure there is no hw pb because after that test I can always reboot 
>>with 2.6.0-test5-PA6:
>>    
>>
>
>This is good to hear.
>
>  
>
>>Can somebody could help me to find patches (step by step) applied on 
>>this driver from -pa6 to -pa22?
>>    
>>
>
>Yes.  Could you start with -pa18 (or -pa20)?
>http://cvs.parisc-linux.org/download/linux-2.6/patch-2.6.0-test5-pa18.gz
>
Thanks Matthew,
(why didn't I think myself ;) )

>(or cvs up -rCVS260_TEST5_PA18)
>
>The driver is rev 1.5 in -test5-pa6.  rev 1.6 is in -test5-pa18.
>After -test5-pa20, we don't have anyautotagged stuff, but let's start
>with -pa18.
>  
>
Ok I will look and advise you,

Joel
