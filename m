From: Bartlomiej Ochman <fback@fback.net>
Subject: Re: [parisc-linux] [newbie] Where to start from?
Date: Wed, 01 Sep 2004 17:13:24 +0200
Message-ID: <4135E714.1000004@fback.net>
References: <4135CD63.9040507@fback.net> <4135D78B.8030805@tiscali.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="------------000401090107080208030402"
To: parisc <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4135D78B.8030805@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

This is a multi-part message in MIME format.
--------------000401090107080208030402
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Joel Soete wrote:

> Just to be sure that I well understand: do you mean that you tried the 
> same operation when runing 2.4.x and 2.6.x?
Yes, I tried to untar kernel source both under 2.4 and 2.6. No 
difference, if it was stock, or custom compiled kernel. It hangs 
randomly under heavy disc load.

> The very first step would be that you send us a dmesg.
Attached. This particular kernel seems to be most stable on my machine, 
which surprises me after few months on the list.

> As it seems to be a disk pb: check the scsi chain [...]
I've double checked this, but everything seems to be fine.

> If you still have a diagnostic hp cd, boot with this one and check the 
> disks.
I'll try to figure out this, but I'm afraid the only CDs we have are 
with HP-UX 10.20 :(

This machine worked as network monitoring station with HP-UX/HP OV on 
it, it has never reported any problems with any disk.

Regards,
BO

--------------000401090107080208030402
Content-Type: application/gzip;
 name="dmesg.gz"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="dmesg.gz"

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
--------------000401090107080208030402
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--------------000401090107080208030402--
