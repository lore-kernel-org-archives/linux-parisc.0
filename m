Return-Path: <soete.joel@tiscali.be>
Received: from spoolo4.tiscali.be (spoolo4.tiscali.be [62.235.13.170])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0A2764832
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 18 Apr 2004 11:16:39 -0600 (MDT)
Message-ID: <4082B7F4.8000508@tiscali.be>
Date: Sun, 18 Apr 2004 17:16:36 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] Re: kernel>=2.6.4-rc3 hung or panic on C1[18]0
	[was: 2.6.5-rc2-pa2 boot panic on c110 :(]
References: <407DA495.1090009@tiscali.be>	<40711E5500006381@ocpmta2.freegates.net>	<26419.193.161.152.244.1082114391.squirrel@www.puszczka.com>	<4081731B.7070006@tiscali.be>	<32875.127.0.0.1.1082234959.squirrel@www.puszczka.com>	<4081A280.8050108@tiscali.be>
	<4081B70F.6060003@tiscali.be> <40829331.6040905@tiscali.be>
	<1082306164.2195.27.camel@mulgrave>
In-Reply-To: <1082306164.2195.27.camel@mulgrave>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>,
	Andy Walker <ajwalker@broadpark.no>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>



James Bottomley wrote:
> On Sun, 2004-04-18 at 09:39, Joel Soete wrote:
> 
>>I presume that wrong stuff come from the ccio_fill_pdir() or ccio_coalesce_chunks() merge with lba one?
>>But I don't have yet more accurate idea on what went wrong here (difference between functions are important).
>>
>>(would it help to rebuild this same kernel tree with gcc-3.0 32bit would help? right now is was build with latest gcc-3.3.3.)
>>
>>Grant, James any idea?
> 
> 
> Well, actually, the problem can't be in the code you cite, otherwise my
> raven wouldn't work either and it's been fine.
> 
> However, it's entirely possible that the effects of the patch are
> causing issues in the ncr driver.  What it does is correctly coalesce
> segments in the iommu.  Before this, the parisc iommus rarely did
> coalescing, so our SG lists were usually lots of page sized entities. 
> Now the individual entries can be up to 256k long.
> 
> I suspect, since your C110 has a 53c720 (using the ncr driver) and my
> C360 has a 53c875 (using sym_2) that the ncr driver can't cope with sg
> lists whose entries are so long.
> 
Yes that's also the main difference I noticed between c110 and c360.

> The problems are probably due to some sort of fixed length assumption on
> sg elements in the ncr driver.
> 
Ok, I now better understand inter-action between ccio and ncr drivers and I check in more detail this code.

Thanks a lot for all,
	Joel
