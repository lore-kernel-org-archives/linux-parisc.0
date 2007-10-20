From: Joel Soete <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] [patch 2/2] backport of sba sg list management
	to ccio-dma
Date: Sat, 20 Oct 2007 17:21:44 +0000
Message-ID: <471A3928.8040603__28056.0790365145$1416624647$gmane$org@scarlet.be>
References: <4714E800.50709@scarlet.be>
	<20071017184416.GB11502@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20071017184416.GB11502@fattire.cabal.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Kyle,

Hppay that you finaly receive it ;-)
(btw sorry for boucing)

Kyle McMartin wrote:
> On Tue, Oct 16, 2007 at 04:34:08PM +0000, Joel Soete wrote:
>> And here is the main hunk:
>>
>> This consist of 'backporting' to ccio of the most of Grant's work on sg list
>> management of sba-iommu.
>>
>> According to some stress test on d380 it makes ncr driver more stable; 
>> improve
>> network perf on my d380 (from 110 to 430 kb/s);
>> (would allow in a next step merge some hunk of sba code in iommu-helper.h)
>>
> 
> A long time ago (a couple months?) I merged large swaths of ccio and sba
> code... unfortunately, it caused an almost measurable (~2-5%) loss of
> performance on networking and scsi throughput...
> 
On network it's sure this one is a measarable improvement ;-)
Otoh for scsi I mainly record a improvement of stability (but I will try more measure)

> I probably lost the code when my j6000 disk failed,
too bad

> but I'll probably
> have another crack at it someday.
> 
hope so.

> Anyway, the patch looks good, but it needs a bit of testing, so I think
> we'll wait for 2.6.25 to merge it?
> 
I hope too more testing, I can just test on my d380 (my c110 seems to be in bad status: after each reboot it makes a fsck 
and lost many files :_( ???)

> Regards,
> 	Kyle
> 
> 
Tx,
	J.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
