From: John David Anglin <dave.anglin@bell.net>
Subject: Re: SCSI bug
Date: Sat, 20 Feb 2016 15:13:04 -0500
Message-ID: <82D4BF6F-05CF-4441-9530-79475BFF84F3@bell.net>
References: <28D5FC66-A9E6-4F3E-A8AC-F9E68A6BC543@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <28D5FC66-A9E6-4F3E-A8AC-F9E68A6BC543@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2016-01-23, at 1:00 PM, John David Anglin wrote:

> WARNING: at block/blk-merge.c:454

With linux-image-4.4.0-1-parisc64-smp on c3740, the above warning is the last message I see.
Kernel seems to hang at that point.  This is warning code:

        /*
         * Something must have been wrong if the figured number of
         * segment is bigger than number of req's physical segments
         */
        WARN_ON(nsegs > rq->nr_phys_segments);

Dave
--
John David Anglin	dave.anglin@bell.net



