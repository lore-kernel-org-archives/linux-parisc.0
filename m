Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from jaguar.mkp.net (jaguar.mkp.net [66.11.169.42])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6F3874890
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Mar 2003 09:36:00 -0700 (MST)
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	Jan-Benedict Glaw <jbglaw@lug-owl.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] FC driver?
From: "Martin K. Petersen" <mkp@mkp.net>
References: <3E68A12A00002910@ocpmta3.freegates.net>
	<20030317111801.GF17073@lug-owl.de>
	<20030317161445.GA31378@dsl2.external.hp.com>
	<1047918143.14507.18.camel@beavis.ybsoft.com>
Date: 17 Mar 2003 11:36:49 -0500
In-Reply-To: <1047918143.14507.18.camel@beavis.ybsoft.com>
Message-ID: <yq1vfyine5a.fsf@austin.mkp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

>>>>> "Ryan" == Ryan Bradetich <rbradetich@uswest.net> writes:

>> cpqfc code suggests it supports all Tachlite HBAs.  But it depends
>> on GBIC/HBA configuration and HPUX folks haven't been interested in
>> making cpqfc work with their XL2 HBA.  Jes Sorensen/Martin Petersen
>> did get older (5100/5166) TL HBAs from HP working with cpqfc
>> driver.

Ryan> On parisc?  I've had trouble with it running on my C200.  Maybe
Ryan> it is time to try it again.  I know Jes and Martin worked on it
Ryan> for i386..

I got a TL going on x86 way back.  Have not tried it on PA-RISC.

Also, the cpqfc driver could do with a serious cleanup.

I gave up beating it into shape and started working on a new driver.
But I'm swamped elsewhere and haven't touched it for a while.

-- 
Martin K. Petersen      http://mkp.net/
