Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id A727B4831
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 18 Apr 2004 10:36:12 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i3IGa3a29154; Sun, 18 Apr 2004 12:36:03 -0400
Subject: Re: [parisc-linux] Re: kernel>=2.6.4-rc3 hung or panic on C1[18]0
	[was: 2.6.5-rc2-pa2 boot panic on c110 :(]
From: James Bottomley <James.Bottomley@steeleye.com>
To: Joel Soete <soete.joel@tiscali.be>
In-Reply-To: <40829331.6040905@tiscali.be>
References: <407DA495.1090009@tiscali.be>
	<40711E5500006381@ocpmta2.freegates.net>
	<26419.193.161.152.244.1082114391.squirrel@www.puszczka.com>
	<4081731B.7070006@tiscali.be>
	<32875.127.0.0.1.1082234959.squirrel@www.puszczka.com>
	<4081A280.8050108@tiscali.be> <4081B70F.6060003@tiscali.be>
	<40829331.6040905@tiscali.be>
Content-Type: text/plain
Date: 18 Apr 2004 11:36:02 -0500
Message-Id: <1082306164.2195.27.camel@mulgrave>
Mime-Version: 1.0
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

On Sun, 2004-04-18 at 09:39, Joel Soete wrote:
> I presume that wrong stuff come from the ccio_fill_pdir() or ccio_coalesce_chunks() merge with lba one?
> But I don't have yet more accurate idea on what went wrong here (difference between functions are important).
> 
> (would it help to rebuild this same kernel tree with gcc-3.0 32bit would help? right now is was build with latest gcc-3.3.3.)
> 
> Grant, James any idea?

Well, actually, the problem can't be in the code you cite, otherwise my
raven wouldn't work either and it's been fine.

However, it's entirely possible that the effects of the patch are
causing issues in the ncr driver.  What it does is correctly coalesce
segments in the iommu.  Before this, the parisc iommus rarely did
coalescing, so our SG lists were usually lots of page sized entities. 
Now the individual entries can be up to 256k long.

I suspect, since your C110 has a 53c720 (using the ncr driver) and my
C360 has a 53c875 (using sym_2) that the ncr driver can't cope with sg
lists whose entries are so long.

The problems are probably due to some sort of fixed length assumption on
sg elements in the ncr driver.

James
