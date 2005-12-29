From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] sym2 changes between 2.6.12 and 2.6.15
Date: Thu, 29 Dec 2005 16:24:21 -0500 (EST)
Message-ID: <200512292124.jBTLOLBw004004@hiauly1.hia.nrc.ca>
References: <7d01f9f00512291016k67676c59i759121abdfa0cf24@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: T-Bone@parisc-linux.org (Thibaut VARENE)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00512291016k67676c59i759121abdfa0cf24@mail.gmail.com>
	from "Thibaut VARENE" at Dec 29, 2005 07:16:19 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I recently got 2.6.15-rc7-pa0 booting up on my rp3440 and noticed sym
> wasn't initializing HDs as it previously was, in fact it was
> initializing in Narrow mode instead of wide:

Same on c3k with 2.6.15-rc6-pa1 versus 2.6.14-rc5-pa1:

2.6.15:
Dec 26 17:12:48 hiauly6 kernel:  target1:0:5: FAST-40 SCSI 40.0 MB/s ST (25 ns, offset 31)

2.6.14:
Dec 26 17:03:45 hiauly6 kernel:  target1:0:5: FAST-40 WIDE SCSI 80.0 MB/s ST (25 ns, offset 31)

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
