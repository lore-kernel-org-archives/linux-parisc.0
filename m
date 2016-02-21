From: John David Anglin <dave.anglin@bell.net>
Subject: Re: SCSI bug
Date: Sun, 21 Feb 2016 15:42:36 -0500
Message-ID: <249A5FDD-5668-4B8B-9ED0-C7C26EBC3AE6@bell.net>
References: <28D5FC66-A9E6-4F3E-A8AC-F9E68A6BC543@bell.net> <82D4BF6F-05CF-4441-9530-79475BFF84F3@bell.net> <E2C8DBC2-F0AD-4C78-BD63-9C85B387E284@bell.net> <56C8E1AC.3030409@gmx.de> <038473FE-9E6D-4F03-BBD4-9844B7B529E1@bell.net> <9C42B388-96D5-412A-BAC3-14E93415CA21@bell.net> <1456026424.2268.5.camel@HansenPartnership.com> <14EF1F4E-8045-4990-B29E-D489E82B1929@bell.net> <1456078381.2340.5.camel@HansenPartnership.com> <D14AFC12-8245-4862-9FFA-92A4F114FC41@bell.net> <1456081676.2340.10.camel@HansenPartnership.com> <56CA11D2.3020900@gmx.de>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <56CA11D2.3020900@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2016-02-21, at 2:36 PM, Helge Deller wrote:

> On 21.02.2016 20:07, James Bottomley wrote:
>> On Sun, 2016-02-21 at 13:43 -0500, John David Anglin wrote:
>>> I verified that commit 54efd50bfd873e2dbf784e0b21a8027ba4299a3e in
>>> linux-block fails to
>>> boot and commit 41609892701e26724b8617201f43254cadf2e7ae (blk-cgroup:
>>> Drop unlikely
>>> before IS_ERR(_OR_NULL)) does boot successfully.  Commit
>>> 41609892701e26724b8617201f43254cadf2e7ae
>>> is previous commit in tree.
>>> 
>>> I don't believe that the change can be reverted from Linus' tree as
>>> this commit allowed other
>>> stuff to be removed (see second paragraph of commit description).
>> 
>> OK, can you just verify you can boot 4.5-rc5 without the sata_sil24
>> driver?
> 
> I tried it on my c3000, debian kernel 4.4.2, in this case without the pata_ns87415.

Removing the sata_sil24 driver didn't help.  Problem still occurs with just scsi drivers.  All
remaining ata drivers were builtin.

Dave
--
John David Anglin	dave.anglin@bell.net



