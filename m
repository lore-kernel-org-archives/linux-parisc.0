From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] linux-2.6.10-pa1 panic on C360 in SCSI driver
Date: Wed, 29 Dec 2004 16:54:30 -0500
Message-ID: <200412291654.31001.vapier@gentoo.org>
References: <200412260504.40205.vapier@gentoo.org>
	<1104355710.5298.16.camel@mulgrave>
	<200412291649.29411.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200412291649.29411.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wednesday 29 December 2004 04:49 pm, Mike Frysinger wrote:
> attached

oh, and just so there's no misunderstanding ... this output in dmesg is 
normal:
 sdb: unknown partition table

i formatted /dev/sdb as an ext3 filesystem instead of partitioning it 
first ...
-mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
