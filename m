From: John David Anglin <dave.anglin@bell.net>
Subject: Re: SCSI bug
Date: Sun, 21 Feb 2016 17:08:52 -0500
Message-ID: <B4B72966-4F44-4ECD-B8C5-464ADF145BB4@bell.net>
References: <28D5FC66-A9E6-4F3E-A8AC-F9E68A6BC543@bell.net> <82D4BF6F-05CF-4441-9530-79475BFF84F3@bell.net> <E2C8DBC2-F0AD-4C78-BD63-9C85B387E284@bell.net> <56C8E1AC.3030409@gmx.de> <038473FE-9E6D-4F03-BBD4-9844B7B529E1@bell.net> <9C42B388-96D5-412A-BAC3-14E93415CA21@bell.net> <1456026424.2268.5.camel@HansenPartnership.com> <14EF1F4E-8045-4990-B29E-D489E82B1929@bell.net> <1456078381.2340.5.camel@HansenPartnership.com> <D14AFC12-8245-4862-9FFA-92A4F114FC41@bell.net> <1456081676.2340.10.camel@HansenPartnership.com> <56CA11D2.3020900@gmx.de> <1456086490.2340.18.camel@HansenPartnership.com> <28582474-5AB3-4022-86FE-E823F5990623@bell.net> <56CA2982.1030607@gmx.de> <1456091379.2340.22.camel@HansenPartnership.com>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1456091379.2340.22.camel@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2016-02-21, at 4:49 PM, James Bottomley wrote:

> OK, can you instrument the same thing in ll_new_hw_segment() after 
> 
> 	req->nr_phys_segments += nr_phys_segs;

This didn't trigger either.   In this boot, we had a bad address:

Bad Address (null pointer deref?): Code=15 regs=000000007c5c5260 (Addr=0000010a)

here:
 IAOQ[0]: blk_rq_map_sg+0x364/0x670                                             
 IAOQ[1]: blk_rq_map_sg+0x368/0x670                                             
 RP(r2): blk_rq_map_sg+0x358/0x670                                              

Dave
--
John David Anglin	dave.anglin@bell.net



