Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7EB23483E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Nov 2003 11:35:16 -0700 (MST)
Message-ID: <3FAFDA75.7000906@tiscali.be>
Date: Mon, 10 Nov 2003 18:35:33 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Randolph Chung <tausq@debian.org>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] fdisk problems 2.4 <-> 2.6
References: <20031106222958.GJ26869@parcelfarce.linux.theplanet.co.uk> <3F969FFE000092BD@ocpmta2.freegates.net> <20031108015946.GC19436@colo.lackof.org> <3FACCC88.4010404@tiscali.be> <20031108194804.GA28929@colo.lackof.org> <3FAD6B1A.6060605@tiscali.be> <3FAE4639.6030200@tiscali.be> <20031109175735.GE2014@parcelfarce.linux.theplanet.co.uk> <3FAE8EA4.3050208@tiscali.be> <20031110044556.GB16478@colo.lackof.org> <20031110050732.GZ28967@tausq.org>
In-Reply-To: <20031110050732.GZ28967@tausq.org>
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


Randolph Chung wrote:
>>What is "%R2" intended to be?
>>Randolph pointed out this is broken before and I was wrong
>>to commit this chunk to the 2.4 tree (I'm working on
>>removing it now).
> 
> 
> Just a clarification:
> 
> %R2 is not *wrong* -- it points to the right side of argument register 
> 2 (jda explained this in an earlier thread), but I am not 100% sure 
> %R2 will do the right thing for a 32-bit build though -- if you are 
> running on a pa1.1 machine and the register is only 32-bit, does %R2 
> automatically do the right thing with 64-bit arguments?  I guess it's 
> easy enough to tell by looking at the code gcc generates...
> 

Good idea and just for curiosity (i don't want to insist to maintain 
some line of code which soon or later would have to be change ), I can 
try to find back a test case I used to prepare. (Just be patient)

> anyway, i think we should stick with the inline version of the code
> too....
> 
> thx
> randolph

thx also for attention,
	Joel
