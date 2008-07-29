From: Rick Jones <rick.jones2@hp.com>
Subject: Re: Cupertino test ring problem?
Date: Tue, 29 Jul 2008 13:57:19 -0700
Message-ID: <488F842F.3040000@hp.com>
References: <1217254746.3503.61.camel@localhost.localdomain>	<20080728145712.GH18026@parisc-linux.org> <488DFD62.4080307@hp.com>	<20080728171500.GB16059@parisc-linux.org>  <488F777E.6090405@hp.com> <1217363136.6103.68.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: Matthew Wilcox <matthew@wil.cx>,
	Parisc List <linux-parisc@vger.kernel.org>,
	Richard Jones <rick.jones2@hp.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1217363136.6103.68.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


> gsyprf11 and gsyprf10 are still not responding to pings ... could the
> IP routings have changed or something?

 > I can't connect to port 22 on any of gsyprf3, gsyprf10 or gsyprf11.

Well, the IP's have remained the same, but the systems are physically in 
a different building.  Both netperf.org and ftp.cup.hp.com have moved 
from the same starting point to the same end-point.  If folks cannot 
ping them or cannot get to port 22 on those then there is still 
something amis in the network.  Otherwise there is still something amis 
with gsyprf[3|10|11].

rick jones


